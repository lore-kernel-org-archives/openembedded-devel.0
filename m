Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (unknown [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 857A2605B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 12:31:14 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WmjCM-0002hZ-SD for openembedded-devel@lists.openembedded.org;
	Tue, 20 May 2014 14:31:14 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 14:31:14 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 14:31:14 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 20 May 2014 14:31:04 +0200
Message-ID: <llfhu8$d1s$1@ger.gmane.org>
References: <1400568570-23824-1-git-send-email-fathi.boudra@linaro.org>
	<BFBFE57F-788E-4621-B1F0-25662F02737B@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
In-Reply-To: <BFBFE57F-788E-4621-B1F0-25662F02737B@dominion.thruhere.net>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] pm-qa: update to 0.4.10 release
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
X-List-Received-Date: Tue, 20 May 2014 12:31:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef op 20-05-14 09:09:
> 
> Op 20 mei 2014, om 08:49 heeft Fathi Boudra <fathi.boudra@linaro.org> het
> volgende geschreven:
> 
>> Update SRC_URI, /tools/ is deprecated.
>> 
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org> --- 
>> meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb | 8 ++++---- 1 file
>> changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb
>> b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb index f6ffcb6..9243340
>> 100644 --- a/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb +++
>> b/meta-oe/recipes-devtools/pm-qa/pm-qa_git.bb @@ -4,14 +4,14 @@
>> HOMEPAGE =
>> "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/Test 
>> LICENSE = "GPLv2" LIC_FILES_CHKSUM =
>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> 
>> -PV = "0.4.9" +PV = "0.4.10"
>> 
>> BRANCH ?= "master"
>> 
>> -# Corresponds to tag pm-qa-v0.4.9 -SRCREV =
>> "c54941a9bbaac33e44e6d0c7f5344e21102642cf" +# Corresponds to tag
>> pm-qa-v0.4.10 +SRCREV = "03a22d5ad7deb6021b2ec1d546a960d8a9878255"
>> 
>> -SRC_URI =
>> "git://git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}" 
>> +SRC_URI =
>> "git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH}"
> 
> Nitpick: protocol=http might be better, git:// is flaky on
> git.linaro.org.

I have no problems with merging this with protocol=git

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTe0sIMkyGM64RGpERAuJqAJ0Q7oEp1P+ryEgYaoqgtmVHls9oNQCeMHl3
f7YTME2Qtvw2k4yRxhX3HyY=
=1O0V
-----END PGP SIGNATURE-----


