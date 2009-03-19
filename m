Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LkCas-0004PF-Hl
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 08:23:14 +0100
Received: by fxm20 with SMTP id 20so347295fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2009 00:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RaCtXLmTSqwlMuTjZflaxKlLDakU+MIYX+HBCNb7fFY=;
	b=JOLmB5gK0SG83A7igY/bpiRbPyGyaUkOCE5Kxz6oOzw4HAFYdnwJ2ShxrOqBcJ2j2m
	zMvK2iShYdem61wacak8b+BhHsFXO4fBMlchqxLyCl94/uTYpbBigU59SvNwx15kc8Vw
	zLqQhVX+hxPU7TtTXY8yFKMrf2AguObivZm4w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lz9tT3+XsmgPHgEZG4Z485ET5ofzqIZ6HAAjvGGS5N5kl6vjJTpbGaTix1TRhWhQTY
	2+5c29rSmINXlbQWvf7tSAx9UrDxZq/MYF61r3wiVsyQig1QmaEjAmGk73K0NczKhS6V
	as5UYb1Pj9nLiQ8yKv2+6uNkb/ZQ2KFJ0mBIU=
MIME-Version: 1.0
Received: by 10.223.108.75 with SMTP id e11mr1782762fap.97.1237447333503; Thu, 
	19 Mar 2009 00:22:13 -0700 (PDT)
In-Reply-To: <20090319031330.GB27595@denix.org>
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<49BEF545.4040608@dls.net> <20090317192619.GA15734@denix.org>
	<f46da1cf0903181725y177da239y9970995168a677b7@mail.gmail.com>
	<20090319020125.GA27595@denix.org> <20090319031330.GB27595@denix.org>
Date: Thu, 19 Mar 2009 08:22:13 +0100
Message-ID: <ac9c93b10903190022g15c2d59dkd814e5304cc33fb9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.172
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_05,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] rename packages/ to recipes/ per earlier agreement
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
X-List-Received-Date: Thu, 19 Mar 2009 07:23:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

There are still a few related tasks pending.
One of them is updating the wiki. (e.g.
http://wiki.openembedded.net/index.php/Getting_Started)
probably it is most convenient if someone does it who can access the
system and the files and directly invoke an editor (assuming it are
files and not in a database).

Frans.

2009/3/19 Denys Dmytriyenko <denis@denix.org>:
> On Wed, Mar 18, 2009 at 10:01:25PM -0400, Denys Dmytriyenko wrote:
>> On Wed, Mar 18, 2009 at 05:25:11PM -0700, Theodore A. Roth wrote:
>> > On Tue, Mar 17, 2009 at 12:26 PM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>> > > On Mon, Mar 16, 2009 at 07:56:37PM -0500, Mike (mwester) wrote:
>> > >>
>> > >> Denys Dmytriyenko wrote:
>> > >> > Renaming packages/ directory to recipes/, as one of the several s=
tructural
>> > >> > changes, was proposed by Koen[1] and agreed/approved by many. Sin=
ce Koen
>> > >> > currently doesn't have time/ability to do the change, and some pe=
ople are
>> > >> > too eager to wait any longer, he asked me to do it. Please ack/na=
ck.
>> > >>
>> > >> Ack. =A0 But can you please tag the revision immediately preceeding=
 the
>> > >> commit of this change so we have some easy-to-reference point[*] in=
 the
>> > >> history?
>> > >
>> > > Done. mv-packages-to-recipes-pre and mv-packages-to-recipes-post are=
 the tags
>> > > applied right before and right after the change.
>> > >
>> >
>> > Is the packages directory supposed to be empty now? There are still a
>> > few subdirs left:
>> >
>> >
>> > roth@dorkboy:~/dev/OE/openembedded/packages$ ls -1
>> > automake/
>> > blueprobe/
>> > busybox/
>> > coreutils/
>> > gnome/
>> > gpe-gallery/
>> > pkgconfig/
>> > pyneo/
>> > qt4/
>> > udev/
>>
>> Those are empty directories (unless you have uncommited changes in them)=
.
>> That is because git only keeps track of files, not directories. A simple
>> rename of a single directory resulted in thousands of renames of individ=
ual
>> files. When you did "git pull" all the files were moved, leaving the old
>> hierarchy empty. It should be safe to remove by "rm -r packages" - if th=
ere
>> are still files there, rm will fail. And if you do a fresh "git clone", =
there
>> will be no packages/ directory there.
>
> Argh, the above "rm -r packages" is not safe, as it won't fail removing f=
iles.
> Please use this command instead:
> find packages -depth -type d -empty -exec rmdir {} \;
>
>> > I will generate a patch to the usermanual to note the new recipes
>> > directory.
>>
>> Thanks for taking care of the documentation.
>>
>> > I am curious is the old packages will still be kept around
>> > or if it will be completely removed. If kept, how would it be
>> > described versus the recipes dir?
>>
>> Now recipes/ directory name represents its contents. Packages are normal=
ly
>> generated by running/processing recipes. But they are placed inside DEPL=
OY_DIR
>> and I'm not sure there is any need in packages/ directory in the reposit=
ory.
>
> --
> Denys
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


