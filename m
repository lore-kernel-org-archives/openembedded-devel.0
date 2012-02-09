Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RvRuL-0007oY-Ge
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 12:11:21 +0100
Received: by eaal10 with SMTP id l10so431300eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 03:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=fdBGFWvh3Hh1J+LUum0ycfLBxcFEd+0hHJpL0E1B/4o=;
	b=TkasT9eIfwo1w7FPMUZrkHVha9+L0IUV7olVJ/IcC2tF++zfZT7JSOz7YcJURd3wkI
	U2t1K7AWYuTykmQiUgVJCN5bU/Ck8JOEJp3XB7hAbOat7i1jkIE5WtHBGLYvg385+lYX
	MWtb+01ofuM40lCeL2mVsxVz5Ff9RlvYcG+LQ=
MIME-Version: 1.0
Received: by 10.14.48.65 with SMTP id u41mr470757eeb.39.1328785397102; Thu, 09
	Feb 2012 03:03:17 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Thu, 9 Feb 2012 03:03:17 -0800 (PST)
In-Reply-To: <CALbNGRQYcHYZDX+Vvnor0ij+_q_XTs+GRc=gia1TSQ3Tws2Lig@mail.gmail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<1328627573-5217-2-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRQYcHYZDX+Vvnor0ij+_q_XTs+GRc=gia1TSQ3Tws2Lig@mail.gmail.com>
Date: Thu, 9 Feb 2012 09:03:17 -0200
X-Google-Sender-Auth: CsHxYx20Xj-cltA9UdV27YIXrI4
Message-ID: <CAP9ODKrpYLVaHe5vZTT3GZ0CBo25rCOwt9dqw927Hj-Fp5019Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][RFC 01/27] systemd.bbclass: rework
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
X-List-Received-Date: Thu, 09 Feb 2012 11:11:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 9, 2012 at 06:14, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> would it make sense to split this up and resend?


I'd love if you could split the changes so we can get those merged one by
one.

Specially about the multiple service support, the right place to fix it is
in the systemd-systemctl-native script adding support for it to deal with
one more service at time, as is supported by the real tool.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

