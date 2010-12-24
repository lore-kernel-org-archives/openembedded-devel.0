Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PW9v6-0002iH-SW
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 16:51:05 +0100
Received: by iwn8 with SMTP id 8so7362446iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 07:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xTPfZR5pNLdQX9xC3aM8YocNTWG1rq1YkJ3Jd+iSYv0=;
	b=bpVVNqQ+NeWNYJL7X2IN+PxdnZ/UPL5y9kprEG2Cc6125rZOPA2nlJ8ITu1qnr/V0y
	+sTecri/EccGI7GIdNwt1G906yyKHAmnpF0V+k1eMbuPXHZ+50vFEtxZDuEp2wFoWz9n
	ki/FmpQzkYkdYGINXevchEldKcUdpGEdimGwI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cTTsra2XLsJCKcQMIXAuFdgrOfSAUlrO0eTJEN4PFJ8HzOZozgBfDFAYlZsfufZkjn
	RH3l7S/sPUy22o2008WC0GmkUxsaoHX9tEnuhPZvUB/HVdOtbZQPtfLmqQLYdQbcXaRN
	iMEwW/ofBrohcvDBy7RJlZFUa4FB15v0yy/o8=
MIME-Version: 1.0
Received: by 10.231.149.194 with SMTP id u2mr9456292ibv.32.1293205855759; Fri,
	24 Dec 2010 07:50:55 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Fri, 24 Dec 2010 07:50:55 -0800 (PST)
In-Reply-To: <AANLkTinucpseeTTp=KHr_UVRp25RuRkxWcEaued564Ld@mail.gmail.com>
References: <AANLkTi=YRSMBzSihPEddjSNR+B7UFGWcAr_P9AgGs3eQ@mail.gmail.com>
	<AANLkTinucpseeTTp=KHr_UVRp25RuRkxWcEaued564Ld@mail.gmail.com>
Date: Fri, 24 Dec 2010 16:50:55 +0100
Message-ID: <AANLkTi=F-h0tS-5nXd_uVoy5sj2nzJEmiwWHU5NSn+R=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: avoid addtask?
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
X-List-Received-Date: Fri, 24 Dec 2010 15:51:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/24 Khem Raj <raj.khem@gmail.com>:
> On Fri, Dec 24, 2010 at 12:33 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> I was wondering whether it is better to avoid addtask where easily possi=
ble.
>>
>
> If the tasks are logically inline in existing tasks then it would be
> ok. Although I dont know the big O notation of
> runqueue algorithm to ascertain the gain.

I was more considering the overhead starting and handling the task.
But I guess it will be marginally.
>
>> E.g. from one recipe:
>>
>> do_postpatch() {
>> =A0 =A0 =A0 =A0rm -rf patches && rm -rf .pc && mv -f debian/patches patc=
hes
>> && quilt push -av
>> }
>> addtask postpatch after do_patch before do_configure
>>
>>
>> Wouldn't it be simpler and probably even a little bit faster just to say=
:
>>
>> do_configure_prepend() {
>> =A0 =A0 =A0 =A0rm -rf patches && rm -rf .pc && mv -f debian/patches patc=
hes
>> && quilt push -av
>> }
>>
>
> Well this seems more like a patching task then configure to me.

True do_patch_append
>
>> (or if there is already a do_configure_prepend add the line to it)
>>
>> Currently we have 142 addtasks and some of these are definitely useful
>> and desirable but I feel a lot of these could easily be merged into
>> the previous or next task.
>>
>> How do you feel about this?
>>
>> Frans
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


