Return-Path: <vincent.libre@cryostase.eu>
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mail.openembedded.org (Postfix) with ESMTP id EB48F6FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 06:14:30 +0000 (UTC)
Received: from [192.168.1.159] (unknown [50.131.250.131])
	(Authenticated sender: vincent.rubiolo)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id CBDF119F4A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 07:14:29 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
From: Vincent Rubiolo <vincent.libre@cryostase.eu>
Message-ID: <8a55e15b-21d5-8dfa-5adb-09f84b7809fe@cryostase.eu>
Date: Thu, 29 Dec 2016 22:14:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
Subject: [meta-maker] Octoprint on Intel Edison (yocto dizzy): failed python-flask RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Dec 2016 06:14:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone,

I am trying to include the meta-maker layer to enable octoprint on the 
Intel Edison. I am using the Yocto project drop that Intel provides[1] 
and successfully built it (with a reduced set of packages, I am 
interested only in the bits necessary to enable Octoprint).

Intel drop appears to be based on the yocto daisy branch (bitbake 
reports so during a build + I diffed the meta-openembedded daisy git 
tree against the Intel drop). I have thus checked out that branch of 
meta-maker and added it under my poky subdirectory + added it to 
bblayers.conf.

The problem I have is that the build fails because of a missing RDEPENDS:
+++
$ bitbake octoprint -c fetchall
WARNING: Host distribution "Fedora-23" has not been validated with this 
version of the build system; you may possibly experience unexpected 
failures. It is recommended that you use a tested distribution.
Loading cache: 100% 
|####################################################################| 
ETA:  00:00:00
Loaded 2170 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for python-distribute-native 
(python-distribute-native, python-setuptools-native)
NOTE: consider defining a PREFERRED_PROVIDER entry to match 
python-distribute-native
ERROR: Nothing RPROVIDES 'python-flask' (but 
/yocto/iot-devkit-yp-poky-edison-20160606/build_edison/../poky/meta-openembedded/meta-maker/recipes-webui/octoprint/octoprint_git.bb 
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python-flask' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-flask']
ERROR: Required build target 'octoprint' has no buildable providers.
Missing or unbuildable dependency chain was: ['octoprint', 'python-flask']

Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
+++

In the meta-maker and meta-openembedded trees dizzy branches, I see no 
python-flask recipe/package. It looks to me the patch for octoprint 
1.2.10 has been merged into the meta-maker dizzy branch with the 
RDEPENDS list still matching that of the newest meta-openembedded (but I 
might be wrong).

Is my analysis correct? If so, is there a way to know which RDEPEND I 
should use for octoprint in the dizzy branch to match the 
meta-openembedded one?

Another possibility could be to use the meta-intel-edison from the yocto 
project git repo[2] with meta-openembedded & meta-maker on master but I 
have yet to try that.

Thanks a lot for your help!

Vincent

[1] 
http://iotdk.intel.com/src/3.5/edison/iot-devkit-yp-poky-edison-20160606.zip
[2] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/

To reproduce:
get 
http://iotdk.intel.com/src/3.5/edison/iot-devkit-yp-poky-edison-20160606.zip 
and unzip
cd iot-devkit-yp-poky-edison-20160606/poky/meta-openembedded
git clone git://git.yoctoproject.org/meta-maker -b dizzy
add meta-maker layer to 
iot-devkit-yp-poky-edison-20160606/build_edison/conf/bblayers.conf
cd iot-devkit-yp-poky-edison-20160606/poky/
source oe-init-build-env ../build_edison/
bitbake octoprint -c fetchall

