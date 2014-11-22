Return-Path: <pierluigi.passaro@phoenixsoftware.it>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 22 Nov 2014 23:42:01 UTC
Received: from smtpcmd01217.aruba.it (smtpcmd01217.aruba.it [62.149.158.217])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3F76A9FE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Nov 2014 23:42:01 +0000 (UTC)
Received: from [192.168.1.71] ([94.33.39.20])
	by smtpcmd01.ad.aruba.it with bizsmtp
	id Jnap1p0020S5K6601napX3; Sun, 23 Nov 2014 00:34:49 +0100
Message-ID: <54711D99.3090003@phoenixsoftware.it>
Date: Sun, 23 Nov 2014 00:34:49 +0100
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: curl compilation broken on dizzy
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
X-List-Received-Date: Sat, 22 Nov 2014 23:42:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
I'm experiencing some problems compiling curl on dizzy.
As far as I can see, the backporting of CVE-2014-3613 and CVE-2014-3620 
introduced patches few bytes smaller than those available on master 
branch: it looks like some CR characters are missing.
The compilation on dizzy is ok using the patches from master branch.

Could anyone sync the patches with those available on master branch?

Thanks
Regards
Pierluigi

