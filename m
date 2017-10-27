Return-Path: <matt.hoosier@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5C959782E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 16:41:44 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id y83so4879668wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=y0Rjcc/mXRB79j23QhgB0ZIVa8l5nMSYSMflWAjrALI=;
	b=KLt4bpvomkZ5tuGT0bLmyfKcRTtRu2he/3AcEeGpoyOCm9vhxQnajqzLbmrvwPp4/y
	x4EqMt8W1tPL4ZG6talaLBqWI2RvnxNWCYow/6q2lrlD/b8is82qAe/dstH7QNptGszE
	OCqRGJr8V8NSR0DPlqQK3ioMq5yrkU8q53+J7P0osqdC5f4OGP4SJPvgzMjWVgGn5ARA
	13hmKaBA9Ri+/Lwr4aIxhKMN5scejbPLTK+hiQoQyH+sAyCtCnsK7yMhA4AUn2aXXTP8
	guAIzEoF7z9JvLLxxMdLR+tw7EJeu9u0hyQOFaZqNixLppa84CYL+hJxII+6wbx2ZtnS
	7Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=y0Rjcc/mXRB79j23QhgB0ZIVa8l5nMSYSMflWAjrALI=;
	b=dfpT34t3ZW93j0T1BNLG9k7YVi6zU61/CvELuRdr56h38rTM7l+sSlL603FhjiSYhe
	euv6Z9qjL2wvy7MCG3jQp/jO/QzVueo/FLt2IOJgsWxqbAx0wpSUCD9icv4RFeePTHkR
	xSmbcsGy90tUEnxkU5jLh1mdaRR9f/UKGymXrYJrV98iIgI3jgaCqLF9YEfCliTivms8
	XfUN61Mqx6sX4ZgMxKg0jffo1OZm3LkryIs8KxqlJwZV8/ORrRpASHqIRMm32RsWnYcY
	Nu6tf2TKzydxFg1ojYUPzxk1wjRoOtCWlDStFAEdfpgwG/GrsfehYj/K59RqetGtIPPL
	vrAw==
X-Gm-Message-State: AMCzsaVPkhe6i1D40pbTOzDMX3HriShhtMADUkvPX5XUrK6fvikdFiRh
	QRhVFq/LqKxIhhDVznpOwwwQ7gwZAm9ETPkbyG0QHg==
X-Google-Smtp-Source: ABhQp+RFr8Z79yoPRurNhiQyhmefVzIZjv5+xilyduATVWt1MDvAlhkGUSxa8jXhhv/5IxI5C4Ed3O909uOVPEwkCk4=
X-Received: by 10.28.101.4 with SMTP id z4mr933013wmb.77.1509122505716; Fri,
	27 Oct 2017 09:41:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.231.10 with HTTP; Fri, 27 Oct 2017 09:41:05 -0700 (PDT)
From: Matt Hoosier <matt.hoosier@gmail.com>
Date: Fri, 27 Oct 2017 11:41:05 -0500
Message-ID: <CAJgxT3_POtfz1FBsNRCAj2aH7ng2VWFRgVfTwKOYoJ4CN4oZww@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Method for specifying which among a recipe's multiple available licenses is desired?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Oct 2017 16:41:45 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm searching for an annotation that I can insert (perhaps with a
.bbappend) into a recipe that indicates which of the multiple licensing
terms I elect to use for a given recipe.

The regular LICENSE_FLAGS_WHITELIST variable is somewhat related, but it
works in the opposite way: make an exception to global preference against a
license.

What I had in mind would work as follows. Suppose foo.bb has:

  LICENSE="MIT BSD LGPLv2 LGPLv3"

If I choose to take only the MIT or LGPLv2 terms of use for this one
package (not as an overall global prohibition against the remaining
licenses), the idea is that I would write something like:

  LICENSE_CHOSEN="MIT LGPLv2"

The main desired outcome is that the build/tmp/deploy/license/<pn>
directory will only contain the texts of the license terms that I actually
accepted, rather than all conceivable ones under which Foo is offered.

It would be a bonus if some Bitbake magic behind the scenes would validate
that there is a nonempty intersection between ${LICENSE} and
${LICENSE_CHOSEN}. If there's no overlap, an explicit fatal error would be
nice. But this isn't a deal-breaker; I can infer this from an empty
build/tmp/deploy/license/<pn> directory.

Are there any existing add-on bbclass'es that might do this? I had a brief
try at rolling my own, but parsing the nested LICENSE text involving && and
|| operators looks non-trivial.

