Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id BA9A471E12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:20:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1487809247; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=ae4V/tHknoF0ylJ3xbP+CSOZnx7c9N4Gbhkj2wqwDPg=;
	b=APwDVVO2/+93GGzduChdrH1k+Sr8skitr74uk0DOp1vA3pmUGgei0CGHze2EF7Jei6F9/kM3
	wYhC3F4j6kBOTFqevNUfcsjWCPNGTXGiiHem0RNf0iarbbcTj6hm4kIa28n7nGIG2W2g+DAv
	NLvG8yERcpsX6SdYCGpXn+ZLV0E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=Vwil+heZAbg9C08xmMaq837OWWQuNxyt91Vfs63sjvDthLrNwEQavyUGQdmL4kg2KGVH7T
	bamMZ2tlsa11/1ZuN3jsGudnCTUE12IknrcIDLj+knYoJaBytvgzFOxBWeN3gNvit9XTOCwA
	YmUJauJ2dHh9gtsg9DtvbOvws2qdw=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mxa.mailgun.org with ESMTP id 58ae2ade.7f3f7061bc30-smtp-out-n02;
	Thu, 23 Feb 2017 00:20:46 -0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id y135so18866914itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:20:46 -0800 (PST)
X-Gm-Message-State: AMke39kFRVbKUWtZpr5tN9ZVdbxMWph5oK76HRrq1dInKQORJBHs/ASpWVHZPZHck5lix/M1jBQWZuy7Okh0GQ==
X-Received: by 10.36.36.142 with SMTP id f136mr1480190ita.0.1487809246295;
	Wed, 22 Feb 2017 16:20:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Wed, 22 Feb 2017 16:20:45 -0800 (PST)
In-Reply-To: <CA+chaQe23zrLkeJ81iyWxx__=S2PDjGtTSGqm8x5KZOtMd5D_w@mail.gmail.com>
References: <20170222213254.GH3283@jama>
	<506a5e6c-36f6-7b1f-a375-24bebb57342f@linuxfoundation.org>
	<CA+chaQe23zrLkeJ81iyWxx__=S2PDjGtTSGqm8x5KZOtMd5D_w@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Wed, 22 Feb 2017 19:20:45 -0500
X-Gmail-Original-Message-ID: <CADNbA1p6goBBoCOYyp9jm+1tWPjomEtvmOdsHh0_fmnw3APmgA@mail.gmail.com>
Message-ID: <CADNbA1p6goBBoCOYyp9jm+1tWPjomEtvmOdsHh0_fmnw3APmgA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Before you ping some older patches
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
X-List-Received-Date: Thu, 23 Feb 2017 00:20:47 -0000
Content-Type: text/plain; charset=UTF-8

I resubmitted each of the patches (as V2s) that didn't make it into
master-next.  If we miss any patches in meta-python, I will catch it with
my nightly CI run, so there isn't a need to write a script to search for
missing patches there.  Thanks.

-Derek

On Wed, Feb 22, 2017 at 6:48 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Hi Michael,
>
> thanks for quick fix.
>
> The hook now shows error about sendmail I wasn't seeing before:
>
> OE @ ~/meta-openembedded $ git push origin master-next
> Counting objects: 78, done.
> Delta compression using up to 8 threads.
> Compressing objects: 100% (25/25), done.
> Writing objects: 100% (78/78), 7.35 KiB | 0 bytes/s, done.
> Total 78 (delta 56), reused 66 (delta 49)
> remote: No sendmail executable found.  Try setting
> multimailhook.sendmailCommand.
> To git.openembedded.org:meta-openembedded
>    eb7979113..0d27137f0  master-next -> master-next
>
>
> On Thu, Feb 23, 2017 at 12:06 AM, Michael Halstead <
> mhalstead@linuxfoundation.org> wrote:
>
> > The hooks are repaired and need testing. (Bad git/config settings.)
> Please
> > feel free to resubmit patches. Let me know if they do not appear in
> > patchwork.
> > I'm trying to see if I can automatically resend the missed patches and
> > mark them superseded if needed. I'll update post here if it works.
> >
> >
> >
> > On 02/22/2017 01:32 PM, Martin Jansa wrote:
> >
> > 1) Make sure they aren't already in master (or master-next), currently
> > there is only one change in master-next:
> > eb7979113 netcat-openbsd: fix implicit dependency on pkg-config
> >
> > 2) Make sure there weren't some negative feedback comments on our change
> >
> > 3) Make sure the change made it to patchwork, currently there is only
> > one "open" change:https://patchwork.openembedded.org/patch/137499/
> >
> > Be aware that the changes are usually daily marked as archived, when
> > they are sorted to corresponding bundles and included in master-next
> > branch for testing, as described here:http://www.openembedded.
> org/wiki/Patchwork#Multiple_layers_sharing_the_same_oe_
> project_on_patchwork
> >
> > I'm writing this, because currently many changes are missing on
> patchwork,
> > because of some unknown issue with it, see:http://lists.openembedded.
> org/pipermail/openembedded-devel/2017-February/111467.html
> > once this issue is resolved, please re-send missing changes.
> >
> > Regards,
> >
> >
> >
> >
> > --
> > Michael Halstead
> > Linux Foundation / SysAdmin
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

