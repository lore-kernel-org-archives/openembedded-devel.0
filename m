Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P67Zg-0000dz-Vr
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 22:05:22 +0200
Received: by iwn2 with SMTP id 2so2913480iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 13:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Za4aXEN+Q4imX2CXW7F18DN63Ki8zv2U7SRfxLen3Lk=;
	b=SqjE/bjqybPLmye1RLFFNk5bnIaQRYFuSJE4ag4E2jxLuEhxn9KS5YxIFmhvfqotpW
	yBQgiE1//I7Oxszr9gGgsc5LfsOHW1EJH1skfoR+W+YP4YH8v/+spPQQiFlUk0MOUBKg
	VIhTbl8v1FTX4BeFsVgdCPSTOaDM3yDEi28FY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VpN4c0EjP0MtOIwxX3hshHrzn250YkK6vb6i4mm3uo/N9GFStI753Pdt+HMMfuIZXW
	mwvFkXlYlcz0v1DS6MHjrEpskK3Nog2sKFoxUHAHKQYtprOz1RMtyyCvOJ2T51/BcB3v
	fqKIr6asSEMYwD4o5fsu5pT6mRxA+Q9TRl2z4=
MIME-Version: 1.0
Received: by 10.231.59.15 with SMTP id j15mr7591599ibh.172.1287000289929; Wed,
	13 Oct 2010 13:04:49 -0700 (PDT)
Received: by 10.220.201.141 with HTTP; Wed, 13 Oct 2010 13:04:49 -0700 (PDT)
In-Reply-To: <3874F9A5-E885-4281-8292-E4406339CE34@gmail.com>
References: <mailman.1322.1286989169.3514.openembedded-devel@lists.openembedded.org>
	<3874F9A5-E885-4281-8292-E4406339CE34@gmail.com>
Date: Wed, 13 Oct 2010 13:04:49 -0700
Message-ID: <AANLkTi=yxfV5gVeVmwDfsTGM2KGz_G4654DnBVUmfZb6@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Wed, 13 Oct 2010 20:05:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 10/13/10, Tasslehoff Kjappfot <tasskjapp@gmail.com> wrote:
>>
>> Am Mittwoch, den 13.10.2010, 14:39 +0200 schrieb Holger Freyther:
>>> On 10/13/2010 02:39 PM, Tasslehoff Kjappfot wrote:
>>>
>>>>
>>>> Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
>>>> ---
>>>> recipes/apr/apr-util_1.3.4.bb |    1 +
>>>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/recipes/apr/apr-util_1.3.4.bb
>>>> b/recipes/apr/apr-util_1.3.4.bb
>>>> index cc6781b..5e31171 100644
>>>> --- a/recipes/apr/apr-util_1.3.4.bb
>>>> +++ b/recipes/apr/apr-util_1.3.4.bb
>>>> @@ -14,6 +14,7 @@ EXTRA_OECONF =
>>>> "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
>>>>         --with-gdbm=${STAGING_DIR_HOST}${layout_prefix} \
>>>>         --without-sqlite2 \
>>>>         --without-sqlite3 \
>>>> +                --without-pgsql \
>>>
>>> hmm... the existing file is using spaces, you use tabs... I will fix it
>>> when
>>> pushing the changes. Please try to follow the indention of the file.
>>
>> Holger committed your patch in eba2dd [1]. It would be nice if you could
>> write a elaborate commit message next time with the actual error message
>> and reason added.
>>
>>  /checking for pg_config... /usr/bin/pg_config
>>     adding "-I/usr/include/postgresql" to CPPFLAGS
>>     adding "-L/usr/lib" to LDFLAGS/
>>
>> I build tested `r7` with `minimal-uclibc` for `MACHINE = "beagleboard"`
>> and it worked for me without any problems as it was with `r6`. But I did
>> not have `pg_config` installed on my build system anyway.
>>
>>
>> Thanks,
>>
>> Paul
>
> I did the patch with "git format-patch", but sent it with thunderbird. That
> caused the line-breaks and the spaces, I suspect. I'll setup git-send-email
> for future use and improve the commit messages. Thanks for cleaning up :)
>
> - Tasslehoff
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


Now seeing what you did I remembered that I had to install postgresql
on the build machine to get it to build.

Dumb question time, is this really a thing that needs patching? Reason
I ask is because now this is another package that will need to
modified in a user.collection to get postgresql support built in.
Shouldnt removing features be something the person building should do
in their user.collection folder or similar folder, and the packages in
the recipe folder should have the package allowing as many features as
possible in the configure? To me this doesnt seem like a fix just a
work around for his situation. This has been a question I have had for
a little while now and figured should ask while there is a subject
relating. Thanks for your time and letting me know about my questions
:)


