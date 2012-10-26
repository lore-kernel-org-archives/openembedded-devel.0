Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TRi33-00045S-Gl
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 13:25:57 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so3605206ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4Glclqj8QObgwLsuTXEp4ZdJRYPgXbgGMVdsIQKNBiw=;
	b=TUZShRu5Rjm4MiX93IDJ+lmF38Ywoujn3HmrSnI+3FdyVkG8jOp/an58gvAJVlmupu
	qIiujE/QG8EfV1aRlh3KuCkDgATzEQZyuqlbZdDxJiy20Ncz88BJSTfH7LJNwVDO8Wxq
	PQBmmsu847Da4+qE8BXYI5VqVvRMdTTtYf1OEWleCp4Q2NB0uoMjz8vr/IUXX6sClhYn
	Rbdq1NrdIt95YarAv0LVIu0b7QMTV/xVEFaHzXMUkGNE7BamSRDF75slAz1c2jAJQy1w
	10JM1b9QIGbCkBuMg1MNXleg7k5mroiVBnzBdfcFzF9H7FGn9GAGUaQ/xmi8YCBDGr0d
	eHhQ==
MIME-Version: 1.0
Received: by 10.50.236.74 with SMTP id us10mr1824823igc.5.1351249946999; Fri,
	26 Oct 2012 04:12:26 -0700 (PDT)
Received: by 10.64.24.179 with HTTP; Fri, 26 Oct 2012 04:12:26 -0700 (PDT)
In-Reply-To: <4772E7C9DD9B9D4EB442B23D7FE42EEA01F32E92@Exchange01.audio.local>
References: <4772E7C9DD9B9D4EB442B23D7FE42EEA01F32E92@Exchange01.audio.local>
Date: Fri, 26 Oct 2012 13:12:26 +0200
Message-ID: <CAGiJk9dmLv549hBTizFHw19xYNtuLnqHgWOh7bh8JMyE+t-b5A@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: sox-native
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
X-List-Received-Date: Fri, 26 Oct 2012 11:25:57 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/26 John Stirling <john.stirling@audiopartnership.com>:
> Hi,
>
>
>
> Our OE build is based on angstrom (master) -
>
>
>
> https://github.com/Angstrom-distribution/setup-scripts/blob/master/sourc
> es/layers.txt
>
>
>
> As part of our build we need to use sox to generate some audio files
> that are present on the image.
>
>
>
> I'm getting stuck trying to build sox-native -
>
>
>
Hi,

if you need to create the files dynamically for each target (e.g. the
files change with each build) then there is at least one other
possibility.

>
>
>
> I suspect that going through each error and adding a BBCLASSEXTEND line
> is not going to work ?


Basically what you do now is: Add native providers for each dependency
recursively (yes this could work).
But maybe it is easier to generate the files on the target? (not native)


If on target generation isn't an option for you, then all I can do is
recommend "bitbake -g -u depexp sox".
With this tool you can view the dependencies and don't have to wait
for bitbake to resolve them / to see them.


-- 
Regards
Samuel


