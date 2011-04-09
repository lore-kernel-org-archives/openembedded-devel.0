Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q8c79-0005Eh-Cf
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 19:38:27 +0200
Received: by wye20 with SMTP id 20so4155959wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Apr 2011 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=XkiKxTHsFicBSxXAtg+F8f0sfww1sZTlc2+RrsWt7TA=;
	b=h3/u0QvA2oY+ZebDLwxXe4PNp8W5by6xZeg4igWRHKLbP/0OU7wWcy4YO95V7BUiCC
	vtTBSII3YV5O7/Ix3C0uz0U1wDeG65PjKv+mkKnMQNR7PSoosqComLNujTl8O7bhtSv7
	HSBsDzviWsM7N61AfjhHRycMoDT1NL//uvQQ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=nLjgxxVsfTaaRYT6V2mkubAcExZI+f5lHp5+OKJLFu2IDUcnaxNQ23Bkis9i/6dLF3
	GtxUfgAywS7WmG/ScyPFEuWyLdeFZgGEZxmrBTfM4AQHxLYOqUbnwIhd6W7mk7j9omOy
	LHkPUMEoOlgoIFqd4Oz+JR8vuj9UKsdi4rjmw=
MIME-Version: 1.0
Received: by 10.216.159.141 with SMTP id s13mr3214812wek.17.1302370576771;
	Sat, 09 Apr 2011 10:36:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.46.207 with HTTP; Sat, 9 Apr 2011 10:36:16 -0700 (PDT)
In-Reply-To: <1302340789.3131.7.camel@lenovo.internal.reciva.com>
References: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
	<1301660208-31105-3-git-send-email-otavio@ossystems.com.br>
	<in4lhs$326$1@dough.gmane.org>
	<AANLkTimRF7Q3=XeF1EOHgPNAGfJwnp5PmjHGyjUhTyef@mail.gmail.com>
	<CC5D751E-FF84-40C2-B184-4C813C49F5E4@dominion.thruhere.net>
	<AANLkTimS+CcrB7cHUF+ao=XwD0aXeFqt4r1N4erHoKFs@mail.gmail.com>
	<1302330816.15056.15.camel@leto>
	<1302340789.3131.7.camel@lenovo.internal.reciva.com>
Date: Sat, 9 Apr 2011 14:36:16 -0300
X-Google-Sender-Auth: YDtAyW1kPf_ilR1yCr_fEJK9hDY
Message-ID: <BANLkTinKJf85aenJia6nrVBaOdANdM44oA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/6] xorg-xserver-common.inc: drop .la files from packages
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
X-List-Received-Date: Sat, 09 Apr 2011 17:38:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 9, 2011 at 06:19, Phil Blundell <philb@gnu.org> wrote:
> What would be the use case for having them there? =A0Nothing ever links
> against them. =A0I think Otavio is right, they're better off deleted.

AFAIK .la files are used for in project linking not when linking with
system or sdk libraries. So I'd prefer to remove them.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


