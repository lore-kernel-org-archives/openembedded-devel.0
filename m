Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 457F4784E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 14:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7AE53180FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:51:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hOIv8lMfwiKK
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:51:27 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 09D4218454
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:51:27 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D41C11A072
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:51:26 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C774A1A069
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:51:26 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:51:26 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id BB1F12A9A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:51:26 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 7 Dec 2017 15:51:26 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Thu, 7 Dec 2017 15:51:26 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] sstate.bbclass: Add progress bars when removing
	from	the sysroots
Thread-Index: AQHTb2qNXa8KA+Uh+0isiUfMl2xhQqM39nKQ
Date: Thu, 7 Dec 2017 14:51:26 +0000
Message-ID: <80a7627594d542c3a0caa9adad0be224@XBOX02.axis.com>
References: <20171207143951.21325-1-pkj@axis.com>
In-Reply-To: <20171207143951.21325-1-pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] sstate.bbclass: Add progress bars when removing from	the sysroots
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
X-List-Received-Date: Thu, 07 Dec 2017 14:51:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

And this was of course intended to go to the openembedded-core list.

//Peter

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Peter Kjellerstedt
> Sent: den 7 december 2017 15:40
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH] sstate.bbclass: Add progress bars when removing
> from the sysroots
>=20
> If there are many recipes that should be cleaned out from the
> sysroots, it can actually take some time. This adds a progress bar to
> give a visual clue that the clean up is actually progressing.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/sstate.bbclass | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index e30fbe1280..6e41b56861 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -845,7 +845,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash,
> sq_hashfn, d, siginfo=3DFalse):
>                  missed.append(task)
>                  bb.debug(2, "SState: Unsuccessful fetch test for %s" %
> srcuri)
>                  pass
> -            bb.event.fire(bb.event.ProcessProgress("Checking sstate
> mirror object availability", len(tasklist) -
> thread_worker.tasks.qsize()), d)
> +            bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist)
> - thread_worker.tasks.qsize()), d)
>=20
>          tasklist =3D []
>          for task in range(len(sq_fn)):
> @@ -856,7 +856,8 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash,
> sq_hashfn, d, siginfo=3DFalse):
>              tasklist.append((task, sstatefile))
>=20
>          if tasklist:
> -            bb.event.fire(bb.event.ProcessStarted("Checking sstate
> mirror object availability", len(tasklist)), d)
> +            msg =3D "Checking sstate mirror object availability"
> +            bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)),
> d)
>=20
>              import multiprocessing
>              nproc =3D min(multiprocessing.cpu_count(), len(tasklist))
> @@ -870,7 +871,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash,
> sq_hashfn, d, siginfo=3DFalse):
>              pool.wait_completion()
>              bb.event.disable_threadlock()
>=20
> -            bb.event.fire(bb.event.ProcessFinished("Checking sstate
> mirror object availability"), d)
> +            bb.event.fire(bb.event.ProcessFinished(msg), d)
>=20
>      inheritlist =3D d.getVar("INHERIT")
>      if "toaster" in inheritlist:
> @@ -1038,18 +1039,25 @@ python sstate_eventhandler2() {
>                          seen.append(stamp)
>=20
>          if toremove:
> -            bb.note("There are %d recipes to be removed from sysroot
> %s, removing..." % (len(toremove), a))
> +            msg =3D "Removing %d recipes from the %s sysroot" %
> (len(toremove), a)
> +            bb.event.fire(bb.event.ProcessStarted(msg, len(toremove)),
> d)
> +
> +            removed =3D 0
> +            for r in toremove:
> +                (stamp, manifest, workdir) =3D r.split()
> +                for m in glob.glob(manifest + ".*"):
> +                    if m.endswith(".postrm"):
> +                        continue
> +                    sstate_clean_manifest(m, d)
> +                bb.utils.remove(stamp + "*")
> +                if removeworkdir:
> +                    bb.utils.remove(workdir, recurse =3D True)
> +                lines.remove(r)
> +                removed =3D removed + 1
> +                bb.event.fire(bb.event.ProcessProgress(msg, removed),
> d)
> +
> +            bb.event.fire(bb.event.ProcessFinished(msg), d)
>=20
> -        for r in toremove:
> -            (stamp, manifest, workdir) =3D r.split()
> -            for m in glob.glob(manifest + ".*"):
> -                if m.endswith(".postrm"):
> -                    continue
> -                sstate_clean_manifest(m, d)
> -            bb.utils.remove(stamp + "*")
> -            if removeworkdir:
> -                bb.utils.remove(workdir, recurse =3D True)
> -            lines.remove(r)
>          with open(i, "w") as f:
>              for l in lines:
>                  f.write(l)
> --
> 2.12.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

