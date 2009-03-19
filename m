Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1LkLgv-0004as-K8
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 18:06:02 +0100
Received: by wf-out-1314.google.com with SMTP id 25so809860wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2009 10:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VDsYaGAF+c6WMMUNZdNAQ1W0Y6/lgHTea5ZVj4bDcVU=;
	b=PRNlRelXgEPt+2cZnfuYoFUXUTCMAHV5m4adCi/7PdfMJDeqo1VMKBOI8VifKBP8FZ
	Rzjo4e/VfDgc8qMcwCCpGqLXLUXe2kN1kR4g3kb3EBAquz0SL5MMgaM5LPF2CyexawUv
	19Cids8cw1mGTknp6111PNoCeaX801J+NxIdY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Nu90Pqo1ABrKYxiBE56GsGuaXTlk/qrXivbkBsWMKO5x2BFv8Iyet3My896WmJyUBp
	+2Rm2c/OTvuCFu1+AR7FsNs5tC372vT7xrxxqKE+QPdZXF53LR59I6j/QE/5abS+3Iyn
	kg1BgdrTWu6TKZmIX5p52jPrI8mWBHQgmEizQ=
MIME-Version: 1.0
Received: by 10.143.35.4 with SMTP id n4mr1028988wfj.133.1237482303224; Thu, 
	19 Mar 2009 10:05:03 -0700 (PDT)
In-Reply-To: <ac9c93b10903190022g15c2d59dkd814e5304cc33fb9@mail.gmail.com>
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<49BEF545.4040608@dls.net> <20090317192619.GA15734@denix.org>
	<f46da1cf0903181725y177da239y9970995168a677b7@mail.gmail.com>
	<20090319020125.GA27595@denix.org> <20090319031330.GB27595@denix.org>
	<ac9c93b10903190022g15c2d59dkd814e5304cc33fb9@mail.gmail.com>
Date: Thu, 19 Mar 2009 10:05:02 -0700
Message-ID: <f46da1cf0903191005s75aaf40dg35693e65a3f1b73@mail.gmail.com>
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 19 Mar 2009 17:06:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2009 at 12:22 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> There are still a few related tasks pending.
> One of them is updating the wiki. (e.g.
> http://wiki.openembedded.net/index.php/Getting_Started)
> probably it is most convenient if someone does it who can access the
> system and the files and directly invoke an editor (assuming it are
> files and not in a database).
>

Instead of updating the wiki, why not just have the wiki have a link
to the user manual at docs.openembedded.org? I have recently pulled
most of the info about getting started from the wiki into the user
manual.

Suppose that there is a stable branch that has different getting
started instructions than the dev branch. That makes the wiki either
be wrong in one case, or have to discuss both branches.

 Ted Roth

> 2009/3/19 Denys Dmytriyenko <denis@denix.org>:
>> On Wed, Mar 18, 2009 at 10:01:25PM -0400, Denys Dmytriyenko wrote:
>>> On Wed, Mar 18, 2009 at 05:25:11PM -0700, Theodore A. Roth wrote:
>>> > On Tue, Mar 17, 2009 at 12:26 PM, Denys Dmytriyenko <denis@denix.org>=
 wrote:
>>> > > On Mon, Mar 16, 2009 at 07:56:37PM -0500, Mike (mwester) wrote:
>>> > >>
>>> > >> Denys Dmytriyenko wrote:
>>> > >> > Renaming packages/ directory to recipes/, as one of the several =
structural
>>> > >> > changes, was proposed by Koen[1] and agreed/approved by many. Si=
nce Koen
>>> > >> > currently doesn't have time/ability to do the change, and some p=
eople are
>>> > >> > too eager to wait any longer, he asked me to do it. Please ack/n=
ack.
>>> > >>
>>> > >> Ack. =A0 But can you please tag the revision immediately preceedin=
g the
>>> > >> commit of this change so we have some easy-to-reference point[*] i=
n the
>>> > >> history?
>>> > >
>>> > > Done. mv-packages-to-recipes-pre and mv-packages-to-recipes-post ar=
e the tags
>>> > > applied right before and right after the change.
>>> > >
>>> >
>>> > Is the packages directory supposed to be empty now? There are still a
>>> > few subdirs left:
>>> >
>>> >
>>> > roth@dorkboy:~/dev/OE/openembedded/packages$ ls -1
>>> > automake/
>>> > blueprobe/
>>> > busybox/
>>> > coreutils/
>>> > gnome/
>>> > gpe-gallery/
>>> > pkgconfig/
>>> > pyneo/
>>> > qt4/
>>> > udev/
>>>
>>> Those are empty directories (unless you have uncommited changes in them=
).
>>> That is because git only keeps track of files, not directories. A simpl=
e
>>> rename of a single directory resulted in thousands of renames of indivi=
dual
>>> files. When you did "git pull" all the files were moved, leaving the ol=
d
>>> hierarchy empty. It should be safe to remove by "rm -r packages" - if t=
here
>>> are still files there, rm will fail. And if you do a fresh "git clone",=
 there
>>> will be no packages/ directory there.
>>
>> Argh, the above "rm -r packages" is not safe, as it won't fail removing =
files.
>> Please use this command instead:
>> find packages -depth -type d -empty -exec rmdir {} \;
>>
>>> > I will generate a patch to the usermanual to note the new recipes
>>> > directory.
>>>
>>> Thanks for taking care of the documentation.
>>>
>>> > I am curious is the old packages will still be kept around
>>> > or if it will be completely removed. If kept, how would it be
>>> > described versus the recipes dir?
>>>
>>> Now recipes/ directory name represents its contents. Packages are norma=
lly
>>> generated by running/processing recipes. But they are placed inside DEP=
LOY_DIR
>>> and I'm not sure there is any need in packages/ directory in the reposi=
tory.
>>
>> --
>> Denys
>>
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


