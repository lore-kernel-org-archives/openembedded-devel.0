Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE4265C7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 12:15:36 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 7C1B527D9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 13:15:29 +0100 (CET)
Message-ID: <54F848E3.2060209@pseudoterminal.org>
Date: Thu, 05 Mar 2015 13:15:31 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Question about building local sources without fetching
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2015 12:15:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

we have a system where sources for a recipe are present in the same tree 
as the corresponding .bb recipe. They are all in the same git repository.
So, something like this example:

./src/ < C++ sources >
./build/poky/meta
./build/poky/meta-our-layer/recipes-custom/our-software.bb

I realize this is unusual, since in such a setup, we don't actually 
fetch sources (since they are already present in the same tree).
With such a setup, one problem is to determine when OE should rebuild 
the package. That is, how it should detect a change. We use the revision 
(the hash) of the current head of the git repo, and set PV to that git 
revision. This way, whenever the head is moved, the revision changes, 
and so does PV.

This worked fine up to and including Danny. After Danny, the behavior 
changed. If we moved the head back to an earlier commit, bitbake would 
not notice, and produce a version from a later commit.

Here is the excerpt from our recipe that does this PV modification:



# PV_DEFAULT is defined in .inc file so that it can be overwritten by 
packaging scripts
# this is used when we do not have any git info

def git_run(cmd, path):
     (output, error) = bb.process.run(cmd, cwd=path)
     return output.rstrip()

def check_git_describe(path, default):
     import os
     import bb.process

     try:
         ver = git_run("git describe --tags --long", path)
     except Exception, exc:
         ver = default

     return ver


require streamapp_intree_version.inc
PV = "${@check_git_describe('${S}', '${PV_DEFAULT}')}"

PR = "r14"

PACKAGES = "${PN}-dbg ${PN}"

# FILE_DIRNAME contains the full path of this .bb recipe
# Since we are building in tree we know apriori the relative location of 
the src
S = "${FILE_DIRNAME}/../../../.."

# packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
PACKAGE_ARCH = "${MACHINE_ARCH}"


Does anybody have suggestions? Or, if somebody knows of a different way 
of doing builds from local sources, we'd like to hear about it.

