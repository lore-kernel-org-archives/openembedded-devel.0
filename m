Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NZSzN-00076a-4S
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 18:44:40 +0100
Received: by ywh8 with SMTP id 8so1365594ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 09:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HznsAOC4c3J78kvjNdQxcp1Ljwcu+b/MXKW3LAGscq0=;
	b=Zb0LhVw/748ePrliI2TcFg1w3b9xiqgferXLtz1ndTusCmrVLV+cBjTQ2/4feYmnqX
	dxnOXJArGM2/PgdtFwXchUFH2s5R9ELPckj/uNd1xzjdcSmc0n4J+deIuQdXnDg4svA9
	YG1TK+d1fv5Ga8N61ZcnhNCTQJVXGXvO7uj3s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YSW5gKDT9jiQkwgKFcdPslQME7T+ED+lYfQnd1dH2aClEC+vbmhqN/OBR0G3Nabr45
	XRqfUdaq6Z6GiqZqc/6oHu9FniprqTOAg7osQx++URKONJrvkKBfWvedQWCKOlS4suYz
	81tcPPSW7SgP2bOQcRMjXfRkbObB1SLe5RXR0=
MIME-Version: 1.0
Received: by 10.151.24.9 with SMTP id b9mr9039596ybj.23.1264441335884; Mon, 25 
	Jan 2010 09:42:15 -0800 (PST)
In-Reply-To: <4B5DCBCD.7070500@soundmetrics.com>
References: <1264288606-8013-1-git-send-email-john@soundmetrics.com>
	<201001251025.23040.holger+oe@freyther.de>
	<4B5DCBCD.7070500@soundmetrics.com>
Date: Mon, 25 Jan 2010 09:42:15 -0800
Message-ID: <19c1b8a91001250942u20748e76r9c7fdbb02e9b459@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH v2] socat: Add version 1.7.1.2
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
X-List-Received-Date: Mon, 25 Jan 2010 17:44:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2010 at 8:50 AM, John Faith <john@soundmetrics.com> wrote:
> Holger Hans Peter Freyther wrote:
>>
>> On Sunday 24 January 2010 00:16:46 John Faith wrote:
>>
>>>
>>> Second try. Added package source checksums, changed PR to r0, and remov=
ed
>>> =A0some trailing whitespace in the patch.
>>>
>>
>> First of all, thank you for the contribution. I have one question. Why d=
id
>> you need to patch the configure script? It should be automatically
>> regenerated in the do_configure stage?
>>
>>
>>
>
> Hi,
> Using the default do_configure() overwrote config.h.in which lacked #defi=
nes
> like HAVE_SIGACTION and broke compilation for me. =A0I imagine that the r=
ight
> thing to do would be to just to patch configure.in and recreate the
> configure script and config.h.in. =A0This page:
> http://www.gnu.org/software/hello/manual/gettext/config_002eh_002ein.html
> seems to indicate that its ok to manually maintain a config.h.in, so I
> wonder what do_configure() should do in this case when this file is inclu=
ded
> in the source.

autoheader is creating the config.h.in and do_configure will do it if
project is set
to maintain config.h.in automatically. Your option is to override do_config=
ure
and invoke the only regeneration commands that are needed however fixing it=
 in
configure.in would be best IMO because then autoheader will get it right to=
o.

>
> ,
> John
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


