Received: from ey-out-1920.google.com ([74.125.78.146])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1O6QF9-00087F-AS
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 17:29:07 +0200
Received: by ey-out-1920.google.com with SMTP id 26so933189eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=IsYqeW7KPsMDGMEGICvQvdH9H481oM4eI82Oqou4cQk=;
	b=w+2k2rFudPGiW4+puZ1QKokBx55RDPmpinqCIuHLE4mYk0nK7bq84PvFGGuFI7MO2/
	Y5mvDEvzjubbTJn72xIpMeUpnI19kzT/sHVBgDZP0UPHNlQt88WpNU+9NYrrVi6xtmLz
	QqYlkjAjZxZ/zG2fkT5ODhwa+Aq3HL4Frn1Ao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=UGBq3fI06k/r1ZOwdS8DicLmdkWZPevZxzgZzAtUqN/Ufi7TrNviHe9Y6UGjdTSn76
	R5JHB7SeDGTD04mIISdIIVA68sAHoU/M98lIpxUWbLDY2nGIj162mgu4ck8NMAQvPBHs
	TYqRqbB0rAJouSHargKyGIE2NYbtW7b0ykGn4=
MIME-Version: 1.0
Received: by 10.213.49.212 with SMTP id w20mr1608703ebf.29.1272295530078; Mon, 
	26 Apr 2010 08:25:30 -0700 (PDT)
Sender: mickael.chazaux@gmail.com
Received: by 10.213.19.136 with HTTP; Mon, 26 Apr 2010 08:25:29 -0700 (PDT)
In-Reply-To: <q2ib6ebd0a51004260748pff3b8e25n8b6d145436adacff@mail.gmail.com>
References: <1272274382-1983-1-git-send-email-mchazaux@adeneo-embedded.com>
	<hr3pd4$akp$1@dough.gmane.org>
	<q2ib6ebd0a51004260748pff3b8e25n8b6d145436adacff@mail.gmail.com>
Date: Mon, 26 Apr 2010 17:25:29 +0200
X-Google-Sender-Auth: 6c483ceb0d2179f4
Message-ID: <h2xbc36f8ed1004260825s743f4683ue782089a3fbd435c@mail.gmail.com>
From: Mickael Chazaux <mchazaux@adeneo-embedded.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.146
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add error handling to read_cache in stage-manager
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
X-List-Received-Date: Mon, 26 Apr 2010 15:29:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

2010/4/26 Chris Larson <clarson@kergoth.com>:
> On Mon, Apr 26, 2010 at 3:20 AM, Koen Kooi <k.kooi@student.utwente.nl>wro=
te:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Looks good to me,
>>
>> Acked-By: Koen Kooi <koen@openembedded.org>
>>
>>
> Same here.
>
> Acked-By: Chris Larson <chris_larson@mentor.com>
>
> Might also be worth catching ValueError there, to be safe (int("foo") rai=
ses
> that :).

I'll add that. I am also unsure on what to do in case of an error. Is
it possible to ignore them? In that case, failing silently may be
better.

Regards,

Mickael
Adeneo Embedded - Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=C3=A9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41


