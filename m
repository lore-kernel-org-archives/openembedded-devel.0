Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OnTiG-0004zV-1j
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 11:53:16 +0200
Received: from compute3.internal (compute3.internal [10.202.2.43])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 0E4A42D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 05:52:45 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute3.internal (MEProxy); Mon, 23 Aug 2010 05:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type:content-transfer-encoding;
	s=smtpout; bh=IMWTt+8rpB2dh8oHvayXm5Xw0lI=;
	b=F9YnOBLSZtfBhXfWXAl43IAeUtQEN0tLLhjSC0mf2cnZHA/ozEcl6RMxloPqssSxFqftOjhqUWokAB1fcxN1sA9ibipT5nR5y/IO8FeLFEWhma1kxihPOoskSRECJD8MJux1FFI0zbOy19JtC27FxnBTIZmyTD1PJoz8HGh/G4o=
X-Sasl-enc: tSCSy4rbW+TqHP7CvrwyZbjDXOF8qx2a4vm6Nzan76Ld 1282557164
Received: from [192.168.1.39] (hnvr-4d079266.pool.mediaWays.net [77.7.146.102])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 78E3A40A338
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 05:52:44 -0400 (EDT)
Date: Mon, 23 Aug 2010 11:54:23 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTime=tuSZNkBnM6XacjEC2Nucix0UtWTJ1VehOsr@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1008231134030.5745@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinr4-xEo+Urc_9P+uLmLk6qPJSRzCJNYVsKAxD6@mail.gmail.com>
	<alpine.LNX.2.00.1008191432360.5745@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinMr1=Bj8eK2D+mg_J-P6jzvSAQAhXNtgkK=u1n@mail.gmail.com>
	<alpine.LNX.2.00.1008201656030.5745@asterix.crazy-teaparty.dyndns.org>
	<AANLkTime=tuSZNkBnM6XacjEC2Nucix0UtWTJ1VehOsr@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: orphaned files
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
X-List-Received-Date: Mon, 23 Aug 2010 09:53:16 -0000
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Aug 2010, Frans Meulenbroeks wrote:

> 2010/8/20 Vitus Jensen <vjensen@gmx.de>:
>>
>>> I thought I made a mistake in the script, but after verification I ha=
ve
>>> not.
>>> The recipes you mention have been removed a few days ago
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De5287=
904a9dddc8ddc0f486d8526bc8cfda427b7
>>
>> But I made a mistake when I used git fetch and forgot the merge :-( So=
rry to
>> have caused noice.
>>
>>> It there any particular reason why you want to have both the 1.8 and
>>> 1.9 versions in the archive?
>>> If so, we should revert the commit above (and then of course the patc=
h
>>> file itself should not be removed either.
>>
>> Well, htmldoc_1.9.x-r1571.bb fetches an older "developer snapshot" as
>> www.htmldoc.org/ calls it. =C2=A0The download link on that page offers=
 1.8.27 as
>> the official version. =C2=A01.8.28 is in the work. =C2=A0In my opinion=
 one should
>> always offer to build the official version, not some revision from an
>> arbitrary point of time.
>>
>> Having said this 1.9.x-r1571 was added because it contains a feature w=
hich
>> one customer required and wasn't in the official release from that tim=
e. I
>> don't know whether someone at all is using that recipe now. =C2=A0So i=
t's only
>> the official vs. developer version thingy.
>
> Vitus as the owner/maintainer of the recipe do you want me to reinstate=
 1.8.28 ?

Yes, please do so.

Afterwards I will move 1.8 and 1.9 to the current versions.

Vitus

--=20
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


