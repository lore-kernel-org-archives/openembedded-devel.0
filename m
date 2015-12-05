Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6F87860249
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Dec 2015 10:22:23 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so89434573wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Dec 2015 02:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=cotPBwKZqT9BoKxzgVSrTUoDNcfWTLq8kYYj2wLJe4Y=;
	b=DMZ1xh9JhmCUe5Q9qjQQFh73bFkBPSTbJClHPsJa/P7XNuAx82EK3jmEFQeZ+aHgwN
	bP7WlUk9vF9iOBgPrGx+jhFzTcTiNNCVRvSLoCzb/4sl4CZuTcRmIxjFfX8elNdaEwmM
	FhqMmi0F3zgo7DK8M2waRBF7/YcVfl/VC+g5w940XpHytCyV7TYqAWW0lp+U7heMqoGg
	bjh4O9skAiFFKootCRNe8pMmtQJYXIFz167aeNeq6T0GzTPBjB0xQrPGXeEqL9vv+skl
	uErXn77ttjLLV8DR0ecfW/FM/jIKUk0E22/1xb4xZuonagzQeL4x6+YSLLTqK9yCZuDD
	/HOA==
MIME-Version: 1.0
X-Received: by 10.28.175.144 with SMTP id y138mr9813689wme.47.1449310944025;
	Sat, 05 Dec 2015 02:22:24 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Sat, 5 Dec 2015 02:22:23 -0800 (PST)
In-Reply-To: <DUB127-W2CB55D5F0C305E1BDAA27B80B0@phx.gbl>
References: <DUB127-W22D1770BD32DBD895E41FCB80C0@phx.gbl>
	<CA+chaQd+6fTZwYqVDSNb+zTEnr7dKZbmS5iYTxobtvn1OhZZpg@mail.gmail.com>
	<CA+chaQd-YtjtkE8M0ZdPESsF2tneE5A74_RiyvmPSFx5h07yWQ@mail.gmail.com>
	<DUB127-W2CB55D5F0C305E1BDAA27B80B0@phx.gbl>
Date: Sat, 5 Dec 2015 11:22:23 +0100
Message-ID: <CA+chaQeweEaqYEir=tCVJGsP=CymrX3-reCPfwAyp2xZXxKAUQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: =?UTF-8?B?UmU6IFttZXRhLXF0NV0gR1N0cmVhbWVyLTEuMCBwYXRoIGJyZWFraW5nIDAuMSBzdXBwb3J04oCP?=
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
X-List-Received-Date: Sat, 05 Dec 2015 10:22:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Apply the current patch with git am, modify the files which need to be
modified, mark them with git add, amend the original commit with git commit
--amend and use git send-email -1 to send it.

On Sat, Dec 5, 2015 at 8:49 AM, Gerhard de Clercq <
gerharddeclercq@outlook.com> wrote:

> I guess I'm the only one still stuck on 0.1 but I'll try to send in a
> patch for whoever also comes to need this. I would appreciate some advice
> with regards to how I should submit a patch because this is in fact a pat=
ch
> on a patch file which is something quite strange if you ask me.
>
> I tried to modify the actual patch file manually but that did not go to
> well. I ended up just applying the current patch to a clean repo clone,
> copying my modified files to it and then just saving "git diff" to a file
> to create a newer version of that patch. This does not generate a nice
> header block like the old patch file had but it does seem to work. Is the
> header important and if so, how should I generate it?
>
> One I have this new patch, should I simply replace contents of the old
> file with the new one's and run "git send-email". That would seem normal
> but with this being a patch on a patch file it will look like a complete
> mess considering the new one is not even really derived from the old one.
>
> > Date: Sat, 5 Dec 2015 00:01:53 +0100
> > From: martin.jansa@gmail.com
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe]     [meta-qt5] GStreamer-1.0 path breaking 0.1 suppor=
t=E2=80=8F
> >
> > FWIW: there is also:
> > http://patchwork.openembedded.org/patch/88555/
> >
> > also still waiting for v3 and I don't know if it was tested with 0.10
> > gstreamer.
> >
> > On Fri, Dec 4, 2015 at 11:59 PM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> > > > Otherwise, why is the patch that seems to have been accepted in 201=
4
> to
> > > fix the 1.0 breaking 0.1 support not been implemented in the layer ye=
t?
> > >
> > > It's incorrectly marked as Accepted in patchwork, but it was never
> merged
> > > into the repository, because the author never sent v2 with review
> comments
> > > from me resolved.
> > >
> > > There was another patch:
> > > http://patchwork.openembedded.org/patch/85075/
> > > which was merged and nobody was reporting broken 0.10 support since
> then.
> > > I'm not using 0.10 version, so I was assuming it works now for people
> who
> > > do.
> > >
> > > Regards,
> > >
> > >
> > > On Fri, Dec 4, 2015 at 11:24 PM, Gerhard de Clercq <
> > > gerharddeclercq@outlook.com> wrote:
> > >
> > >> Hi,
> > >>
> > >> I've just wasted a lot of time trying to get qtmultimedia to compile
> on a
> > >> Fido build using the Fido branch of meta-qt5. After a lot of
> tinkering I
> > >> finally got it working and have found that the problem was caused by
> the
> > >> 0001-Initial-porting-effort-to-GStreamer-1.0.patch file that ships
> with the
> > >> layer. I initially didn't realize that the troublesome code was
> coming from
> > >> it and debugged the cached source (which it seems is patched) until =
it
> > >> worked. I didn't think it would be so easy but a patch
> > >> http://patchwork.openembedded.org/patch/79531/ I found from 2014
> > >> completely told me how to correct the source.
> > >>
> > >> What bothers me is how can this can be possible. Are the recipes
> designed
> > >> not to apply the patch to non 1.0 build and if so, what could preven=
t
> that
> > >> from working? Otherwise, why is the patch that seems to have been
> accepted
> > >> in 2014 to fix the 1.0 breaking 0.1 support not been implemented in
> the
> > >> layer yet?
> > >>
> > >> PS. I see the patch file has changed a bit after Fido but
> unfortunately
> > >> Fido is the latest that my board supports at the moment and I have
> not been
> > >> able to test with a newer version.
> > >>
> > >> Regards,
> > >> Gerhard de Clercq
> > >> --
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >>
> > >
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

