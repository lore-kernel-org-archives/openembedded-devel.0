Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PNUlw-0002kG-4e
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 19:17:48 +0100
Received: by eya28 with SMTP id 28so2759679eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 10:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=MOCLHnJPVhkvyRqs0FcmKGzHr5Jw9bgsouZIMgdLTsw=;
	b=G+92VQAxaHbsWFmPbzjl4Woh1zVsvfnXt/t8Ctp+dbnq8e9HbcjE5JERK+TAtPfl2E
	01xWu9FMW9MrybK+xvb6WixvpOb64R3XNAMBinZlvx8wJxhtQRl7e2NXHlESy3i4aQ07
	dyyJ/J0WgQ3XYMrwfklcpSLgysy2NCLkJg9Aw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=b8ef2JUazQNC4npgeMOpAanZ4v36SgYE+kHL3J6ANA8K1BGa3gONmUpkR0+0cO5ZwU
	h8iWw9UUFWGQvWeheq85g4ss9tiDCOBdkG0ReJWC95PWnovMbJWHrChBr3einrT81S0d
	k1GABlCrNkgOlWs3596dHjh8TsYymyDWuf3sA=
Received: by 10.216.179.210 with SMTP id h60mr2767166wem.42.1291140981874;
	Tue, 30 Nov 2010 10:16:21 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 30 Nov 2010 10:16:00 -0800 (PST)
In-Reply-To: <4CF48B9D.9050907@gmail.com>
References: <4CF48B9D.9050907@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 30 Nov 2010 11:16:00 -0700
X-Google-Sender-Auth: M4HLypeNFA4KTRcF0Z7BgcGQo8A
Message-ID: <AANLkTik+2NBSfYKFBL02OS2B17qVKNBr_2bfjNqQxnkH@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] autoconf_2.65.bb: Fix configure for DISTRO=micro.
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
X-List-Received-Date: Tue, 30 Nov 2010 18:17:48 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 29, 2010 at 10:29 PM, Graham Gower <graham.gower@gmail.com> wrote:
> Update autoconf-dont-execute-perl.patch for autoconf-2.65.
> See aa0d1e870c41d3375866c8180c720cd0fc27ffcd.
>
> checking for perl... (cached) /bin/perl
> /mnt/oe/tmp/work/mipsel-oe-linux-uclibc/autoconf-2.65-r10.0/autoconf-2.65/configure: line 2507: /bin/perl: No such file or directory
> configure: error: Perl 5.005_03 or better is required
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


