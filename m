Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 044306E786
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:35:25 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id va2so485465obc.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=0nZalDgxGDlNPPyexEDKatqwqxXhe+l8+X+8TkGs+iY=;
	b=YNsRN9M+RuSwNghmkx5XI0ROvK22cR4KsnquMXmaGBibejau5M5fNAnifEJfYwVDfE
	90vEWuey0AC1NdSpzmkD3hHypGkmvYwxX9ueiyrHiC/XG1gEtrxpwSA7BE66YztIYqAp
	VcMKIs5fVC2wKD5aQPOWy3b4QT6zHkbrrcm6+kLdtNwoFaQfa8cUFDp6OJNbW7NOApi9
	tSFyBdA9cIsVxilKZ8jhSipjBk7tzy3Myeqc/FcUqQVbbUung8GOV9BYijyN1XHlP2gA
	1lrk7dXczw0kiIm2cYu4Oiu2d1LS25NL6H6ma4G5A8GWeaP/hyZc8SIHudRjmu7ll9oX
	yKTA==
MIME-Version: 1.0
X-Received: by 10.60.56.70 with SMTP id y6mr1581325oep.32.1390401327007; Wed,
	22 Jan 2014 06:35:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:35:26 -0800 (PST)
In-Reply-To: <1688777.CYGoEHJ1ll@leo>
References: <1390302526-3333-1-git-send-email-koen@dominion.thruhere.net>
	<1688777.CYGoEHJ1ll@leo>
Date: Wed, 22 Jan 2014 12:35:26 -0200
X-Google-Sender-Auth: HmB6uBg18FQQLQayEJDcLfUIvas
Message-ID: <CAP9ODKrEm_WCLnx2quebWu8rrpnGbvjXKp9Vn5_8c_J1unhMwg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-initramfs][PATCHv2] dracut: add git version
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
X-List-Received-Date: Wed, 22 Jan 2014 14:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 21, 2014 at 4:29 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tuesday, January 21, 2014 12:08:46 PM Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>
>> Changes since v1:
>>       Fix PV
>>
>> To make it work properly in systemd mode you'll need
>> http://patches.openembedded.org/patch/65317/ as well.
>>
>>  ...-xz-lzma-option-to-use-all-cores-for-mult.patch |   39
>> +++++++++++++++++++ .../recipes-devtools/dracut/dracut_git.bb          |
>> 40 ++++++++++++++++++++ 2 files changed, 79 insertions(+)
>>  create mode 100644
>
> recipes-devtools does not sound appropriate location maybe recipes-core is
> better ?

I am not sure this is 'core'; maybe 'recipes-support'?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

