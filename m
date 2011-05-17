Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1QMJw7-0003nn-Ug
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 15:03:44 +0200
Received: by vws2 with SMTP id 2so328354vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 06:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=NRVbZ3dl3vHRVKtdAABOxh2pkH2gxb+YQk9W6h+TtJM=;
	b=qfK1Z9XIuMVFLBeF8y2I3Sjx0qj9i8eZ1Pvn2TvtWTnUj4pn7rfgI0S5PnGV31FHMw
	6VXdSPKchFRP8h99gDwS1lAPFOx2Ezhad+3U6zcwxiCY+6x6F6pJWy5B/X0uAiB7jlGv
	TcX5EOGXxd9NJlmfHc7/zXvNQDUToW9Ljbhqo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=diY95UzhwAY1Jmp0mt14pxHXkktZOKbQ8xnHZ1CLA3Xb7uUJ139ATKq0eudtegt+BQ
	hxvXCFlOwkcs5lgSAG5jCsy/qNuovZYLZgH3If4r++BCo19rvzbinFSBPDkU03ZqXmfV
	kJzm9pCn5cAMT1s3Z3ILLNyNUW8l29EGQqdbI=
MIME-Version: 1.0
Received: by 10.52.100.163 with SMTP id ez3mr834749vdb.150.1305637250046; Tue,
	17 May 2011 06:00:50 -0700 (PDT)
Received: by 10.52.114.33 with HTTP; Tue, 17 May 2011 06:00:50 -0700 (PDT)
In-Reply-To: <1305621062.4065.20.camel@mattotaupa>
References: <1304951256.3791.61.camel@mattotaupa>
	<1305621062.4065.20.camel@mattotaupa>
Date: Tue, 17 May 2011 06:00:50 -0700
Message-ID: <BANLkTi=aVkuikkwxKoQNuQ8fTmHTZOxyhw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: gs_9.01: task configure fails with `./base/gp_unix.c:25:37: error: fontconfig/fontconfig.h: No such file or directory`
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
X-List-Received-Date: Tue, 17 May 2011 13:03:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 17, 2011 at 1:31 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:

> I have two problems with this commit though.
>
> 1. According to the build logs from Steve [2][3] this recipe fails for
> him with the same error message.

Yes, it did fail that time, but note that it completed successfully on
that same machine as well as a different machine subsequently with no
changes to the recipe!

I can't explain why that is, but we need to figure it out!  Perhaps a
missing dependency or a parallel build issue??

> 2. The recipe of `gs_8.64` was improved beforehand [4] and the above
> mentioned problem fixed (it still does not work though). Why was the new
> version not based on the old one?

Probably because this the 9.01 recipe has been sitting around in one
of my experimental branches for quite a few months and Koen pulled
quite recently.  So I likely based it off the version prior to
Graham's changes.

We should probably apply Graham's modifications to 9.01 also.

Have you tried that yet?

Steve

> Thanks,
>
> Paul
>
>
>> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=49a0babada7f58fc583d299cfc16c22fc3e42fc2
> [2] http://build.sakoman.com/packages/11697/
> [3] http://build.sakoman.com/public/logs/task/82709.txt
> [4] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=74d7b8e7a0c52178a8a111415586eb15d802a88b
>


