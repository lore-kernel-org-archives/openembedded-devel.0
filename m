Received: from mail-gx0-f228.google.com ([209.85.217.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1OHAFr-0001AX-NE
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 08:38:16 +0200
Received: by gxk28 with SMTP id 28so2196163gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 23:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=ybMDhIVBSeaAx2SGyfjASXzbY3dM91hG2xOQFzkS300=;
	b=VrSrgtPoXcyEfS01W78AVIPIT4Ek/KbSrhDUfBelZO8NTaPZ7FuLx0mrc5NXVNAz8k
	5Vn7BsJvRLAtG04Hn+LE9lLcvn5zst1oUTkTzQPqSWWvwMTsp7rt5831iLO6PnYpbKwb
	42xzJEZmhO0lemUPrlvZSnRfnh3dwFtv6D61c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Mk3hbxD5h/qgZBPplhYFq7OPtnP3WuIFLaXKBVIBTQssGHWSFaYCOJzoujn9QctBk0
	Kl49dJMLKqobQSSdm3391nVAY4Y2O7wjKuPBqX29khOV/IKrImTYx6SwRMRtgPlT2EPM
	8+f2Wd2nq+KxRHOzmZ2MGRtmD6gZFviWZZJ54=
MIME-Version: 1.0
Received: by 10.231.194.196 with SMTP id dz4mr6143941ibb.66.1274855647492; 
	Tue, 25 May 2010 23:34:07 -0700 (PDT)
Received: by 10.231.171.85 with HTTP; Tue, 25 May 2010 23:34:07 -0700 (PDT)
Date: Wed, 26 May 2010 08:34:07 +0200
Message-ID: <AANLkTin5ULxoMD23AleqaBLBxR8zinSd8OfO8NgpKvTn@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.228
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: developmet setup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 May 2010 06:38:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,
I was searching a clean way to develop in OE my new kernel and my new
applications.

I saw this nice article about kernel development:
http://bec-systems.com/site/521/best-practices-for-kernel-development-with-openembedded

I would like a way to develop inside Openembedded, but not in work
directory.
I mean to develop a project in a git tree, allowing me to use 'git diff'
..... and finally 'git push' to my internal git servers.
This is an idea:
bitbake -c devshell-path /home/myapplication myapplicationrecipe

Perhaps srctree is a good tool already done for it?

Thanks,
Raffaele

