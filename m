Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S5hlQ-0003Xt-CW
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 19:08:32 +0100
Received: by vcbfl13 with SMTP id fl13so642020vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 09:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=g/Tc2zxjrpQs+r/5wM3KzpYK6pCs0CkRUbhfy/VoZUQ=;
	b=riqknnmaMM3zFJywfqsCaGrQW4hTAC8gS6GBKsbkaXJ7LqZDa6mWLenjqsCuMkuNBy
	CIGl8Wv+03APJStu7m2rourl2s1miPinw0JDzEUEaGz+luQo1oUTqPKmRhZF5/u8np+K
	0f9/zNonbql//NtqbvAngSl9ZJophrRdTRpzUBQjH23Zm8LeJPjjumb+thM4gw+ApRyA
	HNYDp9zOkJPBInHC/qM/w0d0vi46DE4m46fOo/GBna86M+GZRybsHuP1m33Ewvf5/SiA
	f3FyMsMlJyOQzRkHAh+ugDWY01yk61aXCzQT74ZGLpSm2MPy1xFokWWs/R9/Jw1AvVZ+
	hqmQ==
MIME-Version: 1.0
Received: by 10.52.99.231 with SMTP id et7mr11308547vdb.114.1331229593548;
	Thu, 08 Mar 2012 09:59:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Thu, 8 Mar 2012 09:59:53 -0800 (PST)
In-Reply-To: <CALbNGRT1iEb8G=OXNog5aU9CZgO1j_Gc8bmD_pbDQ9UU96YL-Q@mail.gmail.com>
References: <1331025741-26216-1-git-send-email-koen@dominion.thruhere.net>
	<1331025741-26216-2-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKo+i3d31+xUt8RnOgFeDQbUw4hSkHeoR1LomZvxF5oa8A@mail.gmail.com>
	<CAP9ODKovkJ_pHu+-__yUA=tshBiBvQwuJN7xN93P_6nrViZULw@mail.gmail.com>
	<CALbNGRTiaqQQPb_UqkCKrevZYJk4+LLUh9E2VDzAcHHC6v_sTw@mail.gmail.com>
	<CALbNGRT1iEb8G=OXNog5aU9CZgO1j_Gc8bmD_pbDQ9UU96YL-Q@mail.gmail.com>
Date: Thu, 8 Mar 2012 14:59:53 -0300
X-Google-Sender-Auth: gLG5gdOLcHlcVL0pQMuOAeLjaFE
Message-ID: <CAP9ODKrpiLEAyxx+2MHLxSaM_RkUh=AsMuA=8FECFz9TwkBdcw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 2/3] systemd: enable logging to disk instead of tmpfs
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
X-List-Received-Date: Thu, 08 Mar 2012 18:08:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 8, 2012 at 14:15, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> My personal opinion: since RAM is most expensive prefer flash/disk as
> default ( as Koen already pointed out this default can be simply
> overridden by deleting /var/log/journal [2][3] )

If this is the case, then let's make this patch ensure this works out
of box ... I do think most people will get full flash/disk without
knowing why.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


