Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MFS2E-0003Ax-O0
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Jun 2009 14:08:34 +0200
Received: by gxk2 with SMTP id 2so4031415gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jun 2009 04:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=c/cRf1Rs7uJv6xqYx6Cn1CDlw96QzJG2WFbctsl9en8=;
	b=ksheAgJMIFES+oBNd3SSp9TB2lv8LigqNjo+8kbTw50N5Qgw8bDzL5F5ZMhp6uylmj
	O66JB+Eb8cykSUJMKJbT3LSafBtdEwsK82X3PvnFVh0qvgVoC/uWbnaAYrt/QVoLvEKU
	gH39n2WZ6Cdu4bQ1cw1BgueQjG+xjObC3lkaI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VcT6IgfqNHy9fCQQrKCLk63TCDFm34bJIy4Zo76nMgo188B8+KEqp6UkZBm0Jf7Vgb
	nZ8IxIv4rUQS3I502IWpvEBse51Z+J1Kn5vcuM2GOUnflDL4ivjMZn93Mhi44yjoArPF
	ubF1KRWzis4E6dmiKfabywoTqr5STGh/nooYY=
MIME-Version: 1.0
Received: by 10.231.17.199 with SMTP id t7mr1926186iba.46.1244894311454; Sat, 
	13 Jun 2009 04:58:31 -0700 (PDT)
In-Reply-To: <1244885168.4151.149.camel@lenovo.internal.reciva.com>
References: <1244885168.4151.149.camel@lenovo.internal.reciva.com>
Date: Sat, 13 Jun 2009 13:58:31 +0200
Message-ID: <c384c5ea0906130458j684e0067p1bdd05bc62008369@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [patch] util-linux-ng: repair do_install for prefix=/
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
X-List-Received-Date: Sat, 13 Jun 2009 12:08:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Jun 13, 2009 at 11:26 AM, Phil Blundell<pb@reciva.com> wrote:
> The current util-linux recipe loses quite badly if ${sbindir} and
> ${base_sbindir} are the same location. =A0I think this patch should
> correct the behaviour, but there didn't seem to be any clear pattern to
> which files should go where and hence I'm not quite sure that I've got
> it right.
>

As a side note, from util-linux to util-linux-ng, some locations have
changed for some files.

I think the intent was to go towards FHS compliance, at least inutil-linux-=
ng:

http://www.pathname.com/fhs/pub/fhs-2.3.html

Regards,
--=20
Leon


