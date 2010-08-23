Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OnepR-0004Ah-HK
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 23:45:19 +0200
Received: by fxm6 with SMTP id 6so3595132fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 14:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=LPrxmUwiE6zxUfxbIjtuvn1Pa3D4SLlkVkIOgKPMEVY=;
	b=yA+H66jQYzMWW1ebqDp0urXklXIwql8s4nBE15jg8eStS68FI0U/3cnscB/G49/QPU
	NQNDetXPcH3q7KLafIdg5jISyyLkip3kBE7JeHZcBOHBWX32MrPfJ0XWvV02TLuAzxWJ
	mTxIbWptSaEX29n5ecU/8A+oBBpPYyuDrfdKU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=rRuVZXWQj+QXCunZsYqeWZ+S5TBgMy3yMnqUKiVl2FNiXcr9QUm3Xkx+Yxy+e9me6f
	a2BZL7xsCX0dtGx7C8LL8dk3L2lEuUNSOUdlWItpWJFKznUqNsH6k4T/mOCkzTkTwH5k
	kF6C5BEKFnuT5qqQRhCbD4T6XIdFZtmcEvjPs=
Received: by 10.223.106.132 with SMTP id x4mr5136168fao.15.1282599885099; Mon,
	23 Aug 2010 14:44:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Mon, 23 Aug 2010 14:44:25 -0700 (PDT)
In-Reply-To: <AANLkTinSSP7c=DtDsHhCtqosf3i9-3Ci0bneURG9ySHo@mail.gmail.com>
References: <AANLkTinSSP7c=DtDsHhCtqosf3i9-3Ci0bneURG9ySHo@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Mon, 23 Aug 2010 15:44:25 -0600
Message-ID: <AANLkTinCggGNCtVXQuS9pGA=2aVbAb3okvpk1atbgtv3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	"General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Build failing on glib
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
X-List-Received-Date: Mon, 23 Aug 2010 21:45:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> | checking for *glib-genmarshal*... no
> | configure: *error*: Could not find a *glib-genmarshal* in your PATH
> NOTE: Task failed:
>
> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/glib-2.0-2.24.1-r0/temp/log.do_configure.28085
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/glib-2.0/
> glib-2.0_2.24.1.bb
> do_configure failed
> ERROR: Task 8
> (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/glib-2.0/
> glib-2.0_2.24.1.bb,
> do_configure) failed
> NOTE: Tasks Summary: Attempted 4 tasks of which 4 didn't need to be
> rerun and 1 failed.
> ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/glib-2.0/
> glib-2.0_2.24.1.bb'
> failed
>

Have you tried to install glib-genmarshal or glib-genmarshal-native?

