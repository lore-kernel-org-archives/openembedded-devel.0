Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1P66fp-0001MP-A1
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 21:07:38 +0200
Received: by ewy1 with SMTP id 1so1897974ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 12:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:mime-version
	:content-type:subject:date:in-reply-to:to:references:message-id
	:x-mailer; bh=6UqzLblQKzmJ9IMMa7U1oAFL8XC/leGYBqlxYQELN/w=;
	b=pXpjncRjKpMEzGKFX0kRjYJKot22mdjXxDS9YIp3h2riAZYEq+vMO/sbFWRmbNkyJG
	f6pvqVgJvYe4VuyEDfnhozcxiAGrLzvF86B3rKZ6MdyiyaTfYoTeWcCMG4CJcq59Tv+Q
	8ECoO5sqbUk9LxkLDjBoJWtRpBjQ7b33NKDq0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:mime-version:content-type:subject:date:in-reply-to:to
	:references:message-id:x-mailer;
	b=gyLF9VbHwcRE0KIL04C3njK9HXqBh8rWXwUGsSDua8SpfbAViIBXiX25Y/RRsV28eK
	lSFb43YDqIrBJM/88wewUL52Qk873L8zMaSdbNnUdWROa8JlugC7yTdhkoVXt1Z7SwUa
	PImMAINZCNEkvhuuKADXBJcoNlm/ryXrRaR6M=
Received: by 10.213.37.8 with SMTP id v8mr358645ebd.1.1286996830468;
	Wed, 13 Oct 2010 12:07:10 -0700 (PDT)
Received: from [192.168.10.102] (145.79-161-31.customer.lyse.net
	[79.161.31.145])
	by mx.google.com with ESMTPS id q54sm11623372eeh.6.2010.10.13.12.07.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Oct 2010 12:07:09 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1081)
Date: Wed, 13 Oct 2010 21:07:06 +0200
In-Reply-To: <mailman.1322.1286989169.3514.openembedded-devel@lists.openembedded.org>
To: openembedded-devel@lists.openembedded.org
References: <mailman.1322.1286989169.3514.openembedded-devel@lists.openembedded.org>
Message-Id: <3874F9A5-E885-4281-8292-E4406339CE34@gmail.com>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MIME_QP_LONG_LINE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: apr-util_1.3.4.bb fails, looking at host includes
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
X-List-Received-Date: Wed, 13 Oct 2010 19:07:38 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

>=20
> Am Mittwoch, den 13.10.2010, 14:39 +0200 schrieb Holger Freyther:
>> On 10/13/2010 02:39 PM, Tasslehoff Kjappfot wrote:
>>=20
>>>=20
>>> Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
>>> ---
>>> recipes/apr/apr-util_1.3.4.bb |    1 +
>>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>>=20
>>> diff --git a/recipes/apr/apr-util_1.3.4.bb =
b/recipes/apr/apr-util_1.3.4.bb
>>> index cc6781b..5e31171 100644
>>> --- a/recipes/apr/apr-util_1.3.4.bb
>>> +++ b/recipes/apr/apr-util_1.3.4.bb
>>> @@ -14,6 +14,7 @@ EXTRA_OECONF =3D
>>> "--with-apr=3D${STAGING_BINDIR_CROSS}/apr-1-config \
>>>         --with-gdbm=3D${STAGING_DIR_HOST}${layout_prefix} \
>>>         --without-sqlite2 \
>>>         --without-sqlite3 \
>>> +                --without-pgsql \
>>=20
>> hmm... the existing file is using spaces, you use tabs... I will fix =
it when
>> pushing the changes. Please try to follow the indention of the file.
>=20
> Holger committed your patch in eba2dd [1]. It would be nice if you =
could
> write a elaborate commit message next time with the actual error =
message
> and reason added.
>=20
>  /checking for pg_config... /usr/bin/pg_config
>     adding "-I/usr/include/postgresql" to CPPFLAGS
>     adding "-L/usr/lib" to LDFLAGS/
>=20
> I build tested `r7` with `minimal-uclibc` for `MACHINE =3D =
"beagleboard"`
> and it worked for me without any problems as it was with `r6`. But I =
did
> not have `pg_config` installed on my build system anyway.
>=20
>=20
> Thanks,
>=20
> Paul

I did the patch with "git format-patch", but sent it with thunderbird. =
That caused the line-breaks and the spaces, I suspect. I'll setup =
git-send-email for future use and improve the commit messages. Thanks =
for cleaning up :)

- Tasslehoff



