Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PnshK-0005kj-UP
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 14:06:07 +0100
Received: by bwz10 with SMTP id 10so2989589bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 05:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=UCo94wvEG2ibKk667WmubfV/WdbQ3PvLz5OXTiDOrXc=;
	b=yB//ycWHBJgF5m9sia22tOQ+1WDWuH8+CPPSTjvxHALMOplZvFyOuROKC9OSNjQXoz
	Pr/SnuDjrV4pKsAXQC746zmAVxBs6LtURpmx9gT2X9/E209fXhubTa8e3To/qqsMFA4x
	UGUKo+tcRoER4MCO3dsAqWh5c3kgl3tYU2NP8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=FTRW9Q8Ix54du+6MaUOlEgalHRDWGpwGG+LeZQLHsiDySENv33tDJVfHDzIcHt8aQO
	OA3AJv8HkGXl3HCPAV1FjYOKk1k9AtejNsldm6drQa9hCMVRLA7rVwhC2qYvCwZLnGha
	zLYpX3SENQ6LKfs4eUx6VOyQSFowfRAcPtPFE=
MIME-Version: 1.0
Received: by 10.204.60.17 with SMTP id n17mr1023948bkh.190.1297429500645; Fri,
	11 Feb 2011 05:05:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.56.135 with HTTP; Fri, 11 Feb 2011 05:05:00 -0800 (PST)
In-Reply-To: <1297428703-2330-3-git-send-email-obi@opendreambox.org>
References: <1297428703-2330-1-git-send-email-obi@opendreambox.org>
	<1297428703-2330-3-git-send-email-obi@opendreambox.org>
Date: Fri, 11 Feb 2011 13:05:00 +0000
X-Google-Sender-Auth: GUyBbMXP2Kv8yrwASQQRHb1j4t0
Message-ID: <AANLkTi=2BhPBOpRqrJGgoYdqxrNAMt4Kscax_mZHqQKb@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/4] package_ipk.bbclass: use common function to write relationship fields
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
X-List-Received-Date: Fri, 11 Feb 2011 13:06:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2011 at 12:51, Andreas Oberritter <obi@opendreambox.org> wr=
ote:
> * A function write_dep_field() was added to do_package_ipk() to
> =A0ensure explode_deps is called for every field and to simplify
> =A0the code.
>
> * The following statement was removed from do_package_ipk():
>
> =A0if not '-locale-' and not '-dbg' and not '-dev' in pkgname:
> =A0 =A0 =A0rdepends.append('%s-locale*' % pkgname)
>
> =A0It was added in November 2008, but can never evaluate to true.
>
> =A0See commit a045dfacf6f2541e0f410d9d109581f181303756
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


