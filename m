Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OwLWa-00059o-Se
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 22:57:46 +0200
Received: by iwn2 with SMTP id 2so1330864iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 13:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GwX9xO29UcGCMbpRzjE+RMn5bH5u/gAAnui0rSDebJc=;
	b=Av0/gU4JkbPfVkV56Xl3aZfNwQyiljuc3mfcPOJ2ebLFJ1vOPpYoNfI6V5gMb0rKip
	VP1BfyaKRQIrz77FsEkG6t5t0NVjaVwgX3Ti0lzUf6PECZx90butviIrv0PlfpjB3l7+
	thZsYcCxM/1pVnU959PuhaSOAGZuaGSgeChUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=m7yvPfm7I7PsoTPqIpbDdDvhQPY4Foqk/a9wmlBRmFWAT0csQrOYtX+baGr8IOK8T9
	vbuwkaDiFoWqjS7fbbztAwulAwm/k5EOZj7YWCwi73rT6XQRP6ydfTG42AfQjjpI2iDe
	9uuWvqhwHwAGINvX8+RZLseUX7LPLkJ7DmSYE=
MIME-Version: 1.0
Received: by 10.231.149.207 with SMTP id u15mr4067023ibv.13.1284670615383;
	Thu, 16 Sep 2010 13:56:55 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Thu, 16 Sep 2010 13:56:55 -0700 (PDT)
In-Reply-To: <4C8E9653.2020601@balister.org>
References: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>
	<AANLkTikd-_vDny=kJKeS+NVWeYyfxiE_yXdUE+t1ac48@mail.gmail.com>
	<AANLkTi=s9gHBx_uPgiPGhu9b7D10JGytQaxyd-SZ+sfQ@mail.gmail.com>
	<AANLkTinWXK-HZHOLv2b2ApdPQ+LW22bvwsOO5TGOc1kx@mail.gmail.com>
	<AANLkTim9n1JsDc+bmYN5g20kBtobi5Ti-60Joq1U_rQZ@mail.gmail.com>
	<AANLkTi=r1NxVPeRVSSP24YXJSRDxUBwvLQo4PH6_iRxj@mail.gmail.com>
	<AANLkTimkhhnmDTWH3=Vx5hVN=Hpy5WXpnUX-E5QfRobb@mail.gmail.com>
	<4C8E9653.2020601@balister.org>
Date: Thu, 16 Sep 2010 22:56:55 +0200
Message-ID: <AANLkTiko_vEXjjW+SUrvb=V+R-Vu0p3AvN7hcdD+Ghjg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: script to remove orphaned files
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
X-List-Received-Date: Thu, 16 Sep 2010 20:57:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/13 Philip Balister <philip@balister.org>:
> On 09/13/2010 04:42 PM, Khem Raj wrote:
>>
>> On Mon, Sep 13, 2010 at 1:20 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> =A0wrote:
>>>
>>> As I don't really see progress on this, I am planning to take action
>>> in a few days.
>>> Since Khem expressed a preference to keep the files accessible, I'm
>>> planning not to remove the unneeded patches, but instead move the to
>>> the obsolete dir.
>>> (alternate could be to move them to a dir called unused in the recipe
>>> dir).
>>> Removal will be tested by verifying that bitbake -c patch remains
>>> working on all dirs where unused files are removed.
>>>
>>
>> sometimes same names patches exist in different dirs and if you remove
>> one then it will start picking the other one
>> silently so make sure such cases are not there. In general I am wary
>> of mass changes which could creep in some bugs like that
>> Ideally I would suggest that you look at each and every change before it=
s
>> final.
>
> I agree with Khem. please do this a directory of recipes at a time.
>
> Philip
>
Dear all,

I've just pushed the first few recipes. One at a time would stretch it
very long (there are some 160 recipe dirs with unused files), so was
planning to take the recipes starting with the same letter at the same
time (or if there only one or two recipes in it I might combine a
little bit, e.g. as a starter I've taken the recipes starting with z
(1 recipe folder with dups) and a (5 recipe folders with dups).
For letters that have many recipes with dups I'll probably split in two.
Btw I am not going to do this in strict alphabetical order. b and g
(which contain quite some dups for binutils and gcc) will probably be
done last.

And if a recipe maintainer wants to do the work him/herself: greatly
appreciated. Just go ahead.
I've pushed the script I use to do this. It is in contrib and called
clean-recipe.

The patches I just pushed are tested using bitbake -c patch for all
recipes as far as possible).
(in the recipes I pushed I could not test alsa-scenario_git.bb as it
didn't fetch for me and alsa-driver_0.9.6-hh4c.bb as it was for h3600
and h3900 only),
Results are both visually reviewed as well as a grep on failed. The
two failing recipes got an additional verification by checking that
the patches for it were not deleted.

Enjoy! Frans.

PS: wrt the remark of Khem: if a patch file is used in any recipe the
file is never removed. I'm staying at the safe side here (and the
downside is that there might still be a few unused files left, but at
least the bulk of the work is done, doing a full-fledged cleanup would
require parsing the bb files fully and emitting a list of all patches
that are applied (including directory), then remove the files in the
list. That can also deal with things like ${PV} in a patch. Probably
it is not overly complicated to write something like this, but it is
beyond my current capabilities, guess it would require instrumenting
do_patch to echo the name, then do a -c patchall or so). Anyway, no
plans to do that for now. FM.


