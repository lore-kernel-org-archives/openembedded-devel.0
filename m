Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pd7WF-0003Df-Aa
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 21:42:11 +0100
Received: by bwz10 with SMTP id 10so898146bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 12:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=1tomyJdGhOOR/d779cmk2SNMZJ2WXEJhS43H6PhNm54=;
	b=iOipYvuapU8v9DA15ByGHYEhJgkvqgMPdMXwotKuPp3SIybDcRWKJqn+lteRmMIsJs
	BITORnFaWaXwFaSB88MCzu9A6JjpI1FPu8DcaDzG9CywHWzErD6W7jeFiCQxbWcBm5U8
	ULLNlKyoaMtr+3XB63RcvqYuL9ZUeWowRa3lI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=j6g7/167LEAj4Ai7p8N5KWhMyujB3yMMl/SdkQHSyO0EVwAoyqkHZj7aEsJPLy8Bho
	g0smgnlu1kV1JlmWM86h+wfdur8v1jEuLXjmlZbUUanbujPUtjBfnSTDD8QkjwvtDgzL
	L0Cn7X94dVPMHfRnW+wLhwuHAfEV/SHYL1CUY=
MIME-Version: 1.0
Received: by 10.204.102.206 with SMTP id h14mr1132882bko.45.1294864899981;
	Wed, 12 Jan 2011 12:41:39 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Wed, 12 Jan 2011 12:41:39 -0800 (PST)
In-Reply-To: <20110111195359.GE6584@mx.loc>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-7-git-send-email-rep.dot.nop@gmail.com>
	<20110111195359.GE6584@mx.loc>
Date: Wed, 12 Jan 2011 18:41:39 -0200
X-Google-Sender-Auth: Mya3TDyddvtcbiGvBQgMUYHcZz4
Message-ID: <AANLkTikMsjT8YnGzNASQkN4+kjTmA-RYA+giUK97E176@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [PATCH 07/12] busybox: simplify handling of busybox-static
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
X-List-Received-Date: Wed, 12 Jan 2011 20:42:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2011 at 17:53, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> In the long run, i have already thought about virtualizing busybox into
> coreutils/util-linux/init/whatnot and use packages and u-a (to handle
> these opkg-packages natively via rootfs_opkg and pstaging w/ opkg-cl
> -O). We now do a real install with the superset of {,-static} each and
> use u-a to properly set the tools per provider. But anyway. The above
> was a step. ACK?

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Regarding the busybox cleanup a nice way to enable/disable features
(and links) on it is an important thing to have. We have sort of it
for uclibc (and patches for eglibc has been sent).

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


