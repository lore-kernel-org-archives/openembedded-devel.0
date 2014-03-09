Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 427166BB2F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Mar 2014 04:54:05 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id p9so3740984lbv.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Mar 2014 20:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=sgQuqDBuG+Rn+OedHgE8pC33y+g+v0ynofzAGi+0+OY=;
	b=h9oYWVuB7VJ1xsOWXTmSBLVoSZTcDuzRJnOLZn2nIi8VfZ3NTJQ1m1N8cCCre9zluj
	2IY2aoRXUWf/Z7ODXeFVX5mNxbvoyXsiHnwgIbWjb4GriFCh2XNipvUhL8qKizFmGJ1D
	Kg7dSY9U7Vgq9ZjhjSgkJx8zTY5D0ZyDiHyB3pgwDWNC9lM+QpAvjTCvvKLzg6zDye0R
	50lvSJA4l9E1g77CFzYePI8vsN8S9azEhK3WmZMIubm5RDxN53KXRxnTPpHOv2og6Nie
	cL6msOBIGapk/qQitONk2vqyJ0UAk4UwFhe1YlalgQUTX7UMvg1Q+CMWEnUEZMsAWQlC
	Qe/g==
MIME-Version: 1.0
X-Received: by 10.152.43.47 with SMTP id t15mr722298lal.38.1394340845489; Sat,
	08 Mar 2014 20:54:05 -0800 (PST)
Received: by 10.114.191.202 with HTTP; Sat, 8 Mar 2014 20:54:05 -0800 (PST)
In-Reply-To: <53177FD1.2010407@topic.nl>
References: <1393696487-30736-1-git-send-email-mike.looijmans@topic.nl>
	<20140305180816.GA26981@jama> <53177FD1.2010407@topic.nl>
Date: Sat, 8 Mar 2014 20:54:05 -0800
Message-ID: <CANx9H-AdLMkQ6sZtwy-v+Bkk=GhqPY3L9FJZQiBqXVBWs3VG2A@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] musicbrainz: Build with B=S
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Mar 2014 04:54:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

I may have gone extra steps to get to the bottom of the build error, but my
solution is not even slightly pretty. If it works to just set $B=$S that is
simpler than my do_configure hack. Otherwise we'd have to look into a
change in cmake class which I doubt is justified--or further patch
libmusicbrainz.
KISS.

--Tim


On Wed, Mar 5, 2014 at 11:49 AM, Mike Looijmans <mike.looijmans@topic.nl>wrote:

> On 5-3-2014 19:08, Martin Jansa wrote:
>
>> On Sat, Mar 01, 2014 at 06:54:47PM +0100, mike.looijmans@topic.nl wrote:
>>
>>> From: Mike Looijmans <milo-software@users.sourceforge.net>
>>>
>>> This recipe doesn't work when B!=S, so force B=$S to fix the failure.
>>>
>>> Signed-off-by: Mike Looijmans <milo-software@users.sourceforge.net>
>>>
>> What's the relation of this change to
>> http://patchwork.openembedded.org/patch/67597/
>> ?
>>
>
> I suspect they both accomplish the same: Make the project compile again.
> Mine is the simplistic approach I guess - I did the least I could possible
> get away with... "Theirs" looks more like they actually understand what's
> going on
>
> Mike.
>
>
>
>  ---
>>>   .../musicbrainz/libmusicbrainz_git.bb              |    3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusi
>>> cbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusi
>>> cbrainz_git.bb
>>> index f6a8f53..4cc04b8 100644
>>> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusi
>>> cbrainz_git.bb
>>> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusi
>>> cbrainz_git.bb
>>> @@ -37,3 +37,6 @@ do_configure_prepend() {
>>>     EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:PATH=${libdir} \
>>>                    -DIMPORT_EXECUTABLES=build-native/ImportExecutables.
>>> cmake"
>>> +
>>> +# out-of-tree building doesn't appear to work for this package.
>>> +B = "${S}"
>>> --
>>> 1.7.9.5
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>
> --
> Mike Looijmans
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

