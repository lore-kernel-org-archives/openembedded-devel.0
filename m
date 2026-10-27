Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16293.1793099303854473235
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ixgVO6Oz;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: schonm@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso5993465a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 04:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793099302; cv=none;
        d=google.com; s=arc-20260327;
        b=pYLFp5ewTQ9n6Ixi23j4+jLlKAY9JC+Q2ykv0QBk6aZM+GKxFe/dFYbfdStyziTZ6r
         fpZaZOWLiTHRU+LNGrW/s3Pa34BFsXszZ7RVRF3fx5MzY57tg39QRQaaeQv+6ufYEkI6
         RsxccxXvzTDg6esp2VGD6Za7gqFjEKpjvPB8FuL1AQp5uv/s9cw85eaAFC3vuC1r5dgl
         0LcEiRMnc/Rd3KuhPVy1WoiJFKmCKtp3ow3yCKiBTpzsA8Fgit9ncJievPFL0z+QkvHD
         NpnCv8iP52ReWB1/4Hl1AnJQAJQtclk0qe13b5mnNnJXK3L5MDw2gib49Vqawkf0+RRv
         2oAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=77zWaX1VwOWZWXwTK1p1pxOMIiPYVDuIpcEG7k3Bego=;
        fh=IORpi1J7gwtzLiR9LizfyZc+2AZ1qzY/a2qD6TPaYT4=;
        b=nQJoDbOeQVCkru30Qo/LAlLKBXIAYP/Xb2RgU7s1X1zdKWjZs8TBGhRdaaGulDCST8
         RqmpeArWDi/yuClGnkM/1CpKmx2Qnu2qn+y5vgZu80tYEi28BGxI8ainaCTETMIT9eGB
         hUOCcetMy5ktRB47iMS50fkXJOdCl0+q2EA54tB6oeOZWsvA6nlWyzZ7/zHf/ne5ccU3
         sRL272aZNszKl/KGmy0nBa9lz0deI/C8dnAqNIJAjTA6TpQUqXNuWXb4u8AUR0kJ5APT
         LFFB87H+erSRUekbe0EAnq8+ReSpwuR7uvT7s7s7i2/rA6Hg3yJhg6RxA5jALPmDrhVk
         b1Tg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793099302; x=1793704102; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77zWaX1VwOWZWXwTK1p1pxOMIiPYVDuIpcEG7k3Bego=;
        b=ixgVO6Oz53Py1ALXSfqsHIKlQs/kI0HnjDpyrSgTbOQHRapSQE1CyIHyTvF4qhSfK9
         PAdyHmRZt6MmyUYFcg45+Zp95jPzVPatXCLClpn9wC898Jpbu/S4vUgGHXQst7Xma43y
         jzl/uQt0j1fOhiiS5ELEFNC9/dX+cFgmp3ejd3ync7I24Z6ieBjVOYBuJTcCfHfWOnAQ
         Fs6AK+6PxZBWfq8BGrV/4g7XVEMD+soXakzAreZBIJIv4L0kp7bnIs+lZoz0K0lkySG1
         S9OW2F/FtC4GgEegu7X4mmf69kwQsPsgRDkiyC3RkDhgsV7HR8U9FgY7Gx7mqo5fCBF8
         rAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099302; x=1793704102;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=77zWaX1VwOWZWXwTK1p1pxOMIiPYVDuIpcEG7k3Bego=;
        b=Yb148M1FbllANTTeX0TxiB+Nrg6aKwfSz2EATJLQ6Vh8K6hquJBgkWhOQggIjTWFvC
         yiVIz8BCb+99BCEzAI8OJQHSRjhEO5ApmWBoPUeH5LiZOmtAEYB8UYc2rFOmexRWKbpX
         FU7XWcHtEFenxSHV8BkulwHqVj3Nlomw/CdDKZ4qUDYDxdTe+iq2CQsnGTtESdivcBkt
         8Q9odaK2qaafQCdGN5HSjGPquD2UghpFWS/mNZbfFPFtI6LqRXPKvaIAtWF6DhJqv7NJ
         4GMXvaZLluDrNIqOGR8gNbeRRIEz2bsVG5N+YHrSbh9jvxohwO/moCG+m6v4ad6zfyAn
         Hd3g==
X-Forwarded-Encrypted: i=1; AKwUvBwXjRzbsLQ+T9/NzQlkD6jden74BJaQYCDRIQECT2p4v5tYTNbr2jM/tqPzP0FNpHz2X2TOW81GM3klSaup+zN0Bk0=@lists.openembedded.org
X-Gm-Message-State: AFq9FYJyRInabTcm2rL3/rMEnGsjEVoTIlNt5EoBVu0mbbx33uicfR22
	me78sxoGnWIuuZ2CQkNUqe1lxJeqYn/loVYiLII0gdTX9kRXKhlU23xhIrGTLN+I5uPXBpMAzdh
	/tCVdA1B3H3H6fFJbTu1ENqrL3N67lJQ=
X-Gm-Gg: AYBFou0glgvymvinCi8SmS+g4zmmvziOdNOdxA+JNLYAnoRyP2x2mEFPJARyu7mSn9t
	dlJu6Cae8A6msm46uljOKQRe1e1WdNLX37elAnkobsbm8W97K9xX56rXaDuCzYIvcUWwd3Ww/Kn
	2WswPDas0/c4p23mm8lpaPv7gzAvBL2jVUFEOQDSxFZleN4LzQbPgV6t16A0KapMcx5OQ5Nxs0m
	aMjvIkvTKJHboxJCKKkK+aw6mbMc6CtsCZUbuW879bG/EcOr2b8zVZFJOwQ5hk5oqGFR9Vc7lZD
	vDIWf90BE0VYCNfEOGmHnvpClJWXrRxfrUXjMjFnmh0qSoYsDM18Zcp6XCg8WkUgB+IUIGiIFhb
	4s7wNTJJlrUO6fDNWPELJCyHH2GVL3wFzJX0IvRq0PSaCHI+YWog14jrQl6oxB1+3r7ntVGeWWm
	44xTjF73TQC7vH6YiCOWq+/pOOFStHs34loWdSEAkLgBNW4ktN2QyKy5qqfX5tvrUBENiTv+6bk
	g==
X-Received: by 2002:a05:6402:5192:b0:6b4:5994:3a8e with SMTP id
 4fb4d7f45d1cf-6b459943be1mr7497026a12.10.1793099300246; Tue, 27 Oct 2026
 04:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20261027012151.438070-1-schonm@gmail.com> <CADySD0FaCc1hMZrkdW9iZzhrqa1OCB8Z2M+J2juA8Zn+TeU2sg@mail.gmail.com>
 <AS8PR10MB50731656EFA9E4A51968F31EFD602@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50731656EFA9E4A51968F31EFD602@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: "J. S." <schonm@gmail.com>
Date: Tue, 27 Oct 2026 07:08:05 -0400
X-Gm-Features: AclHuK95SsnvYAolwQJLm8Rlaj8-DSCsy_gC50yrXdZ-ATtVfqADx6sYPdSWgJk
Message-ID: <CABTo8gDmsRX7rsOz2sT7gZZA-crVH_yLB+qE45UkugpF6nbjQA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][blacksail][PATCH] c-ares: backport security fixes
 from 1.34.9
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d69b12065ed076a5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 11:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131529

--000000000000d69b12065ed076a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think the change in question is really very minor.  I suspect that taking
the upgrade to 1.34..9 as presented in master would make support long term
easier.  But I will leave it for branch maintainers to decide what's
acceptable.

Jason

On Tue, Oct 27, 2026 at 4:25=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> Can we rather do the upgrade instead? I was planning to send it for
> Wrynose branch eventually.
> Is there anything in "Changes" section of
> https://github.com/c-ares/c-ares/releases/tag/v1.34.9 which would prevent
> it?
>
> Peter
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Ankur Tyagi via
> > lists.openembedded.org
> > Sent: Tuesday, October 27, 2026 8:04 AM
> > To: schonm@gmail.com
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][blacksail][PATCH] c-ares: backport security
> fixes from
> > 1.34.9
> >
> > Hi Jason,
> >
> > Thanks for submitting the patch.
> >
> > Though the patches LGTM, I am seeing increased ptest failures.
> >
> > Existing recipe ptest status:
> > [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] 1093 tests from 41 test suites ran.
> > [  PASSED  ] 1092 tests.
> > [  FAILED  ] 1 test, listed below:
> > [  FAILED  ] DefaultChannelTest.TimeoutValue
> >
> > ptest status after applying your patch:
> > [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] 1174 tests from 47 test suites ran.
> > [  PASSED  ] 1170 tests.
> > [  FAILED  ] 4 tests, listed below:
> > [  FAILED  ] DefaultChannelTest.TimeoutValue
> > [  FAILED  ] SockStateDeliveryTest.CancelReportsSocketClose
> > [  FAILED  ] SockStateDeliveryTest.SetServersReportsSocketClose
> > [  FAILED  ] SockStateDeliveryTest.DestroyReportsSocketClose
> >
> > Perhaps some other commits also need backporting?
> > Can please look into this?
> >
> > cheers
> > Ankur
> >
> > On Tue, Oct 27, 2026 at 2:22=E2=80=AFPM J. S. via lists.openembedded.or=
g
> > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > Add the eight unique upstream commits that fix the security advisorie=
s
> > addressed in c-ares 1.34.9.
> > > Several advisories share commits, so patches are ordered by commit
> rather
> > than duplicated per advisory; each patch lists the GHSA IDs it resolves=
.
> > >
> > > Assisted-by: opencode (big-pickle)
> > > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > > ---
> > >  ...troy-detach-queries-before-callbacks.patch | 2603 +++++++++++++++=
++
> > >  ...ed-socket-server-state-notifications.patch |  393 +++
> > >  ...qcache-hand-callbacks-their-own-copy.patch | 1054 +++++++
> > >  ...connections-torn-down-by-application.patch | 1107 +++++++
> > >  ...pt-an-answer-on-the-right-connection.patch |  575 ++++
> > >  ...tions-read-channel-config-under-lock.patch |  243 ++
> > >  ...res_inet_pton-reject-a-prefix-length.patch |  364 +++
> > >  ...nt-drop-UDP-answers-from-server-port.patch |  178 ++
> > >  .../recipes-support/c-ares/c-ares_1.34.8.bb   |    8 +
> > >  9 files changed, 6525 insertions(+)
> > >  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/0001-ares_cancel-
> > ares_destroy-detach-queries-before-callbacks.patch
> > >  create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0002-Delive=
r-
> > deferred-socket-server-state-notifications.patch
> > >  create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0003-
> > ares_qcache-hand-callbacks-their-own-copy.patch
> > >  create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0004-Handle=
-
> > connections-torn-down-by-application.patch
> > >  create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0005-
> > ares_process-only-accept-an-answer-on-the-right-connection.patch
> > >  create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0006-
> > ares_save_options-read-channel-config-under-lock.patch
> > >  create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0007-
> > ares_inet_pton-reject-a-prefix-length.patch
> > >  create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0008-
> > ares_conn_read-dont-drop-UDP-answers-from-server-port.patch
> > >
> > > diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-ares_cancel-
> > ares_destroy-detach-queries-before-callbacks.patch b/meta-oe/recipes-
> >
> support/c-ares/c-ares/0001-ares_cancel-ares_destroy-detach-queries-before=
-
> > callbacks.patch
> > > new file mode 100644
> > > index 0000000000..385760f5bc
> > > --- /dev/null
> > > +++
> b/meta-oe/recipes-support/c-ares/c-ares/0001-ares_cancel-ares_destroy-
> > detach-queries-before-callbacks.patch
> > > @@ -0,0 +1,2603 @@
> > > +From 7f408deb128fbdcce78122322734ffaa01cad9ae Mon Sep 17 00:00:00
> > 2001
> > > +From: Brad House <brad@brad-house.com>
> > > +Date: Sun, 18 Oct 2026 18:15:41 -0400
> > > +Subject: [PATCH] ares_cancel/ares_destroy: detach queries before
> running
> > user
> > > + callbacks
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +Backport of dd62bdfca52ba5c37e88a1469c0a4c5e4a568ccb to v1.34.  See
> > that
> > > +commit for the full description; it hardens reentrant teardown from
> > > +callbacks (ares_cancel(), ares_destroy(), server reconfiguration, an=
d
> > > +socket/server state notifications).
> > > +
> > > +Conflicts were whitespace/alignment only (v1.34 predates the
> clang-format
> > > +reformat in #1238) and were reformatted to v1.34's style.
> > > +
> > > +Also carries the test portion of #1334 that applies to the tests thi=
s
> > > +introduces: dead-server tests use 127.0.0.1:53055/53056 instead of
> > > +127.0.0.55/56, which only routes on Linux.
> > > +
> > > +Signed-off-by: Brad House <brad@brad-house.com>
> > > +Upstream-Status: Backport [https://github.com/c-ares/c-
> > ares/commit/7f408deb128fbdcce78122322734ffaa01cad9ae]
> > > +GHSA: GHSA-wpr3-8q3r-4q8c, GHSA-97vq-4mxv-7vhm, GHSA-mw23-pfg6-
> > 2x9r, GHSA-rf6g-ww74-97qh, GHSA-v33j-65h4-4ch8, GHSA-pj7p-v3cw-hq66
> > > +---
> > > + docs/ares_cancel.3                    |   17 +
> > > + docs/ares_destroy.3                   |    7 +
> > > + docs/ares_init_options.3              |   15 +
> > > + docs/ares_set_server_state_callback.3 |   31 +-
> > > + docs/ares_set_servers_csv.3           |   17 +
> > > + src/lib/ares_cancel.c                 |   25 +-
> > > + src/lib/ares_close_sockets.c          |   82 +-
> > > + src/lib/ares_conn.c                   |  217 ++++-
> > > + src/lib/ares_conn.h                   |   37 +-
> > > + src/lib/ares_destroy.c                |   85 +-
> > > + src/lib/ares_private.h                |  110 ++-
> > > + src/lib/ares_process.c                |  235 +++++-
> > > + src/lib/ares_send.c                   |   35 +
> > > + src/lib/ares_update_servers.c         |   42 +-
> > > + test/ares-test-mock.cc                | 1068
> +++++++++++++++++++++++++
> > > + 15 files changed, 1959 insertions(+), 64 deletions(-)
> > > +
> > > +diff --git a/docs/ares_cancel.3 b/docs/ares_cancel.3
> > > +index 967a946b49..069f226c10 100644
> > > +--- a/docs/ares_cancel.3
> > > ++++ b/docs/ares_cancel.3
> > > +@@ -21,6 +21,23 @@ These calls give the callbacks a chance to clean =
up
> > any state which might have
> > > + been stored in their arguments. If such a callback invocation adds =
a
> new
> > > + request to the channel, that request will \fInot\fP be cancelled by
> the
> > > + current invocation of \fBares_cancel(3)\fP.
> > > ++.SH REENTRANCY
> > > ++A callback invoked by
> > > ++.BR ares_cancel (3)
> > > ++may call c-ares functions on the same channel. The channel lock is
> recursive,
> > > ++and each query is unlinked from the library's internal structures
> before its
> > > ++callback runs, so a reentrant call cannot encounter a query that is
> part-way
> > > ++through being torn down.
> > > ++
> > > ++This includes starting new lookups, as described above, and
> reconfiguring
> > the
> > > ++server list with
> > > ++.BR ares_set_servers_csv (3)
> > > ++and related functions.
> > > ++
> > > ++.SH AVAILABILITY
> > > ++The reentrancy guarantee described above applies as of c-ares versi=
on
> > 1.35.0,
> > > ++and c-ares version 1.34.9 on the 1.34 branch.
> > > ++
> > > + .SH SEE ALSO
> > > + .BR ares_init (3)
> > > + .BR ares_destroy (3)
> > > +diff --git a/docs/ares_destroy.3 b/docs/ares_destroy.3
> > > +index d1984b7cc9..0b6380e609 100644
> > > +--- a/docs/ares_destroy.3
> > > ++++ b/docs/ares_destroy.3
> > > +@@ -20,6 +20,13 @@ by the channel.
> > > + channel, passing a status of \fIARES_EDESTRUCTION\fP. These calls
> give
> > the
> > > + callbacks a chance to clean up any state which might have been
> stored in
> > their
> > > + arguments. A callback must not add new requests to a channel being
> > destroyed.
> > > ++Such a request is refused: the request is not started, and its
> callback is
> > > ++invoked with a status of \fIARES_EDESTRUCTION\fP so that any state
> > attached to
> > > ++its argument can be released. A request made from within that
> notification is
> > > ++refused without a further notification, so that a callback which
> responds to
> > > ++failure by retrying cannot recurse without bound; its argument is
> not handed
> > > ++back. This applies as of c-ares version 1.35.0, and c-ares version
> 1.34.9 on
> > > ++the 1.34 branch.
> > > +
> > > + There is no ability to make this function thread-safe.  No
> additional calls
> > > + using this channel may be made once this function is called.
> > > +diff --git a/docs/ares_init_options.3 b/docs/ares_init_options.3
> > > +index 9b3b481535..e6f6ee8ba6 100644
> > > +--- a/docs/ares_init_options.3
> > > ++++ b/docs/ares_init_options.3
> > > +@@ -231,6 +231,21 @@ will be passed the socket whose state has
> changed;
> > > + will be set to true if the socket should listen for read events, an=
d
> > > + .I writable
> > > + will be set to true if the socket should listen for write events.
> > > ++
> > > ++This callback may call c-ares functions on the same channel,
> including
> > > ++.BR ares_cancel (3)
> > > ++and the server configuration functions. Notifications are delivered
> once the
> > > ++library has finished the work that produced them rather than
> part-way through
> > > ++it, so a reentrant call cannot close a socket the library is still
> using. They
> > > ++arrive in the order the state changes occurred, and always before t=
he
> > > ++outermost c-ares call returns. A call made from within a callback i=
s
> not the
> > > ++outermost one, so notifications it produces arrive after it has
> returned.
> > > ++.BR ares_destroy (3)
> > > ++is no exception: the closure of every socket the channel still hold=
s
> is
> > > ++reported before it returns, and the callback is never invoked
> afterwards.
> > > ++This applies as of c-ares version 1.35.0, and c-ares version 1.34.9
> on the
> > > ++1.34 branch.
> > > ++
> > > + The value of
> > > + .I sock_state_cb_data
> > > + will be passed as the
> > > +diff --git a/docs/ares_set_server_state_callback.3
> > b/docs/ares_set_server_state_callback.3
> > > +index 04fbde4c7a..e95db327ce 100644
> > > +--- a/docs/ares_set_server_state_callback.3
> > > ++++ b/docs/ares_set_server_state_callback.3
> > > +@@ -47,6 +47,31 @@ the DNS servers used by an ares channel. For
> > example, it can be used to track
> > > + metrics about the numbers and types of queries sent to each server
> or to
> > > + detect when a server is uncontactable or unhealthy.
> > > +
> > > ++.SH REENTRANCY
> > > ++The server state callback may call c-ares functions on the same
> channel,
> > > ++including
> > > ++.BR ares_cancel (3)
> > > ++and the server configuration functions. The channel lock is
> recursive and the
> > > ++library holds no query, connection or server state across the
> callback.
> > > ++
> > > ++Notifications are queued and delivered once the library has finishe=
d
> the work
> > > ++that produced them, rather than part-way through it. A notification
> is
> > > ++therefore observed after the processing pass that generated it, not
> during.
> > > ++
> > > ++The callback and its
> > > ++.I user_data
> > > ++are read when the notification is delivered, not when it is queued.
> An
> > > ++application that replaces its callback between those two points wil=
l
> see the
> > > ++notification delivered to the new one; unregistering by passing a
> > > ++.B NULL
> > > ++callback discards any notification still queued.
> > > ++
> > > ++This applies to a replacement made from within a c-ares callback,
> where the
> > > ++channel lock is held.
> > > ++.BR ares_set_server_state_callback (3)
> > > ++does not take the channel lock, so replacing the callback from
> another thread
> > > ++while the channel is processing is not synchronized against deliver=
y.
> > > ++
> > > + .SH FLAGS
> > > + .TP 5
> > > + .B ARES_SERV_STATE_UDP
> > > +@@ -58,5 +83,9 @@ Indicates that the query was tried over TCP.
> > > + .SH AVAILABILITY
> > > + This function was first introduced in c-ares version 1.29.0.
> > > +
> > > ++The reentrancy guarantee described above applies as of c-ares versi=
on
> > 1.35.0,
> > > ++and c-ares version 1.34.9 on the 1.34 branch.
> > > ++
> > > + .SH SEE ALSO
> > > +-.BR ares_get_servers_csv (3)
> > > ++.BR ares_get_servers_csv (3),
> > > ++.BR ares_cancel (3)
> > > +diff --git a/docs/ares_set_servers_csv.3 b/docs/ares_set_servers_csv=
.3
> > > +index f1435143f5..f9f5b82e28 100644
> > > +--- a/docs/ares_set_servers_csv.3
> > > ++++ b/docs/ares_set_servers_csv.3
> > > +@@ -126,6 +126,23 @@ are identical.  Prior versions would simply omi=
t
> ports
> > in \fBares_set_servers_cs
> > > + but due to the addition of link local interface support, this
> difference was
> > > + removed.
> > > +
> > > ++.SH REENTRANCY
> > > ++These functions may be called from within a c-ares callback.
> Removing a
> > server
> > > ++closes its connections, which ends the lookups that were using it
> and invokes
> > > ++their callbacks, so a reconfiguration can be requested from inside
> one.
> > > ++
> > > ++A nested call reconciles the whole server list, and the outer call
> leaves that
> > > ++result in place rather than deleting the servers the nested call
> installed.
> > > ++The consequence is that the outer call's own list does not survive,
> even
> > > ++though it returns
> > > ++.B ARES_SUCCESS:
> > > ++the last configuration applied is the one the channel keeps. An
> application
> > > ++that reconfigures from a callback should therefore not assume the
> list it
> > > ++passed to the outer call is in effect when that call returns.
> > > ++
> > > ++This applies as of c-ares version 1.35.0, and c-ares version 1.34.9
> on the
> > > ++1.34 branch.
> > > ++
> > > + .SH EXAMPLE
> > > + .nf
> > > + 192.168.1.100,[fe80::1]:53%eth0,dns://192.168.1.1?tcpport=3D1153
> > > +diff --git a/src/lib/ares_cancel.c b/src/lib/ares_cancel.c
> > > +index 75600dea6b..aa167e4486 100644
> > > +--- a/src/lib/ares_cancel.c
> > > ++++ b/src/lib/ares_cancel.c
> > > +@@ -38,10 +38,10 @@ void ares_cancel(ares_channel_t *channel)
> > > +   }
> > > +
> > > +   ares_channel_lock(channel);
> > > ++  ares_deferred_cb_enter(channel);
> > > +
> > > +   if (ares_llist_len(channel->all_queries) > 0) {
> > > +     ares_llist_node_t *node =3D NULL;
> > > +-    ares_llist_node_t *next =3D NULL;
> > > +
> > > +     /* Swap list heads, so that only those queries which were
> present on entry
> > > +      * into this function are cancelled. New queries added by
> callbacks of
> > > +@@ -57,21 +57,29 @@ void ares_cancel(ares_channel_t *channel)
> > > +       goto done;                        /* LCOV_EXCL_LINE:
> OutOfMemory */
> > > +     }
> > > +
> > > +-    node =3D ares_llist_node_first(list_copy);
> > > +-    while (node !=3D NULL) {
> > > ++    /* Re-read the head each iteration rather than caching the next
> node: a
> > > ++     * callback below may cause other queries in this same list to
> be ended
> > > ++     * and their nodes destroyed. */
> > > ++    while ((node =3D ares_llist_node_first(list_copy)) !=3D NULL) {
> > > +       ares_query_t *query;
> > > +
> > > +-      /* Cache next since this node is being deleted */
> > > +-      next =3D ares_llist_node_next(node);
> > > ++      query =3D ares_llist_node_claim(node);
> > > +
> > > +-      query                   =3D ares_llist_node_claim(node);
> > > ++      /* Must come first: node_claim() already destroyed this node,
> so
> > > ++       * ares_detach_query() would otherwise destroy it a second
> time. */
> > > +       query->node_all_queries =3D NULL;
> > > +
> > > ++      /* Detach from queries_by_qid, the connection and the timeout
> list
> > > ++       * before running user code.  Otherwise a reentrant teardown
> from
> > > ++       * within the callback -- ares_set_servers_csv(), or a new
> query
> > > ++       * hitting a connection error -- still finds this query, ends
> it a
> > > ++       * second time and frees it, and the ares_free_query() below
> then
> > > ++       * double-frees. */
> > > ++      ares_detach_query(query);
> > > ++
> > > +       /* NOTE: its possible this may enqueue new queries */
> > > +       query->callback(query->arg, ARES_ECANCELLED, 0, NULL);
> > > +       ares_free_query(query);
> > > +-
> > > +-      node =3D next;
> > > +     }
> > > +
> > > +     ares_llist_destroy(list_copy);
> > > +@@ -83,5 +91,6 @@ void ares_cancel(ares_channel_t *channel)
> > > +   ares_queue_notify_empty(channel);
> > > +
> > > + done:
> > > ++  ares_deferred_cb_leave(channel);
> > > +   ares_channel_unlock(channel);
> > > + }
> > > +diff --git a/src/lib/ares_close_sockets.c
> b/src/lib/ares_close_sockets.c
> > > +index 7bb72c31ec..6be662fdd3 100644
> > > +--- a/src/lib/ares_close_sockets.c
> > > ++++ b/src/lib/ares_close_sockets.c
> > > +@@ -41,12 +41,47 @@ static void ares_requeue_queries(ares_conn_t
> > *conn,
> > > +   }
> > > + }
> > > +
> > > ++/*! Release a connection's memory.  Split from the unlink below so
> that the
> > > ++ *  two can happen at different times: a caller further up the stac=
k
> may still
> > > ++ *  hold this pointer, and reading a detached connection is safe
> where
> > reading
> > > ++ *  a freed one is not. */
> > > ++void ares_conn_reap(ares_conn_t *conn)
> > > ++{
> > > ++  if (conn =3D=3D NULL) {
> > > ++    return; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > ++  }
> > > ++
> > > ++  ares_buf_destroy(conn->in_buf);
> > > ++  ares_buf_destroy(conn->out_buf);
> > > ++  ares_llist_destroy(conn->queries_to_conn);
> > > ++  ares_free(conn);
> > > ++}
> > > ++
> > > + void ares_close_connection(ares_conn_t *conn, ares_status_t
> > requeue_status)
> > > + {
> > > +-  ares_server_t  *server  =3D conn->server;
> > > +-  ares_channel_t *channel =3D server->channel;
> > > ++  ares_server_t  *server;
> > > ++  ares_channel_t *channel;
> > > ++
> > > ++  if (conn =3D=3D NULL) {
> > > ++    return; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > ++  }
> > > ++
> > > ++  /* Already torn down and awaiting reclamation.  Reaching here
> twice is
> > > ++   * ordinary once a connection can outlive its teardown: a caller
> holding it
> > > ++   * from before -- handle_conn_error() after a failed write, say -=
-
> closes it
> > > ++   * again without knowing.  Doing the work twice would requeue
> queries that
> > > ++   * have already moved and would put this connection on the pendin=
g
> list a
> > > ++   * second time, which is a double free. */
> > > ++  if (conn->flags & ARES_CONN_FLAG_DEAD) {
> > > ++    return;
> > > ++  }
> > > +
> > > +-  /* Unlink */
> > > ++  server  =3D conn->server;
> > > ++  channel =3D server->channel;
> > > ++
> > > ++  /* Unlink from everything that can find this connection.  After
> this it is
> > > ++   * unreachable by lookup, which is what stops anything new from
> picking it
> > > ++   * up; anything that already holds it is handled by the deferral
> below. */
> > > +   ares_llist_node_claim(
> > > +     ares_htable_asvp_get_direct(channel->connnode_by_socket,
> conn->fd));
> > > +   ares_htable_asvp_remove(channel->connnode_by_socket, conn->fd);
> > > +@@ -55,19 +90,40 @@ void ares_close_connection(ares_conn_t *conn,
> > ares_status_t requeue_status)
> > > +     server->tcp_conn =3D NULL;
> > > +   }
> > > +
> > > +-  ares_buf_destroy(conn->in_buf);
> > > +-  ares_buf_destroy(conn->out_buf);
> > > ++  /* Marked dead as soon as it is unlinked, before anything below
> can run
> > > ++   * application code.  ares_requeue_queries() ends queries
> terminally once
> > > ++   * their retries are exhausted, which invokes the application's
> callback; if
> > > ++   * the flag were set after that, a second ares_close_connection()
> reaching
> > > ++   * this connection in the meantime would run the body again --
> closing the
> > > ++   * descriptor twice and listing the connection for reclamation
> twice, which
> > > ++   * is a double free.  It also gives ares_close_sockets() its
> termination
> > > ++   * condition: dead implies unlinked, so its re-read-the-head loop
> cannot see
> > > ++   * a dead connection and spin. */
> > > ++  conn->flags |=3D ARES_CONN_FLAG_DEAD;
> > > +
> > > +   /* Requeue queries to other connections */
> > > +   ares_requeue_queries(conn, requeue_status);
> > > +
> > > +-  ares_llist_destroy(conn->queries_to_conn);
> > > +-
> > > +-  ares_conn_sock_state_cb_update(conn, ARES_CONN_STATE_NONE);
> > > +-
> > > +-  ares_socket_close(channel, conn->fd);
> > > ++  /* Hands the descriptor to the queued notification when one is
> due, so the
> > > ++   * application is told to stop watching it before it is closed.
> Otherwise
> > > ++   * nothing will carry it and we close it here. */
> > > ++  if (!ares_conn_sock_state_cb_close(conn)) {
> > > ++    ares_socket_close(channel, conn->fd);
> > > ++  }
> > > ++  conn->fd =3D ARES_SOCKET_BAD;
> > > ++
> > > ++  /* If a library call is in progress it may be holding this
> connection --
> > > ++   * read_answers() and ares_send_query_int() both do, across code
> that can
> > > ++   * reach here.  Keep it readable until that call unwinds.  The
> buffers and
> > > ++   * the query list are freed by ares_conn_reap(), so a stale holde=
r
> sees an
> > > ++   * emptied connection rather than freed memory. */
> > > ++  if (channel->deferred_cb_depth > 0) {
> > > ++    conn->next_pending     =3D channel->pending_conns;
> > > ++    channel->pending_conns =3D conn;
> > > ++    return;
> > > ++  }
> > > +
> > > +-  ares_free(conn);
> > > ++  ares_conn_reap(conn);
> > > + }
> > > +
> > > + void ares_close_sockets(ares_server_t *server)
> > > +@@ -76,6 +132,10 @@ void ares_close_sockets(ares_server_t *server)
> > > +
> > > +   while ((node =3D ares_llist_node_first(server->connections)) !=3D
> NULL) {
> > > +     ares_conn_t *conn =3D ares_llist_node_val(node);
> > > ++    /* This loop re-reads the head each time and relies on the clos=
e
> below
> > > ++     * unlinking it.  A dead connection returns early without
> unlinking, so
> > > ++     * one on this list would spin forever holding the channel lock=
.
> */
> > > ++    assert(!(conn->flags & ARES_CONN_FLAG_DEAD));
> > > +     ares_close_connection(conn, ARES_SUCCESS);
> > > +   }
> > > + }
> > > +diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c
> > > +index 6b315b0548..78f57e7d10 100644
> > > +--- a/src/lib/ares_conn.c
> > > ++++ b/src/lib/ares_conn.c
> > > +@@ -26,19 +26,210 @@
> > > +  */
> > > + #include "ares_private.h"
> > > +
> > > +-void ares_conn_sock_state_cb_update(ares_conn_t            *conn,
> > > +-                                    ares_conn_state_flags_t flags)
> > > ++/*! A queued socket-state notification.  Holds the descriptor and
> the state,
> > > ++ *  never the connection, so a queued entry cannot outlive what it
> refers to.
> > > ++ *
> > > ++ *  When \c owns_fd is set, this message carries the only remaining
> reference
> > to
> > > ++ *  the descriptor: the connection is gone and the descriptor is
> deliberately
> > > ++ *  left open until after the application has been told to stop
> watching it.
> > > ++ *  Closing first would let the number be reused -- by application
> code running
> > > ++ *  from a deferred query callback, for instance -- before the
> notification
> > > ++ *  naming it is delivered. */
> > > ++typedef struct {
> > > ++  ares_socket_t fd;
> > > ++  ares_bool_t   readable;
> > > ++  ares_bool_t   writable;
> > > ++  ares_bool_t   owns_fd;
> > > ++} ares_sock_state_msg_t;
> > > ++
> > > ++static ares_bool_t ares_sock_state_queue(ares_channel_t
> *channel,
> > > ++                                         const ares_sock_state_msg_=
t
> *msg)
> > > + {
> > > +-  ares_channel_t *channel =3D conn->server->channel;
> > > ++  if (channel->sock_state_queue =3D=3D NULL) {
> > > ++    channel->sock_state_queue =3D ares_array_create(sizeof(*msg),
> NULL);
> > > ++    if (channel->sock_state_queue =3D=3D NULL) {
> > > ++      return ARES_FALSE; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++    }
> > > ++  }
> > > ++
> > > ++  if (ares_array_insertdata_last(channel->sock_state_queue, msg) !=
=3D
> > > ++      ARES_SUCCESS) {
> > > ++    return ARES_FALSE; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++  }
> > > ++
> > > ++  return ARES_TRUE;
> > > ++}
> > > ++
> > > ++/*! Deliver every socket-state notification the channel has queued.
> Loops
> > > ++ *  rather than snapshotting: a callback is allowed to re-enter the
> library and
> > > ++ *  queue more, and those belong to this same delivery point. */
> > > ++static void ares_sock_state_dispatch(ares_channel_t *channel)
> > > ++{
> > > ++  while (ares_array_len(channel->sock_state_queue) > 0) {
> > > ++    ares_sock_state_msg_t msg;
> > > ++
> > > ++    if (ares_array_claim_at(&msg, sizeof(msg),
> channel->sock_state_queue,
> > 0) !=3D
> > > ++        ARES_SUCCESS) {
> > > ++      break; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > ++    }
> > > +
> > > +-  if ((conn->state_flags & ARES_CONN_STATE_CBFLAGS) !=3D flags &&
> > > +-      channel->sock_state_cb) {
> > > +-    channel->sock_state_cb(channel->sock_state_cb_data, conn->fd,
> > > +-                           flags & ARES_CONN_STATE_READ ? 1 : 0,
> > > +-                           flags & ARES_CONN_STATE_WRITE ? 1 : 0);
> > > ++    if (channel->sock_state_cb !=3D NULL) {
> > > ++      /* The public callback takes ints. */
> > > ++      channel->sock_state_cb(channel->sock_state_cb_data, msg.fd,
> > > ++                             msg.readable ? 1 : 0, msg.writable ? 1
> : 0);
> > > ++    }
> > > ++
> > > ++    /* Told first, closed second -- the ordering the application
> depends on to
> > > ++     * keep its descriptor set honest. */
> > > ++    if (msg.owns_fd) {
> > > ++      ares_socket_close(channel, msg.fd);
> > > ++    }
> > > ++  }
> > > ++
> > > ++  ares_array_destroy(channel->sock_state_queue);
> > > ++  channel->sock_state_queue =3D NULL;
> > > ++}
> > > ++
> > > ++static void ares_deferred_cb_flush(ares_channel_t *channel)
> > > ++{
> > > ++  /* Only the outermost frame delivers: anything above us on the
> stack may
> > > ++   * still be holding the connection a reentrant call from one of
> these
> > > ++   * callbacks could free.
> > > ++   *
> > > ++   * The dispatch below counts as a nesting level of its own.
> Without that, a
> > > ++   * callback that calls back into the library re-enters here
> through the
> > > ++   * enter/leave pair on that call, drains the rest of the queue an=
d
> destroys
> > > ++   * it underneath the loop -- and hands the next notification to t=
he
> > > ++   * application from inside the current one.  With the counter
> held, the
> > > ++   * nested leave returns immediately and whatever it queued is
> picked up by
> > > ++   * the loop that is already running. */
> > > ++  if (channel->deferred_cb_depth > 0) {
> > > ++    return;
> > > ++  }
> > > ++  channel->deferred_cb_depth++;
> > > ++
> > > ++  /* Both kinds of deferred notification share this one delivery
> point.  Loop
> > > ++   * rather than calling each once: a socket-state callback may put
> the library
> > > ++   * on a path that queues a server-state notification, and the
> reverse, and
> > > ++   * both belong to this delivery point rather than the next one. *=
/
> > > ++  while (ares_array_len(channel->sock_state_queue) > 0 ||
> > > ++         ares_array_len(channel->server_state_queue) > 0) {
> > > ++    ares_sock_state_dispatch(channel);
> > > ++    ares_server_state_dispatch(channel);
> > > ++  }
> > > ++
> > > ++  /* The outermost call is unwinding and the callbacks above have
> run, so
> > > ++   * nothing can still be holding a server or connection that was
> unlinked
> > > ++   * during it.  Now they can be freed. */
> > > ++  ares_deferred_reclaim(channel);
> > > ++
> > > ++  channel->deferred_cb_depth--;
> > > ++}
> > > ++
> > > ++void ares_deferred_reclaim(ares_channel_t *channel)
> > > ++{
> > > ++  /* Connections first: a pending server's connection list is
> already empty,
> > > ++   * but this keeps the ordering obvious rather than incidental. */
> > > ++  while (channel->pending_conns !=3D NULL) {
> > > ++    ares_conn_t *conn      =3D channel->pending_conns;
> > > ++    channel->pending_conns =3D conn->next_pending;
> > > ++    conn->next_pending     =3D NULL;
> > > ++    ares_conn_reap(conn);
> > > ++  }
> > > ++
> > > ++  while (channel->pending_servers !=3D NULL) {
> > > ++    ares_server_t *server    =3D channel->pending_servers;
> > > ++    channel->pending_servers =3D server->next_pending;
> > > ++    server->next_pending     =3D NULL;
> > > ++    ares_server_reap(server);
> > > ++  }
> > > ++}
> > > ++
> > > ++void ares_deferred_cb_enter(ares_channel_t *channel)
> > > ++{
> > > ++  channel->deferred_cb_depth++;
> > > ++}
> > > ++
> > > ++void ares_deferred_cb_leave(ares_channel_t *channel)
> > > ++{
> > > ++  if (channel->deferred_cb_depth > 0) {
> > > ++    channel->deferred_cb_depth--;
> > > ++  }
> > > ++  ares_deferred_cb_flush(channel);
> > > ++}
> > > ++
> > > ++ares_bool_t ares_conn_sock_state_cb_close(ares_conn_t *conn)
> > > ++{
> > > ++  ares_channel_t       *channel =3D conn->server->channel;
> > > ++  ares_sock_state_msg_t msg;
> > > ++
> > > ++  /* No callback to run, so nothing will ever carry this descriptor=
:
> the
> > > ++   * caller closes it itself, exactly as before. */
> > > ++  if (channel->sock_state_cb =3D=3D NULL) {
> > > ++    return ARES_FALSE;
> > > ++  }
> > > ++
> > > ++  /* Already reported as unwatched, so no notification is due and n=
o
> message
> > > ++   * will be queued to hold the descriptor. */
> > > ++  if ((conn->state_flags & ARES_CONN_STATE_CBFLAGS) =3D=3D
> > ARES_CONN_STATE_NONE) {
> > > ++    return ARES_FALSE;
> > > ++  }
> > > ++
> > > ++  msg.fd       =3D conn->fd;
> > > ++  msg.readable =3D ARES_FALSE;
> > > ++  msg.writable =3D ARES_FALSE;
> > > ++  msg.owns_fd  =3D ARES_TRUE;
> > > ++
> > > ++  if (!ares_sock_state_queue(channel, &msg)) {
> > > ++    return ARES_FALSE; /* LCOV_EXCL_LINE: OutOfMemory */
> > > +   }
> > > +
> > > +   conn->state_flags &=3D ~((unsigned int)ARES_CONN_STATE_CBFLAGS);
> > > ++
> > > ++  return ARES_TRUE;
> > > ++}
> > > ++
> > > ++void ares_conn_sock_state_cb_update(ares_conn_t            *conn,
> > > ++                                    ares_conn_state_flags_t flags)
> > > ++{
> > > ++  ares_channel_t       *channel =3D conn->server->channel;
> > > ++  ares_sock_state_msg_t msg;
> > > ++  ares_bool_t           changed =3D ARES_FALSE;
> > > ++
> > > ++  if ((conn->state_flags & ARES_CONN_STATE_CBFLAGS) !=3D flags) {
> > > ++    changed =3D ARES_TRUE;
> > > ++  }
> > > ++
> > > ++  msg.fd       =3D conn->fd;
> > > ++  msg.readable =3D flags & ARES_CONN_STATE_READ ? ARES_TRUE :
> > ARES_FALSE;
> > > ++  msg.writable =3D flags & ARES_CONN_STATE_WRITE ? ARES_TRUE :
> > ARES_FALSE;
> > > ++  msg.owns_fd  =3D ARES_FALSE; /* the connection still owns it */
> > > ++
> > > ++  if (!changed || channel->sock_state_cb =3D=3D NULL) {
> > > ++    conn->state_flags &=3D ~((unsigned int)ARES_CONN_STATE_CBFLAGS)=
;
> > > ++    conn->state_flags |=3D flags;
> > > ++    return;
> > > ++  }
> > > ++
> > > ++  /* Queue rather than dispatch.  This runs in the middle of
> opening, writing
> > > ++   * to or closing a connection, and every caller keeps using that
> connection
> > > ++   * afterwards.  The callback is application code that may
> reentrantly call
> > > ++   * ares_cancel() or ares_set_servers_csv(), either of which frees
> the
> > > ++   * connection -- the first through the idle-connection sweep, the
> second by
> > > ++   * destroying the server that owns it.  Deliver once no frame
> still holds
> > > ++   * it.
> > > ++   *
> > > ++   * Only the descriptor and the state are captured, never the
> connection, and
> > > ++   * insertion order is preserved so the application observes the
> same
> > > ++   * sequence it would have seen inline. */
> > > ++  if (!ares_sock_state_queue(channel, &msg)) {
> > > ++    return; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++  }
> > > ++
> > > ++  /* Recorded as reported only now: on either failure above the
> connection
> > > ++   * stays eligible to notify again, rather than remembering a stat=
e
> the
> > > ++   * application was never told about. */
> > > ++  conn->state_flags &=3D ~((unsigned int)ARES_CONN_STATE_CBFLAGS);
> > > +   conn->state_flags |=3D flags;
> > > + }
> > > +
> > > +@@ -435,6 +626,16 @@ ares_status_t ares_open_connection(ares_conn_t
> > **conn_out,
> > > +     conn->flags |=3D ARES_CONN_FLAG_TFO_INITIAL;
> > > +   }
> > > +
> > > ++  /* The socket-configure and socket-create callbacks above are
> application
> > > ++   * code, and either may reconfigure the servers -- which destroys
> the ones
> > > ++   * the new configuration omits, including possibly this one.
> Everything
> > > ++   * below dereferences it, starting with conn->server in
> > > ++   * ares_conn_set_self_ip(). */
> > > ++  if (!ares_server_in_channel(channel, server)) {
> > > ++    status =3D ARES_ECONNREFUSED;
> > > ++    goto done;
> > > ++  }
> > > ++
> > > +   /* Need to store our own ip for DNS cookie support */
> > > +   status =3D ares_conn_set_self_ip(conn, ARES_TRUE);
> > > +   if (status !=3D ARES_SUCCESS) {
> > > +diff --git a/src/lib/ares_conn.h b/src/lib/ares_conn.h
> > > +index c332de14b1..fc177b84f6 100644
> > > +--- a/src/lib/ares_conn.h
> > > ++++ b/src/lib/ares_conn.h
> > > +@@ -49,7 +49,14 @@ typedef enum {
> > > +    *  it).  Its in-flight queries continue to drain and it is
> cleaned up once
> > > +    *  idle.  This is a per-connection signal so that a transient
> failure does
> > > +    *  not evict otherwise-healthy connections to the same server. *=
/
> > > +-  ARES_CONN_FLAG_NONEW =3D 1 << 3
> > > ++  ARES_CONN_FLAG_NONEW =3D 1 << 3,
> > > ++  /*! Connection has been torn down: unlinked from every lookup
> structure, its
> > > ++   *  descriptor closed or handed to a pending notification, and it=
s
> queries
> > > ++   *  requeued.  It survives only so that a caller further up the
> stack which
> > > ++   *  captured it before the teardown can still read it; see
> > > ++   *  ares_deferred_reclaim().  Teardown is idempotent -- a second
> > > ++   *  ares_close_connection() on a dead connection does nothing. */
> > > ++  ARES_CONN_FLAG_DEAD =3D 1 << 4
> > > + } ares_conn_flags_t;
> > > +
> > > + typedef enum {
> > > +@@ -84,6 +91,10 @@ struct ares_conn {
> > > +
> > > +   /* list of outstanding queries to this connection */
> > > +   ares_llist_t           *queries_to_conn;
> > > ++
> > > ++  /*! Next connection awaiting reclamation.  Set only while this
> connection is
> > > ++   *  on channel->pending_conns; see ares_deferred_reclaim(). */
> > > ++  ares_conn_t            *next_pending;
> > > + };
> > > +
> > > + /*! Various buckets for grouping history */
> > > +@@ -168,6 +179,10 @@ struct ares_server {
> > > +
> > > +   /* Link back to owning channel */
> > > +   ares_channel_t       *channel;
> > > ++
> > > ++  /*! Next server awaiting reclamation.  Set only while this server
> is on
> > > ++   *  channel->pending_servers; see ares_deferred_reclaim(). */
> > > ++  ares_server_t        *next_pending;
> > > + };
> > > +
> > > + void ares_close_connection(ares_conn_t *conn, ares_status_t
> > requeue_status);
> > > +@@ -185,8 +200,24 @@ ares_status_t   ares_conn_flush(ares_conn_t
> > *conn);
> > > + ares_conn_err_t ares_conn_read(ares_conn_t *conn, void *data, size_=
t
> len,
> > > +                                size_t *read_bytes);
> > > + ares_conn_t *ares_conn_from_fd(const ares_channel_t *channel,
> > ares_socket_t fd);
> > > +-void         ares_conn_sock_state_cb_update(ares_conn_t
> *conn,
> > > +-                                            ares_conn_state_flags_t
> flags);
> > > ++
> > > ++/*! Queue the "stop watching this descriptor" notification for a
> connection
> > > ++ *  being torn down, handing the descriptor to that queued message.
> > > ++ *
> > > ++ *  The application must be told to stop watching a descriptor whil=
e
> it is
> > > ++ *  still open -- close first and the number can be handed to
> something else,
> > > ++ *  including by application code running from a deferred query
> callback,
> > > ++ *  before the notification naming it is delivered.
> > > ++ *
> > > ++ *  \param[in] conn  Connection being closed.
> > > ++ *  \return ARES_TRUE if the queued notification took the
> descriptor, in which
> > > ++ *          case the caller must not close it; ARES_FALSE if no
> notification is
> > > ++ *          due, and the caller closes the descriptor itself.
> > > ++ */
> > > ++ares_bool_t     ares_conn_sock_state_cb_close(ares_conn_t *conn);
> > > ++
> > > ++void            ares_conn_sock_state_cb_update(ares_conn_t
>   *conn,
> > > ++
>  ares_conn_state_flags_t flags);
> > > + ares_conn_err_t ares_socket_recv(ares_channel_t *channel,
> ares_socket_t
> > s,
> > > +                                  ares_bool_t is_tcp, void *data,
> > > +                                  size_t data_len, size_t
> *read_bytes);
> > > +diff --git a/src/lib/ares_destroy.c b/src/lib/ares_destroy.c
> > > +index 1e5706e0e0..e0534c800d 100644
> > > +--- a/src/lib/ares_destroy.c
> > > ++++ b/src/lib/ares_destroy.c
> > > +@@ -69,17 +69,31 @@ void ares_destroy(ares_channel_t *channel)
> > > +    * callbacks need to hold a channel lock. */
> > > +   ares_channel_lock(channel);
> > > +
> > > +-  /* Destroy all queries */
> > > +-  node =3D ares_llist_node_first(channel->all_queries);
> > > +-  while (node !=3D NULL) {
> > > +-    ares_llist_node_t *next  =3D ares_llist_node_next(node);
> > > +-    ares_query_t      *query =3D ares_llist_node_claim(node);
> > > +-
> > > ++  /* Destroy all queries.
> > > ++   *
> > > ++   * The queries are detached before their callbacks run.  Claiming
> the node
> > > ++   * only unlinks a query from all_queries; it stays in
> queries_by_qid, on
> > > ++   * conn->queries_to_conn and in queries_by_timeout.  A reentrant
> teardown
> > > ++   * from inside the callback -- ares_set_servers_csv(), or a new
> query
> > > ++   * hitting a connection error -- would otherwise still find the
> query, end
> > > ++   * it a second time (invoking the application callback twice for
> one
> > > ++   * lookup) and free it, and the ares_free_query() below would
> double-free.
> > > ++   *
> > > ++   * The loop re-reads the first node each iteration rather than
> caching the
> > > ++   * next one, since a callback can cause other queries in this sam=
e
> list to
> > > ++   * be ended and their nodes destroyed.  No list swap is needed:
> sys_up is
> > > ++   * already cleared above, so ares_send_nolock() refuses new
> queries and
> > > ++   * nothing can be added while we drain. */
> > > ++  while ((node =3D ares_llist_node_first(channel->all_queries)) !=
=3D
> NULL) {
> > > ++    ares_query_t *query =3D ares_llist_node_claim(node);
> > > ++
> > > ++    /* Must come first: node_claim() already destroyed this node, s=
o
> > > ++     * ares_detach_query() would otherwise destroy it a second time=
.
> */
> > > +     query->node_all_queries =3D NULL;
> > > ++    ares_detach_query(query);
> > > ++
> > > +     query->callback(query->arg, ARES_EDESTRUCTION, 0, NULL);
> > > +     ares_free_query(query);
> > > +-
> > > +-    node =3D next;
> > > +   }
> > > +
> > > +   ares_queue_notify_empty(channel);
> > > +@@ -93,7 +107,28 @@ void ares_destroy(ares_channel_t *channel)
> > > +   assert(ares_slist_len(channel->queries_by_timeout) =3D=3D 0);
> > > + #endif
> > > +
> > > ++  /* Tearing down the servers closes every remaining connection.
> > Applications
> > > ++   * rely on being told about those closures so they can drop the
> descriptors
> > > ++   * from their own event loop, so the notifications are still
> delivered here
> > > ++   * rather than discarded -- just after the teardown instead of
> during it. */
> > > ++  ares_deferred_cb_enter(channel);
> > > +   ares_destroy_servers_state(channel);
> > > ++  ares_deferred_cb_leave(channel);
> > > ++
> > > ++  /* The leave above delivered and destroyed both queues and
> reclaimed
> > > ++   * everything the teardown unlinked, so these are normally
> no-ops.  They
> > are
> > > ++   * not redundant: if the first insert into a freshly created queu=
e
> fails,
> > > ++   * the array is left allocated and empty, the flush loop never
> runs because
> > > ++   * both queues are empty, and nothing else would ever free it. */
> > > ++  ares_array_destroy(channel->sock_state_queue);
> > > ++  channel->sock_state_queue =3D NULL;
> > > ++  ares_array_destroy(channel->server_state_queue);
> > > ++  channel->server_state_queue =3D NULL;
> > > ++
> > > ++#ifndef NDEBUG
> > > ++  assert(channel->pending_servers =3D=3D NULL);
> > > ++  assert(channel->pending_conns =3D=3D NULL);
> > > ++#endif
> > > +
> > > + #ifndef NDEBUG
> > > +   assert(ares_htable_asvp_num_keys(channel->connnode_by_socket) =3D=
=3D
> 0);
> > > +@@ -134,17 +169,47 @@ void ares_destroy(ares_channel_t *channel)
> > > +   ares_free(channel);
> > > + }
> > > +
> > > +-void ares_destroy_server(ares_server_t *server)
> > > ++/*! Release a server's memory.  Split from ares_destroy_server() fo=
r
> the same
> > > ++ *  reason ares_conn_reap() is split out: a caller further up the
> stack may
> > > ++ *  still hold this pointer. */
> > > ++void ares_server_reap(ares_server_t *server)
> > > + {
> > > +   if (server =3D=3D NULL) {
> > > +     return; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > +   }
> > > +
> > > +-  ares_close_sockets(server);
> > > +   ares_llist_destroy(server->connections);
> > > +   ares_free(server);
> > > + }
> > > +
> > > ++void ares_destroy_server(ares_server_t *server)
> > > ++{
> > > ++  ares_channel_t *channel;
> > > ++
> > > ++  if (server =3D=3D NULL) {
> > > ++    return; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > ++  }
> > > ++
> > > ++  channel =3D server->channel;
> > > ++
> > > ++  /* Closes and unlinks every connection; each is deferred or reape=
d
> by
> > > ++   * ares_close_connection() on the same rule applied below. */
> > > ++  ares_close_sockets(server);
> > > ++
> > > ++  /* The caller has already unlinked this server from
> channel->servers, so it
> > > ++   * can no longer be found -- ares_server_in_channel() and
> > > ++   * ares_slist_node_find() both report it gone, which is what
> callers check
> > > ++   * before acting on one.  But a library call in progress may stil=
l
> be
> > > ++   * holding the pointer, so keep it readable until that call
> unwinds. */
> > > ++  if (channel !=3D NULL && channel->deferred_cb_depth > 0) {
> > > ++    server->next_pending     =3D channel->pending_servers;
> > > ++    channel->pending_servers =3D server;
> > > ++    return;
> > > ++  }
> > > ++
> > > ++  ares_server_reap(server);
> > > ++}
> > > ++
> > > + void ares_destroy_servers_state(ares_channel_t *channel)
> > > + {
> > > +   ares_slist_node_t *node;
> > > +diff --git a/src/lib/ares_private.h b/src/lib/ares_private.h
> > > +index 04d4576ed2..0a1029e0f8 100644
> > > +--- a/src/lib/ares_private.h
> > > ++++ b/src/lib/ares_private.h
> > > +@@ -147,7 +147,10 @@ typedef struct ares_query ares_query_t;
> > > + struct ares_query {
> > > +   /* Query ID from qbuf, for faster lookup, and current timeout */
> > > +   unsigned short       qid; /* host byte order */
> > > +-  ares_timeval_t       ts;  /*!< Timestamp query was sent */
> > > ++  /*! Distinguishes this query from any later one handed the same
> qid.
> > > ++   *  Query ids are 16-bit and recycled; this counter is not. */
> > > ++  size_t               serial;
> > > ++  ares_timeval_t       ts; /*!< Timestamp query was sent */
> > > +   ares_timeval_t       timeout;
> > > +   ares_channel_t      *channel;
> > > +
> > > +@@ -227,6 +230,9 @@ struct ares_channeldata {
> > > +   /* Server addresses and communications state. Sorted by least
> consecutive
> > > +    * failures, followed by the configuration order if failures are
> equal. */
> > > +   ares_slist_t        *servers;
> > > ++  /*! Bumped by each ares_servers_update().  Lets the stale-server
> removal
> > loop
> > > ++   *  tell that a nested reconfiguration reconciled the list
> underneath it. */
> > > ++  size_t               servers_generation;
> > > +
> > > +   /* random state to use when generating new ids and generating ret=
ry
> > penalties
> > > +    */
> > > +@@ -237,6 +243,10 @@ struct ares_channeldata {
> > > +   /* Queries bucketed by qid, for quickly dispatching DNS responses=
:
> */
> > > +   ares_htable_szvp_t  *queries_by_qid;
> > > +
> > > ++  /*! Monotonic source for ares_query_t.serial.  Never reused for
> the life of
> > > ++   *  the channel, so a recycled query id cannot impersonate an
> older query. */
> > > ++  size_t               query_serial;
> > > ++
> > > +   /* Queries bucketed by timeout, for quickly handling timeouts: */
> > > +   ares_slist_t        *queries_by_timeout;
> > > +
> > > +@@ -248,6 +258,29 @@ struct ares_channeldata {
> > > +
> > > +   ares_sock_state_cb   sock_state_cb;
> > > +   void                *sock_state_cb_data;
> > > ++  /*! Socket-state notifications queued during processing, delivere=
d
> once the
> > > ++   *  library is no longer holding a connection a reentrant call
> could free.
> > > ++   *  Insertion order is preserved, so an application observes the
> same
> > > ++   *  sequence of state changes it would have seen inline. */
> > > ++  ares_array_t        *sock_state_queue;
> > > ++  /*! Depth of nested library entry points that may produce a
> deferred
> > > ++   *  application notification.  Queues are delivered as this
> returns to
> > > ++   *  zero.  Shared by every deferred callback kind rather than one
> counter
> > > ++   *  per kind, so the delivery rule exists in exactly one place. *=
/
> > > ++  size_t               deferred_cb_depth;
> > > ++
> > > ++  /*! Servers and connections that have been unlinked from every
> lookup
> > > ++   *  structure but not yet freed, because a library call was in
> progress and
> > > ++   *  may still hold a pointer to them.  Drained by the same flush
> that
> > > ++   *  delivers deferred notifications, once no frame can still be
> holding one.
> > > ++   *
> > > ++   *  This is what makes a stale ares_server_t or ares_conn_t
> readable rather
> > > ++   *  than freed for the remainder of the call that captured it.
> Callers
> > > ++   *  still revalidate before *acting* on one --
> ares_server_in_channel() and
> > > ++   *  friends -- but a missed check is now "used a server that was
> removed"
> > > ++   *  rather than a use-after-free. */
> > > ++  ares_server_t       *pending_servers;
> > > ++  ares_conn_t         *pending_conns;
> > > +
> > > +   ares_sock_create_callback           sock_create_cb;
> > > +   void                               *sock_create_cb_data;
> > > +@@ -295,6 +328,10 @@ struct ares_channeldata {
> > > +   /* Callback triggered when a server has a successful or failed
> response */
> > > +   ares_server_state_callback          server_state_cb;
> > > +   void                               *server_state_cb_data;
> > > ++  /*! Server-state notifications queued during processing,
> dispatched once the
> > > ++   *  library is no longer holding pointers a reentrant callback
> could free.
> > > ++   *  See ares_deferred_cb_leave(). */
> > > ++  ares_array_t                       *server_state_queue;
> > > +
> > > +   /* TRUE if a reinit is pending.  Reinit spawns a thread to read
> the system
> > > +    * configuration and then apply the configuration since
> configuration
> > > +@@ -308,6 +345,11 @@ struct ares_channeldata {
> > > +    * system config changes might get triggered and we need a flag t=
o
> make
> > > +    * sure we don't take action. */
> > > +   ares_bool_t                         sys_up;
> > > ++
> > > ++  /*! Set while ares_send_nolock() is running the refusal
> notification for a
> > > ++   *  channel being destroyed.  Bounds the recursion at one frame
> when the
> > > ++   *  application's callback responds by starting another lookup. *=
/
> > > ++  ares_bool_t                         in_shutdown_refusal;
> > > + };
> > > +
> > > + /* Does the domain end in ".onion" or ".onion."? Case-insensitive. =
*/
> > > +@@ -351,6 +393,16 @@ void
>  *ares_dnsrec_convert_arg(ares_callback
> > callback, void *arg);
> > > + void ares_dnsrec_convert_cb(void *arg, ares_status_t status, size_t
> timeouts,
> > > +                             const ares_dns_record_t *dnsrec);
> > > +
> > > ++/*! Unlink a query from every list and table that tracks it.
> > > ++ *
> > > ++ *  Must be called before running application code that could reach
> the query
> > > ++ *  again, so a reentrant teardown cannot find it and end it a
> second time.
> > > ++ *
> > > ++ *  \param[in] query  Query to detach.  Safe to call more than once
> on the
> > > ++ *                    same query.
> > > ++ */
> > > ++void ares_detach_query(ares_query_t *query);
> > > ++
> > > + void ares_free_query(ares_query_t *query);
> > > +
> > > + unsigned short ares_generate_new_id(ares_rand_state *state);
> > > +@@ -390,7 +442,6 @@ ares_status_t
> > ares_sysconfig_set_options(ares_sysconfig_t *sysconfig,
> > > +
> > > + ares_status_t ares_init_by_environment(ares_sysconfig_t *sysconfig)=
;
> > > +
> > > +-
> > > + typedef ares_status_t (*ares_sysconfig_line_cb_t)(const
> ares_channel_t
> > *channel,
> > > +                                                   ares_sysconfig_t
>    *sysconfig,
> > > +                                                   ares_buf_t
>    *line);
> > > +@@ -589,6 +640,60 @@ ares_status_t ares_dns_name_write(ares_buf_t
> > *buf, ares_llist_t **list,
> > > +  */
> > > + void          ares_queue_notify_empty(ares_channel_t *channel);
> > > +
> > > ++/*! Is this server still installed on the channel?
> > > ++ *
> > > ++ *  Application callbacks may reconfigure the servers, which
> destroys any that
> > > ++ *  the new configuration omits.  A raw ares_server_t captured
> before such a
> > > ++ *  callback must be revalidated before it is used again.
> > > ++ *
> > > ++ *  \param[in] channel  Initialized ares channel.
> > > ++ *  \param[in] server   Server pointer captured earlier.
> > > ++ *  \return ARES_TRUE if still present.
> > > ++ */
> > > ++ares_bool_t   ares_server_in_channel(const ares_channel_t *channel,
> > > ++                                     const ares_server_t  *server);
> > > ++
> > > ++/*! Free everything awaiting reclamation on the channel.
> > > ++ *
> > > ++ *  Called only from the deferred-callback flush, at the point wher=
e
> the
> > > ++ *  outermost library call is unwinding and no frame can still hold
> a pointer
> > > ++ *  to an unlinked server or connection.
> > > ++ *
> > > ++ *  \param[in] channel  Initialized ares channel.
> > > ++ */
> > > ++void          ares_deferred_reclaim(ares_channel_t *channel);
> > > ++
> > > ++/*! Free one connection's memory.  Only for the deferred-reclaim
> path and the
> > > ++ *  immediate path in ares_close_connection(). */
> > > ++void          ares_conn_reap(ares_conn_t *conn);
> > > ++
> > > ++/*! Free one server's memory.  Only for the deferred-reclaim path
> and the
> > > ++ *  immediate path in ares_destroy_server(). */
> > > ++void          ares_server_reap(ares_server_t *server);
> > > ++
> > > ++/*! Enter a region that may produce application notifications the
> library is
> > > ++ *  not in a position to deliver yet -- socket-state and
> server-state changes.
> > > ++ *  Nesting is counted; queued notifications are delivered by the
> outermost
> > > ++ *  leave.
> > > ++ *
> > > ++ *  \param[in] channel  Initialized ares channel.
> > > ++ */
> > > ++void          ares_deferred_cb_enter(ares_channel_t *channel);
> > > ++
> > > ++/*! Leave such a region.  The outermost leave delivers the queues,
> at which
> > > ++ *  point the library holds no connection a reentrant call could
> free.
> > > ++ *
> > > ++ *  \param[in] channel  Initialized ares channel.
> > > ++ */
> > > ++void          ares_deferred_cb_leave(ares_channel_t *channel);
> > > ++
> > > ++/*! Deliver every server-state notification the channel has queued.
> Called
> > > ++ *  only from the shared deferred-callback flush.
> > > ++ *
> > > ++ *  \param[in] channel  Initialized ares channel.
> > > ++ */
> > > ++void          ares_server_state_dispatch(ares_channel_t *channel);
> > > ++
> > > + #define ARES_CONFIG_CHECK(x)
>       \
> > > +   (x && x->lookups && ares_slist_len(x->servers) > 0 && x->timeout =
>
> 0 && \
> > > +    x->tries > 0)
> > > +@@ -636,7 +741,6 @@ typedef struct ares_event_thread
> > ares_event_thread_t;
> > > + void          ares_event_thread_destroy(ares_channel_t *channel);
> > > + ares_status_t ares_event_thread_init(ares_channel_t *channel);
> > > +
> > > +-
> > > + #ifdef _WIN32
> > > + #  define HOSTENT_ADDRTYPE_TYPE short
> > > + #  define HOSTENT_LENGTH_TYPE   short
> > > +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
> > > +index b2316c4b33..82f53610fb 100644
> > > +--- a/src/lib/ares_process.c
> > > ++++ b/src/lib/ares_process.c
> > > +@@ -69,7 +69,6 @@ static ares_status_t
> ares_send_query_int(ares_server_t
> > *requested_server,
> > > +                                          ares_query_t         *quer=
y,
> > > +                                          const ares_timeval_t *now,
> > > +                                          ares_array_t
> **requeue);
> > > +-static void          ares_detach_query(ares_query_t *query);
> > > +
> > > + static void        ares_query_remove_from_conn(ares_query_t *query)
> > > + {
> > > +@@ -81,14 +80,32 @@ static void
> > ares_query_remove_from_conn(ares_query_t *query)
> > > +   query->conn                    =3D NULL;
> > > + }
> > > +
> > > ++/*! A queued server-state notification.  Holds the formatted addres=
s
> rather
> > > ++ *  than the server, so it stays valid however the server list
> changes. */
> > > ++typedef struct {
> > > ++  char       *server_string;
> > > ++  ares_bool_t success;
> > > ++  int         flags;
> > > ++} ares_server_state_msg_t;
> > > ++
> > > ++static void ares_server_state_msg_free(void *arg)
> > > ++{
> > > ++  ares_server_state_msg_t *msg =3D arg;
> > > ++  if (msg =3D=3D NULL) {
> > > ++    return; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > ++  }
> > > ++  ares_free(msg->server_string);
> > > ++}
> > > ++
> > > + /* Invoke the server state callback after a success or failure */
> > > + static void invoke_server_state_cb(const ares_server_t *server,
> > > +                                    ares_bool_t success, int flags)
> > > + {
> > > +-  const ares_channel_t *channel =3D server->channel;
> > > +-  ares_buf_t           *buf;
> > > +-  ares_status_t         status;
> > > +-  char                 *server_string;
> > > ++  ares_channel_t         *channel =3D server->channel;
> > > ++  ares_buf_t             *buf;
> > > ++  ares_status_t           status;
> > > ++  char                   *server_string;
> > > ++  ares_server_state_msg_t msg;
> > > +
> > > +   if (channel->server_state_cb =3D=3D NULL) {
> > > +     return;
> > > +@@ -111,9 +128,57 @@ static void invoke_server_state_cb(const
> > ares_server_t *server,
> > > +     return; /* LCOV_EXCL_LINE: OutOfMemory */
> > > +   }
> > > +
> > > +-  channel->server_state_cb(server_string, success, flags,
> > > +-                           channel->server_state_cb_data);
> > > +-  ares_free(server_string);
> > > ++  /* Queue rather than dispatch.  This runs in the middle of
> processing, and
> > > ++   * every caller keeps using its query / connection / server
> afterwards.  The
> > > ++   * callback is application code that may reentrantly call
> ares_cancel(),
> > > ++   * which frees those objects -- so dispatch once the library is n=
o
> longer
> > > ++   * holding them.  Same philosophy as the deferred query-callback
> dispatch.
> > > ++   *
> > > ++   * Only the formatted address is captured, never the
> ares_server_t, so a
> > > ++   * queued entry cannot outlive anything it points at. */
> > > ++  if (channel->server_state_queue =3D=3D NULL) {
> > > ++    channel->server_state_queue =3D ares_array_create(
> > > ++      sizeof(ares_server_state_msg_t), ares_server_state_msg_free);
> > > ++    if (channel->server_state_queue =3D=3D NULL) {
> > > ++      /* LCOV_EXCL_START: OutOfMemory */
> > > ++      ares_free(server_string);
> > > ++      return;
> > > ++      /* LCOV_EXCL_STOP */
> > > ++    }
> > > ++  }
> > > ++
> > > ++  msg.server_string =3D server_string;
> > > ++  msg.success       =3D success;
> > > ++  msg.flags         =3D flags;
> > > ++
> > > ++  if (ares_array_insertdata_last(channel->server_state_queue, &msg)
> !=3D
> > > ++      ARES_SUCCESS) {
> > > ++    ares_free(server_string); /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++  }
> > > ++}
> > > ++
> > > ++/*! Deliver every server-state notification the channel has queued.
> Loops
> > > ++ *  rather than snapshotting: a callback is allowed to re-enter the
> library and
> > > ++ *  queue more, and those belong to this same delivery point. */
> > > ++void ares_server_state_dispatch(ares_channel_t *channel)
> > > ++{
> > > ++  while (ares_array_len(channel->server_state_queue) > 0) {
> > > ++    ares_server_state_msg_t msg;
> > > ++
> > > ++    if (ares_array_claim_at(&msg, sizeof(msg),
> channel->server_state_queue,
> > > ++                            0) !=3D ARES_SUCCESS) {
> > > ++      break; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > ++    }
> > > ++
> > > ++    if (channel->server_state_cb !=3D NULL) {
> > > ++      channel->server_state_cb(msg.server_string, msg.success,
> msg.flags,
> > > ++                               channel->server_state_cb_data);
> > > ++    }
> > > ++    ares_free(msg.server_string);
> > > ++  }
> > > ++
> > > ++  ares_array_destroy(channel->server_state_queue);
> > > ++  channel->server_state_queue =3D NULL;
> > > + }
> > > +
> > > + static void server_increment_failures(ares_server_t *server,
> > > +@@ -204,6 +269,8 @@ static ares_status_t
> > ares_process_fds_nolock(ares_channel_t         *channel,
> > > +     return ARES_EFORMERR; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > +   }
> > > +
> > > ++  ares_deferred_cb_enter(channel);
> > > ++
> > > +   ares_tvnow(&now);
> > > +
> > > +   /* Process write events */
> > > +@@ -244,6 +311,8 @@ static ares_status_t
> > ares_process_fds_nolock(ares_channel_t         *channel,
> > > +   }
> > > +
> > > + done:
> > > ++  ares_deferred_cb_leave(channel);
> > > ++
> > > +   if (status =3D=3D ARES_ENOMEM) {
> > > +     return ARES_ENOMEM;
> > > +   }
> > > +@@ -553,6 +622,8 @@ typedef enum {
> > > + typedef struct {
> > > +   requeue_type_t     type;   /* type of entry, requeue or endquery =
*/
> > > +   unsigned short     qid;    /* query id */
> > > ++  size_t             serial; /* identifies the query the qid meant
> when
> > > ++                              * this entry was appended */
> > > +   ares_server_t     *server; /* requeue only: optional */
> > > +   ares_status_t      status; /* endquery only */
> > > +   ares_dns_record_t *dnsrec; /* endquery only: optional */
> > > +@@ -578,6 +649,7 @@ static ares_status_t
> > ares_append_requeue_int(ares_array_t     **requeue,
> > > +
> > > +   entry.type   =3D type;
> > > +   entry.qid    =3D query->qid;
> > > ++  entry.serial =3D query->serial;
> > > +   entry.server =3D server;
> > > +   entry.status =3D status;
> > > +   entry.dnsrec =3D dnsrec;
> > > +@@ -601,6 +673,53 @@ static ares_status_t
> > ares_append_endqueue(ares_array_t     **requeue,
> > > +     dnsrec);
> > > + }
> > > +
> > > ++/*! Is the query the caller captured still the one holding \a qid?
> > > ++ *
> > > ++ *  A query id is a 16-bit wire value reissued as soon as the query
> holding it
> > > ++ *  is detached, so it names a slot rather than a query, and
> comparing the
> > > ++ *  pointer as well does not help: the replacement is often
> allocated at the
> > > ++ *  address the freed one had.  The serial is a channel-wide counte=
r
> that is
> > > ++ *  never reused. */
> > > ++static ares_bool_t ares_query_is_live(const ares_channel_t *channel=
,
> > > ++                                      unsigned short qid, size_t
> serial)
> > > ++{
> > > ++  const ares_query_t *query =3D
> > > ++    ares_htable_szvp_get_direct(channel->queries_by_qid, qid);
> > > ++
> > > ++  if (query =3D=3D NULL || query->serial !=3D serial) {
> > > ++    return ARES_FALSE;
> > > ++  }
> > > ++
> > > ++  return ARES_TRUE;
> > > ++}
> > > ++
> > > ++/*! Is this exact server object still in the channel's server list?
> > > ++ *
> > > ++ *  Compares pointers only and never dereferences \a server.
> Deferred
> > > ++ *  reclamation keeps an unlinked server readable for the rest of
> the call
> > > ++ *  that captured it, so reading through it is no longer a
> use-after-free --
> > > ++ *  but it has been removed from the configuration and must not be
> acted on,
> > > ++ *  which is what this reports.  A channel has a handful of servers=
,
> so the
> > > ++ *  linear scan does not matter. */
> > > ++ares_bool_t ares_server_in_channel(const ares_channel_t *channel,
> > > ++                                   const ares_server_t  *server)
> > > ++{
> > > ++  ares_slist_node_t *node;
> > > ++
> > > ++  if (server =3D=3D NULL) {
> > > ++    return ARES_FALSE;
> > > ++  }
> > > ++
> > > ++  for (node =3D ares_slist_node_first(channel->servers); node !=3D =
NULL;
> > > ++       node =3D ares_slist_node_next(node)) {
> > > ++    if (ares_slist_node_val(node) =3D=3D server) {
> > > ++      return ARES_TRUE;
> > > ++    }
> > > ++  }
> > > ++
> > > ++  return ARES_FALSE;
> > > ++}
> > > ++
> > > + /* Drain the deferred requeue/endqueue list iteratively.  All flush
> sites
> > > +  * (read_answers(), process_timeouts(), and ares_send_query()) funn=
el
> > through
> > > +  * here so that:
> > > +@@ -636,11 +755,35 @@ static ares_status_t
> > ares_flush_requeue(ares_channel_t       *channel,
> > > +
> > > +     query =3D ares_htable_szvp_get_direct(channel->queries_by_qid,
> entry.qid);
> > > +
> > > ++    /* A query id is a 16-bit wire value and generate_unique_qid()
> only avoids
> > > ++     * ids that are live when it runs.  Within a single drain, a
> callback can
> > > ++     * cancel a query whose entry is still in this array --
> releasing its id --
> > > ++     * and start a new lookup that is handed the same id.  The
> lookup above
> > > ++     * would then resolve this entry to a completely different
> query: an
> > > ++     * endquery entry would deliver one lookup's answer to another
> and free it,
> > > ++     * a requeue entry would put an in-flight query on the wire
> twice.  The
> > > ++     * serial is a channel-wide counter that is never reused, so it
> tells the
> > > ++     * two apart. */
> > > ++    if (query !=3D NULL && query->serial !=3D entry.serial) {
> > > ++      query =3D NULL;
> > > ++    }
> > > ++
> > > +     if (entry.type =3D=3D REQUEUE_REQUEUE) {
> > > +       /* Query disappeared (e.g. a prior callback in this drain
> cancelled it) */
> > > +       if (query =3D=3D NULL) {
> > > +         continue;
> > > +       }
> > > ++      /* entry.server is a raw pointer captured before any callback
> in this
> > > ++       * drain ran.  A callback may legally re-enter the public API
> -- the
> > > ++       * channel lock is recursive -- and ares_set_servers*()
> destroys servers
> > > ++       * that are absent from the new configuration, so it may
> already be
> > > ++       * freed.  The query above is revalidated by qid for exactly
> this
> > > ++       * reason; do the same for the server, falling back to ordina=
ry
> > > ++       * selection when it has gone. */
> > > ++      if (!ares_server_in_channel(channel, entry.server)) {
> > > ++        entry.server =3D NULL;
> > > ++      }
> > > ++
> > > +       /* Re-dispatch via the internal entrypoint so any further
> requeues are
> > > +        * appended back onto this same list and drained by the loop
> above,
> > > +        * rather than recursing. */
> > > +@@ -1377,6 +1520,7 @@ ares_status_t ares_send_query(ares_server_t
> > *requested_server,
> > > +   ares_channel_t *channel =3D query->channel;
> > > +   ares_array_t   *requeue =3D NULL;
> > > +   unsigned short  qid     =3D query->qid;
> > > ++  size_t          serial  =3D query->serial;
> > > +   ares_status_t   status;
> > > +
> > > +   status =3D ares_send_query_int(requested_server, query, now,
> &requeue);
> > > +@@ -1393,8 +1537,7 @@ ares_status_t ares_send_query(ares_server_t
> > *requested_server,
> > > +    * been freed.  Do not dereference 'query' here.  If it is no
> longer tracked
> > > +    * it ended, so don't report success to the caller (which would,
> e.g., cause
> > > +    * ares_send_nolock() to write to a now-freed *qid). */
> > > +-  if (status =3D=3D ARES_SUCCESS &&
> > > +-      ares_htable_szvp_get_direct(channel->queries_by_qid, qid) =3D=
=3D
> NULL) {
> > > ++  if (status =3D=3D ARES_SUCCESS && !ares_query_is_live(channel, qi=
d,
> serial))
> > {
> > > +     status =3D ARES_ETIMEOUT;
> > > +   }
> > > +
> > > +@@ -1412,6 +1555,9 @@ static ares_status_t
> > ares_send_query_int(ares_server_t        *requested_server,
> > > +   size_t          timeplus;
> > > +   ares_status_t   status;
> > > +   ares_bool_t     probe_downed_server =3D ARES_TRUE;
> > > ++  /* Captured before any application callback below, which may free
> the query
> > */
> > > ++  unsigned short  qid    =3D query->qid;
> > > ++  size_t          serial =3D query->serial;
> > > +
> > > +   /* Choose the server to send the query to */
> > > +   if (requested_server !=3D NULL) {
> > > +@@ -1443,6 +1589,32 @@ static ares_status_t
> > ares_send_query_int(ares_server_t        *requested_server,
> > > +   conn =3D ares_fetch_connection(channel, server, query);
> > > +   if (conn =3D=3D NULL) {
> > > +     status =3D ares_open_connection(&conn, channel, server,
> query->using_tcp);
> > > ++
> > > ++    /* Opening a connection runs application code -- the socket-ope=
n
> function
> > > ++     * from ares_set_socket_functions_ex(), and the
> > ares_set_socket_callback()
> > > ++     * and ares_set_socket_configure_callback() callbacks -- any of
> which may
> > > ++     * reentrantly call ares_cancel() and free this query.  Re-chec=
k
> liveness
> > > ++     * by the qid captured at entry rather than dereferencing a
> possibly-freed
> > > ++     * query. */
> > > ++    if (!ares_query_is_live(channel, qid, serial)) {
> > > ++      return ARES_ECANCELLED;
> > > ++    }
> > > ++
> > > ++    /* Those same callbacks may have reconfigured the servers, whic=
h
> frees
> > the
> > > ++     * ones the new configuration omits.  'server' was captured
> before the
> > > ++     * open; everything below reads it, including
> server_increment_failures()
> > > ++     * on the failure paths of the switch.
> > > ++     *
> > > ++     * Requeue rather than return: every exit from this function
> must either
> > > ++     * enqueue the query or end it, and the query is still live her=
e
> -- it has
> > > ++     * not been written, is not attached to a connection, and on a
> first send
> > > ++     * has no timeout node, so returning would strand it forever.
> > > ++     * query->conn is NULL, so this does not read through the freed
> server. */
> > > ++    if (!ares_server_in_channel(channel, server)) {
> > > ++      return ares_requeue_query(query, now, ARES_ECONNREFUSED,
> > ARES_TRUE, NULL,
> > > ++                                requeue);
> > > ++    }
> > > ++
> > > +     switch (status) {
> > > +       /* Good result, continue on */
> > > +       case ARES_SUCCESS:
> > > +@@ -1464,6 +1636,14 @@ static ares_status_t
> > ares_send_query_int(ares_server_t        *requested_server,
> > > +
> > > +   /* Write the query */
> > > +   status =3D ares_conn_query_write(conn, query, now);
> > > ++
> > > ++  /* Writing runs application code too: ares_conn_query_write()
> reaches the
> > > ++   * send function installed by ares_set_socket_functions_ex(),
> which may
> > > ++   * reentrantly call ares_cancel() with the same hazard as above. =
*/
> > > ++  if (!ares_query_is_live(channel, qid, serial)) {
> > > ++    return ARES_ECANCELLED;
> > > ++  }
> > > ++
> > > +   switch (status) {
> > > +     /* Good result, continue on */
> > > +     case ARES_SUCCESS:
> > > +@@ -1479,6 +1659,17 @@ static ares_status_t
> > ares_send_query_int(ares_server_t        *requested_server,
> > > +     case ARES_ECONNREFUSED:
> > > +     case ARES_EBADFAMILY:
> > > +       handle_conn_error(conn, ARES_TRUE, status);
> > > ++      /* handle_conn_error() -> ares_close_connection() ->
> > > ++       * ares_requeue_queries() walks conn->queries_to_conn and may
> > terminally
> > > ++       * end other queries on this connection.  If one of their
> callbacks
> > > ++       * reentrantly calls ares_cancel(), this query is freed too -=
-
> it is still
> > > ++       * linked in all_queries, since it only joins
> conn->queries_to_conn on the
> > > ++       * success path below.  Re-check liveness by the qid captured
> at entry
> > > ++       * rather than dereferencing a possibly-freed query.  Mirrors
> the guard in
> > > ++       * ares_send_query(). */
> > > ++      if (!ares_query_is_live(channel, qid, serial)) {
> > > ++        return ARES_ECONNREFUSED;
> > > ++      }
> > > +       status =3D ares_requeue_query(query, now, status, ARES_TRUE,
> NULL,
> > requeue);
> > > +       if (status =3D=3D ARES_ETIMEOUT) {
> > > +         status =3D ARES_ECONNREFUSED;
> > > +@@ -1597,11 +1788,18 @@ static ares_bool_t same_questions(const
> > ares_query_t      *query,
> > > +   return rv;
> > > + }
> > > +
> > > +-static void ares_detach_query(ares_query_t *query)
> > > ++void ares_detach_query(ares_query_t *query)
> > > + {
> > > +   /* Remove the query from all the lists in which it is linked */
> > > +   ares_query_remove_from_conn(query);
> > > +-  ares_htable_szvp_remove(query->channel->queries_by_qid,
> query->qid);
> > > ++  /* Only release the qid slot if it is still ours.  A query
> detached before
> > > ++   * its callback can have its qid reissued to a lookup started fro=
m
> within
> > > ++   * that callback, and the ares_free_query() that follows detaches
> a second
> > > ++   * time -- which would otherwise evict the new lookup instead. */
> > > ++  if (ares_htable_szvp_get_direct(query->channel->queries_by_qid,
> query-
> > >qid) =3D=3D
> > > ++      query) {
> > > ++    ares_htable_szvp_remove(query->channel->queries_by_qid,
> query->qid);
> > > ++  }
> > > +   ares_llist_node_destroy(query->node_all_queries);
> > > +   query->node_all_queries =3D NULL;
> > > + }
> > > +@@ -1624,6 +1822,16 @@ static void end_query(ares_channel_t *channel=
,
> > ares_server_t *server,
> > > +     return;
> > > +   }
> > > +
> > > ++  /* Detach from all lookup lists before the callback, otherwise a
> reentrant
> > > ++   * ares_cancel() from within it would find this query still
> linked, free it,
> > > ++   * and the ares_free_query() below would double-free.  Mirrors
> > > ++   * ares_flush_requeue() for every synchronous path that reaches
> here with a
> > > ++   * NULL requeue: connection teardown via handle_conn_error(), and
> server
> > > ++   * removal via ares_servers_update() and
> ares_destroy_servers_state(),
> > both
> > > ++   * of which reach ares_close_sockets().
> > > ++   * ares_detach_query() may safely run twice on the same query. */
> > > ++  ares_detach_query(query);
> > > ++
> > > +   /* Invoke the callback. */
> > > +   query->callback(query->arg, status, query->timeouts, dnsrec);
> > > +   ares_free_query(query);
> > > +@@ -1631,7 +1839,8 @@ static void end_query(ares_channel_t *channel,
> > ares_server_t *server,
> > > +   /* Check and notify if no other queries are enqueued on the
> channel.  This
> > > +    * must come after the callback and freeing the query for 2
> reasons.
> > > +    *  1) The callback itself may enqueue a new query
> > > +-   *  2) Technically the current query isn't detached until it is
> free()'d.
> > > ++   *  2) The current query is detached above, before the callback,
> so by this
> > > ++   *     point it is no longer tracked.
> > > +    */
> > > +   ares_queue_notify_empty(channel);
> > > + }
> > > +diff --git a/src/lib/ares_send.c b/src/lib/ares_send.c
> > > +index 6efa9580b2..2e0482bf19 100644
> > > +--- a/src/lib/ares_send.c
> > > ++++ b/src/lib/ares_send.c
> > > +@@ -117,6 +117,27 @@ ares_status_t ares_send_nolock(ares_channel_t
> > *channel, ares_server_t *server,
> > > +   unsigned short           id          =3D
> generate_unique_qid(channel);
> > > +   const ares_dns_record_t *dnsrec_resp =3D NULL;
> > > +
> > > ++  /* A channel being destroyed accepts no new queries.
> ares_destroy(3)
> > > ++   * documents that a callback must not add new requests to a
> channel being
> > > ++   * destroyed.  Refuse it, but still notify: ARES_EDESTRUCTION is
> > documented
> > > ++   * in ares_query(3), ares_send(3), ares_search(3) and
> ares_getaddrinfo(3)
> > as
> > > ++   * a status delivered to the callback, and every caller frees its
> own
> > > ++   * context from there.
> > > ++   *
> > > ++   * Not notified if we are already inside such a notification: an
> application
> > > ++   * whose callback starts a replacement lookup on every invocation
> would
> > > ++   * otherwise re-enter here from within the callback without bound
> and
> > > ++   * exhaust the stack.  At that depth it is already past the
> contract
> > > ++   * ares_destroy(3) documents. */
> > > ++  if (!channel->sys_up) {
> > > ++    if (!channel->in_shutdown_refusal) {
> > > ++      channel->in_shutdown_refusal =3D ARES_TRUE;
> > > ++      callback(arg, ARES_EDESTRUCTION, 0, NULL);
> > > ++      channel->in_shutdown_refusal =3D ARES_FALSE;
> > > ++    }
> > > ++    return ARES_EDESTRUCTION;
> > > ++  }
> > > ++
> > > +   ares_tvnow(&now);
> > > +
> > > +   if (ares_slist_len(channel->servers) =3D=3D 0) {
> > > +@@ -145,6 +166,7 @@ ares_status_t ares_send_nolock(ares_channel_t
> > *channel, ares_server_t *server,
> > > +
> > > +   query->channel      =3D channel;
> > > +   query->qid          =3D id;
> > > ++  query->serial       =3D ++channel->query_serial;
> > > +   query->timeout.sec  =3D 0;
> > > +   query->timeout.usec =3D 0;
> > > +   query->using_tcp =3D
> > > +@@ -209,6 +231,12 @@ ares_status_t ares_send_nolock(ares_channel_t
> > *channel, ares_server_t *server,
> > > +    */
> > > +   if (!ares_htable_szvp_insert(channel->queries_by_qid, query->qid,
> query)) {
> > > +     /* LCOV_EXCL_START: OutOfMemory */
> > > ++    /* The query is already chained into all_queries, so a reentran=
t
> > > ++     * ares_cancel() from the callback below would find it, run the
> > > ++     * application callback a second time for one lookup, and free
> it -- and
> > > ++     * the ares_free_query() here would then double-free.  Same
> ordering as
> > > ++     * ares_cancel() and ares_destroy(): unlink first, notify
> second. */
> > > ++    ares_detach_query(query);
> > > +     callback(arg, ARES_ENOMEM, 0, NULL);
> > > +     ares_free_query(query);
> > > +     return ARES_ENOMEM;
> > > +@@ -217,10 +245,17 @@ ares_status_t ares_send_nolock(ares_channel_t
> > *channel, ares_server_t *server,
> > > +
> > > +   /* Perform the first query action. */
> > > +
> > > ++  /* Sending opens and writes to connections and can mark a server
> down,
> > both
> > > ++   * of which notify.  Deliver those once we are done with the
> connection and
> > > ++   * the server, not part-way through. */
> > > ++  ares_deferred_cb_enter(channel);
> > > +   status =3D ares_send_query(server, query, &now);
> > > ++  ares_deferred_cb_leave(channel);
> > > ++
> > > +   if (status =3D=3D ARES_SUCCESS && qid) {
> > > +     *qid =3D id;
> > > +   }
> > > ++
> > > +   return status;
> > > + }
> > > +
> > > +diff --git a/src/lib/ares_update_servers.c
> b/src/lib/ares_update_servers.c
> > > +index f8d441accf..50a9c27925 100644
> > > +--- a/src/lib/ares_update_servers.c
> > > ++++ b/src/lib/ares_update_servers.c
> > > +@@ -740,17 +740,36 @@ static ares_bool_t
> > ares_servers_remove_stale(ares_channel_t *channel,
> > > + {
> > > +   ares_bool_t        stale_removed =3D ARES_FALSE;
> > > +   ares_slist_node_t *snode         =3D
> ares_slist_node_first(channel->servers);
> > > ++  size_t             generation    =3D channel->servers_generation;
> > > +
> > > ++  /* Re-read from the head each pass rather than caching the next
> node.
> > > ++   * ares_slist_node_destroy() below reaches application callbacks,
> by way of
> > > ++   * ares_destroy_server() -> ares_close_sockets() ->
> > ares_requeue_queries(),
> > > ++   * and a nested reconfiguration from one of those destroys the
> remaining
> > > ++   * stale servers -- including whichever one a cached pointer
> referred to. */
> > > +   while (snode !=3D NULL) {
> > > +-    ares_slist_node_t   *snext  =3D ares_slist_node_next(snode);
> > > +     const ares_server_t *server =3D ares_slist_node_val(snode);
> > > +-    if (!ares_server_in_newconfig(server, srvlist)) {
> > > +-      /* This will clean up all server state via the destruction
> callback and
> > > +-       * move any queries to new servers */
> > > +-      ares_slist_node_destroy(snode);
> > > +-      stale_removed =3D ARES_TRUE;
> > > ++
> > > ++    if (ares_server_in_newconfig(server, srvlist)) {
> > > ++      snode =3D ares_slist_node_next(snode);
> > > ++      continue;
> > > +     }
> > > +-    snode =3D snext;
> > > ++
> > > ++    /* This will clean up all server state via the destruction
> callback and
> > > ++     * move any queries to new servers */
> > > ++    ares_slist_node_destroy(snode);
> > > ++    stale_removed =3D ARES_TRUE;
> > > ++
> > > ++    /* A callback reached from the destroy above may have
> reconfigured the
> > > ++     * server list against a newer configuration.  That call has
> already
> > > ++     * reconciled the whole list, so whatever remains belongs to it
> and not to
> > > ++     * srvlist -- stop rather than deleting its servers. */
> > > ++    if (channel->servers_generation !=3D generation) {
> > > ++      break;
> > > ++    }
> > > ++
> > > ++    /* The callbacks above may have removed further servers, so
> restart. */
> > > ++    snode =3D ares_slist_node_first(channel->servers);
> > > +   }
> > > +   return stale_removed;
> > > + }
> > > +@@ -775,6 +794,14 @@ ares_status_t ares_servers_update(ares_channel_=
t
> > *channel,
> > > +     return ARES_EFORMERR; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > +   }
> > > +
> > > ++  /* Removing servers closes their connections, which notifies.
> Deliver
> > > ++   * once this call is done rather than from inside the teardown. *=
/
> > > ++  ares_deferred_cb_enter(channel);
> > > ++
> > > ++  /* Bumped before anything below can reach an application callback=
,
> so a
> > > ++   * nested reconfiguration is distinguishable from our own work. *=
/
> > > ++  channel->servers_generation++;
> > > ++
> > > +   /* NOTE: a NULL or zero entry server list is considered valid due
> to
> > > +    *       real-world people needing support for this for their tes=
t
> harnesses
> > > +    */
> > > +@@ -843,6 +870,7 @@ ares_status_t ares_servers_update(ares_channel_t
> > *channel,
> > > +   status =3D ARES_SUCCESS;
> > > +
> > > + done:
> > > ++  ares_deferred_cb_leave(channel);
> > > +   return status;
> > > + }
> > > +
> > > +diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc
> > > +index c0c0279abb..2158c5a913 100644
> > > +--- a/test/ares-test-mock.cc
> > > ++++ b/test/ares-test-mock.cc
> > > +@@ -31,6 +31,11 @@
> > > + #include <sys/stat.h>
> > > + #endif
> > > +
> > > ++#ifndef _WIN32
> > > ++#  include <errno.h>
> > > ++#  include <fcntl.h>
> > > ++#endif
> > > ++
> > > + #include <sstream>
> > > + #include <vector>
> > > +
> > > +@@ -1914,6 +1919,7 @@ TEST_P(MockRetryDepthChannelTest,
> > HighRetryNoStackOverflow) {
> > > + struct CancelInCbData {
> > > +   ares_channel_t *channel;
> > > +   bool            done;
> > > ++  size_t          cbs;
> > > + };
> > > +
> > > + static void CancelChannelCallback(void *arg, ares_status_t status,
> > > +@@ -1925,10 +1931,1071 @@ static void CancelChannelCallback(void *ar=
g,
> > ares_status_t status,
> > > +   (void)timeouts;
> > > +   (void)dnsrec;
> > > +   data->done =3D true;
> > > ++  data->cbs++;
> > > +   /* Reentrant cancel from within the callback.  Must not
> double-free. */
> > > +   ares_cancel(data->channel);
> > > + }
> > > +
> > > ++// ares_destroy() notifies each still-running query that the channe=
l
> is going
> > > ++// away, and holds a pointer to the next one in its list while doin=
g
> so.  A
> > > ++// reentrant ares_cancel() from one of those callbacks frees every
> remaining
> > > ++// query -- including that cached next, which ares_destroy() then
> follows.
> > > ++//
> > > ++// ares_cancel() is immune to the same pattern because it swaps the
> list head
> > > ++// before walking it; ares_destroy() did not.  Two queries are
> required: with
> > > ++// only one in flight there is no next to cache and nothing goes
> wrong.
> > > ++// tries=3D1 so a teardown ends the query outright instead of retry=
ing
> it, which
> > > ++// is the precondition this family of bugs shares.
> > > ++class MockUDPSingleTryTest : public MockChannelOptsTest,
> > > ++                             public
> ::testing::WithParamInterface<int> {
> > > ++public:
> > > ++  MockUDPSingleTryTest()
> > > ++    : MockChannelOptsTest(1, GetParam(), false, false,
> FillOptions(&opts_),
> > > ++                          ARES_OPT_TRIES)
> > > ++  {
> > > ++  }
> > > ++
> > > ++  static struct ares_options *FillOptions(struct ares_options *opts=
)
> > > ++  {
> > > ++    memset(opts, 0, sizeof(struct ares_options));
> > > ++    opts->tries =3D 1;
> > > ++    return opts;
> > > ++  }
> > > ++
> > > ++private:
> > > ++  struct ares_options opts_;
> > > ++};
> > > ++
> > > ++// ares_cancel() and ares_destroy() free a query themselves rather
> than
> > going
> > > ++// through end_query().  Both used to invoke the application
> callback while
> > the
> > > ++// query was still in queries_by_qid, on conn->queries_to_conn and =
in
> > > ++// queries_by_timeout -- only all_queries was unlinked first.  A
> reentrant
> > > ++// teardown from within that callback therefore still found the
> query, ended it
> > > ++// a second time, and freed it; the ares_free_query() that followed
> then
> > > ++// double-freed.  One query in flight is enough.
> > > ++static void ReconfigureServersCallback(void *arg, ares_status_t
> status,
> > > ++                                       size_t
>  timeouts,
> > > ++                                       const ares_dns_record_t
> *dnsrec) {
> > > ++  CancelInCbData *data =3D static_cast<CancelInCbData *>(arg);
> > > ++  (void)status;
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  data->done =3D true;
> > > ++  data->cbs++;
> > > ++  /* Frees every server absent from the new configuration, closing
> their
> > > ++   * connections -- which still hold the queries being torn down. *=
/
> > > ++  ares_set_servers_csv(data->channel, "127.0.0.1:53055");
> > > ++}
> > > ++
> > > ++// Reconfiguring the server list from a cancellation callback.
> > > ++TEST_P(MockUDPSingleTryTest,
> > ReconfigureInCancelCallbackNoDoubleFree) {
> > > ++  CancelInCbData data;
> > > ++  data.channel =3D channel_;
> > > ++  data.done    =3D false;
> > > ++  data.cbs     =3D 0;
> > > ++
> > > ++  QueryResult result;
> > > ++  /* Left unanswered, so both stay attached to the connection. */
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel_, "www.google.com",
> ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A,
> ReconfigureServersCallback,
> > > ++                              &data, NULL));
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel_, "www.example.com",
> > ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A, QueryCallback,
> &result, NULL));
> > > ++
> > > ++  ares_cancel(channel_);
> > > ++  EXPECT_TRUE(data.done);
> > > ++  EXPECT_TRUE(result.done_);
> > > ++  /* Each lookup must be notified exactly once, not twice. */
> > > ++  EXPECT_EQ((size_t)1, data.cbs);
> > > ++}
> > > ++
> > > ++/* The replacement lookup's result outlives the callback that start=
s
> it. */
> > > ++static QueryResult g_replacement_result;
> > > ++
> > > ++static void NewQueryOnFailingWriteCallback(void *arg, ares_status_t
> status,
> > > ++                                           size_t
>  timeouts,
> > > ++                                           const ares_dns_record_t
> *dnsrec) {
> > > ++  /* ares_set_socket_functions() stores the pointer rather than
> copying it, so
> > > ++   * this must outlive the call. */
> > > ++  static ares_socket_functions sock_funcs;
> > > ++  CancelInCbData              *data =3D static_cast<CancelInCbData
> *>(arg);
> > > ++  (void)status;
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++
> > > ++  data->cbs++;
> > > ++
> > > ++  /* Only the first cancellation callback starts a replacement
> lookup. */
> > > ++  if (data->done) {
> > > ++    return;
> > > ++  }
> > > ++  data->done =3D true;
> > > ++
> > > ++  memset(&sock_funcs, 0, sizeof(sock_funcs));
> > > ++  sock_funcs.asendv =3D LibraryTest::ares_sendv_fail;
> > > ++  ares_set_socket_functions(data->channel, &sock_funcs, NULL);
> > > ++  LibraryTest::SetFailSend();
> > > ++
> > > ++  ares_query_dnsrec(data->channel, "www.probe.com", ARES_CLASS_IN,
> > > ++                    ARES_REC_TYPE_A, QueryCallback,
> &g_replacement_result,
> > > ++                    NULL);
> > > ++}
> > > ++
> > > ++// No reconfiguration at all: the cancellation callback simply
> starts a
> > > ++// replacement lookup -- an ordinary retry pattern -- and that
> lookup's write
> > > ++// fails.  ares_close_connection() then walks conn->queries_to_conn=
,
> which
> > > ++// still holds the queries ares_cancel() is in the middle of.  Wide=
r
> than the
> > > ++// case above: it needs nothing more than a connection error.
> > > ++TEST_P(MockUDPSingleTryTest,
> > NewQueryInCancelCallbackConnErrorNoDoubleFree) {
> > > ++  CancelInCbData data;
> > > ++  data.channel =3D channel_;
> > > ++  data.done    =3D false;
> > > ++  data.cbs     =3D 0;
> > > ++
> > > ++  g_replacement_result.done_ =3D false;
> > > ++
> > > ++  QueryResult result;
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel_, "www.google.com",
> ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A,
> NewQueryOnFailingWriteCallback,
> > > ++                              &data, NULL));
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel_, "www.example.com",
> > ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A, QueryCallback,
> &result, NULL));
> > > ++
> > > ++  ares_cancel(channel_);
> > > ++  EXPECT_TRUE(data.done);
> > > ++  EXPECT_TRUE(result.done_);
> > > ++  /* Each lookup must be notified exactly once, not twice. */
> > > ++  EXPECT_EQ((size_t)1, data.cbs);
> > > ++  /* Pins that the replacement lookup ran and its write failed,
> which is what
> > > ++   * drives the connection teardown this test is about. */
> > > ++  EXPECT_TRUE(g_replacement_result.done_);
> > > ++}
> > > ++
> > > ++// The same shape through ares_destroy() rather than ares_cancel().
> > Swapping
> > > ++// the all_queries head does not help here: the reentrant teardown
> reaches
> > the
> > > ++// query through the connection, not through all_queries.
> > > ++TEST_P(MockUDPSingleTryTest,
> > ReconfigureInDestroyCallbackNoDoubleFree) {
> > > ++  CancelInCbData data;
> > > ++  data.channel =3D channel_;
> > > ++  data.done    =3D false;
> > > ++  data.cbs     =3D 0;
> > > ++
> > > ++  QueryResult result;
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel_, "www.google.com",
> ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A,
> ReconfigureServersCallback,
> > > ++                              &data, NULL));
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel_, "www.example.com",
> > ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A, QueryCallback,
> &result, NULL));
> > > ++
> > > ++  ares_destroy(channel_);
> > > ++  channel_ =3D nullptr; /* destroyed here, don't let the fixture
> repeat it */
> > > ++
> > > ++  EXPECT_TRUE(data.done);
> > > ++  EXPECT_TRUE(result.done_);
> > > ++  /* Each lookup must be notified exactly once, not twice. */
> > > ++  EXPECT_EQ((size_t)1, data.cbs);
> > > ++}
> > > ++
> > > ++// Once ares_destroy() has begun, a lookup started from a destructi=
on
> > callback
> > > ++// is refused rather than allocated into a channel being torn down
> -- and the
> > > ++// refusal still runs the caller's callback with ARES_EDESTRUCTION,
> so
> > context
> > > ++// attached to `arg` can be reclaimed.  ares_cancel() leaves sys_up
> true, so a
> > > ++// destruction callback is the only way to reach this.
> > > ++struct DestroyReentryData {
> > > ++  ares_channel_t *channel;
> > > ++  size_t          outer_cbs;
> > > ++  size_t          replacement_cbs;
> > > ++  ares_status_t   replacement_status;
> > > ++};
> > > ++
> > > ++static void DestroyReplacementCallback(void *arg, ares_status_t
> status,
> > > ++                                       size_t
>  timeouts,
> > > ++                                       const ares_dns_record_t
> *dnsrec) {
> > > ++  DestroyReentryData *data =3D static_cast<DestroyReentryData *>(ar=
g);
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  data->replacement_cbs++;
> > > ++  data->replacement_status =3D status;
> > > ++}
> > > ++
> > > ++static void DestroyReentryCallback(void *arg, ares_status_t status,
> > > ++                                   size_t                   timeout=
s,
> > > ++                                   const ares_dns_record_t *dnsrec)=
 {
> > > ++  DestroyReentryData *data =3D static_cast<DestroyReentryData *>(ar=
g);
> > > ++  (void)status;
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  data->outer_cbs++;
> > > ++  ares_query_dnsrec(data->channel, "www.example.com",
> > ARES_CLASS_IN,
> > > ++                    ARES_REC_TYPE_A, DestroyReplacementCallback,
> data,
> > NULL);
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, NewQueryInDestroyCallbackIsRefusedAndNotified) =
{
> > > ++  ares_channel_t     *channel =3D nullptr;
> > > ++  struct ares_options opts;
> > > ++  int                 optmask =3D 0;
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  opts.tries  =3D 1;
> > > ++  optmask    |=3D ARES_OPT_TRIES;
> > > ++  opts.flags  =3D ARES_FLAG_NOSEARCH;
> > > ++  optmask    |=3D ARES_OPT_FLAGS;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&channel, &opts,
> > optmask));
> > > ++  // Nothing listens here; no traffic is needed.
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel,
> > "127.0.0.1:53055"));
> > > ++
> > > ++  DestroyReentryData data;
> > > ++  data.channel            =3D channel;
> > > ++  data.outer_cbs          =3D 0;
> > > ++  data.replacement_cbs    =3D 0;
> > > ++  data.replacement_status =3D ARES_SUCCESS;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel, "www.google.com",
> ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A,
> DestroyReentryCallback, &data,
> > > ++                              NULL));
> > > ++
> > > ++  ares_destroy(channel);
> > > ++
> > > ++  EXPECT_EQ((size_t)1, data.outer_cbs);
> > > ++  // Refused -- but notified, so the caller can release whatever it
> attached.
> > > ++  EXPECT_EQ((size_t)1, data.replacement_cbs);
> > > ++  EXPECT_EQ(ARES_EDESTRUCTION, data.replacement_status);
> > > ++}
> > > ++
> > > ++INSTANTIATE_TEST_SUITE_P(AddressFamilies, MockUDPSingleTryTest,
> > > ++                         ::testing::ValuesIn(ares::test::families),
> > > ++                         PrintFamily);
> > > ++
> > > ++TEST_P(MockUDPChannelTest, CancelInDestroyCallbackNoUseAfterFree) {
> > > ++  CancelInCbData data;
> > > ++  data.channel =3D channel_;
> > > ++  data.done    =3D false;
> > > ++  data.cbs     =3D 0;
> > > ++
> > > ++  /* Left unanswered, so both are still pending when the channel
> goes down.
> > */
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel_, "www.google.com",
> ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A,
> CancelChannelCallback, &data,
> > > ++                              NULL));
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel_, "www.example.com",
> > ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A,
> CancelChannelCallback, &data,
> > > ++                              NULL));
> > > ++  /* Without this the test can pass vacuously if a query failed to
> start. */
> > > ++  EXPECT_EQ(2, ares_queue_active_queries(channel_));
> > > ++
> > > ++  ares_destroy(channel_);
> > > ++  channel_ =3D nullptr; /* destroyed here, don't let the fixture
> repeat it */
> > > ++
> > > ++  EXPECT_TRUE(data.done);
> > > ++  /* Every query must be notified exactly once. */
> > > ++  EXPECT_EQ((size_t)2, data.cbs);
> > > ++}
> > > ++
> > > ++// Fixture with tries=3D1 so the first failure ends the query outri=
ght
> instead of
> > > ++// retrying it -- that is what drives execution into end_query()'s
> synchronous
> > > ++// (requeue=3D=3DNULL) branch.
> > > ++// The tests below use the MockUDPSingleTryTest fixture defined
> above:
> > tries=3D1,
> > > ++// so the first failure ends the query outright instead of retrying
> it, which
> > > ++// is what drives execution into end_query()'s synchronous
> (requeue=3D=3DNULL)
> > > ++// branch.
> > > ++//
> > > ++
> > > ++// Connection-teardown route into the synchronous branch.  A
> malformed
> > reply
> > > ++// makes process_answer() return EBADRESP, so handle_conn_error()
> tears
> > the
> > > ++// connection down and ares_close_connection() requeues its queries
> with a
> > NULL
> > > ++// requeue; with tries=3D1 the query is ended right there.
> CVE-2026-33630
> > fixed
> > > ++// the deferred flush path only, so this one still double-freed.
> > > ++TEST_P(MockUDPSingleTryTest,
> > CancelInCallbackConnTeardownNoDoubleFree) {
> > > ++  /* Too short to be a DNS header, so it fails to parse. */
> > > ++  std::vector<byte> malformed =3D {0x00, 0x00, 0x00, 0x00};
> > > ++  ON_CALL(server_, OnRequest("www.google.com", T_A))
> > > ++    .WillByDefault(SetReplyData(&server_, malformed));
> > > ++
> > > ++  CancelInCbData data;
> > > ++  data.channel =3D channel_;
> > > ++  data.done    =3D false;
> > > ++  data.cbs     =3D 0;
> > > ++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    CancelChannelCallback, &data, NULL);
> > > ++  Process();
> > > ++  EXPECT_TRUE(data.done);
> > > ++}
> > > ++
> > > ++// Server-removal route into the same synchronous branch, which the
> > > ++// connection-teardown test above does not cover.  Reconfiguring th=
e
> server
> > list
> > > ++// destroys the servers that are gone, and ares_close_sockets()
> closes their
> > > ++// connections with a NULL requeue -- a second way to reach
> end_query()
> > with the
> > > ++// query still linked.  No Process() call is needed: the query is
> attached to a
> > > ++// connection by ares_query_dnsrec() itself, and nothing has replie=
d
> to it.
> > > ++TEST_P(MockUDPSingleTryTest,
> > CancelInCallbackServerRemovalNoDoubleFree) {
> > > ++  CancelInCbData data;
> > > ++  data.channel =3D channel_;
> > > ++  data.done    =3D false;
> > > ++  data.cbs     =3D 0;
> > > ++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    CancelChannelCallback, &data, NULL);
> > > ++
> > > ++  /* Drops the server the in-flight query is attached to. */
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel_,
> > "127.0.0.1:53055"));
> > > ++  EXPECT_TRUE(data.done);
> > > ++}
> > > ++
> > > ++// ares_send_query_int() calls handle_conn_error() on a retryable
> write
> > failure
> > > ++// and then keeps using its own query.  That teardown requeues the
> *other*
> > > ++// queries on the connection, and with tries=3D1 they are ended
> outright; if one
> > > ++// of their callbacks reentrantly cancels the channel, this query i=
s
> freed too
> > > ++// -- it is still linked in all_queries, having only joined
> > > ++// conn->queries_to_conn on the success path further down.  Using i=
t
> > afterwards
> > > ++// is a use-after-free.
> > > ++//
> > > ++// The first query is left unanswered so it stays on the connection=
,
> then the
> > > ++// next write is made to fail with ECONNREFUSED so the second query
> takes
> > the
> > > ++// error path while the first is still attached.
> > > ++//
> > > ++// Note this is masked on code that has not fixed the end_query()
> double-free:
> > > ++// that aborts inside handle_conn_error() before control returns
> here.
> > > ++TEST_P(MockUDPSingleTryTest,
> > CancelInSiblingCallbackConnErrorNoUseAfterFree) {
> > > ++  CancelInCbData data;
> > > ++  data.channel =3D channel_;
> > > ++  data.done    =3D false;
> > > ++  data.cbs     =3D 0;
> > > ++
> > > ++  /* No reply configured for this one, so it stays attached to the
> connection. */
> > > ++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    CancelChannelCallback, &data, NULL);
> > > ++
> > > ++  ares_socket_functions sock_funcs;
> > > ++  memset(&sock_funcs, 0, sizeof(sock_funcs));
> > > ++  sock_funcs.asendv =3D ares_sendv_fail;
> > > ++  ares_set_socket_functions(channel_, &sock_funcs, NULL);
> > > ++  LibraryTest::SetFailSend();
> > > ++
> > > ++  QueryResult result;
> > > ++  ares_query_dnsrec(channel_, "www.example.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    QueryCallback, &result, NULL);
> > > ++
> > > ++  /* The write failure above tears the connection down, which ends
> the first
> > > ++   * query, whose callback cancels the channel and frees this one. =
*/
> > > ++  EXPECT_TRUE(data.done);
> > > ++  /* The sibling is cancelled from the first query's callback rathe=
r
> than
> > > ++   * requeued; pin that rather than leaving it unstated. */
> > > ++  EXPECT_TRUE(result.done_);
> > > ++  EXPECT_EQ(ARES_ECANCELLED, result.status_);
> > > ++}
> > > ++
> > > ++// The socket-state callback -- registered with
> ARES_OPT_SOCK_STATE_CB,
> > the
> > > ++// usual way c-ares is driven from an event loop -- used to be
> dispatched from
> > > ++// the middle of opening a connection, and ares_open_connection()
> keeps
> > using
> > > ++// that connection afterwards.  A reentrant ares_cancel() from the
> callback
> > > ++// frees both the connection (through the idle sweep) and the
> in-flight query,
> > > ++// leaving the library using either.
> > > ++struct SockStateCancelData {
> > > ++  ares_channel_t *channel;
> > > ++  size_t          calls;
> > > ++};
> > > ++
> > > ++static void SockStateCancelCallback(void *data, ares_socket_t
> socket_fd,
> > > ++                                    int readable, int writable)
> > > ++{
> > > ++  SockStateCancelData *d =3D static_cast<SockStateCancelData *>(dat=
a);
> > > ++  (void)socket_fd;
> > > ++  (void)readable;
> > > ++  (void)writable;
> > > ++  d->calls++;
> > > ++  // Reentrant cancel from the socket-state notification.
> > > ++  if (d->channel !=3D nullptr) {
> > > ++    ares_cancel(d->channel);
> > > ++  }
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, CancelInSockStateCallbackNoUseAfterFree) {
> > > ++  SockStateCancelData data;
> > > ++  ares_channel_t     *chan =3D nullptr;
> > > ++  struct ares_options opts;
> > > ++  int                 optmask =3D 0;
> > > ++
> > > ++  data.channel =3D nullptr;
> > > ++  data.calls   =3D 0;
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  opts.sock_state_cb      =3D SockStateCancelCallback;
> > > ++  opts.sock_state_cb_data =3D &data;
> > > ++  optmask                 =3D ARES_OPT_SOCK_STATE_CB;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&chan, &opts,
> > optmask));
> > > ++  ASSERT_NE(nullptr, chan);
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,
> > "127.0.0.1:53055"));
> > > ++
> > > ++  /* Armed only now, so channel setup itself does not cancel. */
> > > ++  data.channel =3D chan;
> > > ++
> > > ++  QueryResult result;
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    QueryCallback, &result, NULL);
> > > ++
> > > ++  /* Opening the connection notifies, the notification cancels, and
> the
> > > ++   * library must still be able to finish -- and the lookup must
> actually be
> > > ++   * cancelled rather than the cancel quietly doing nothing. */
> > > ++  EXPECT_GT(data.calls, (size_t)0);
> > > ++  EXPECT_TRUE(result.done_);
> > > ++  EXPECT_EQ(ARES_ECANCELLED, result.status_);
> > > ++
> > > ++  data.channel =3D nullptr; /* don't cancel from teardown
> notifications */
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++// Deferring the notification must not reorder it past the close of
> the
> > > ++// descriptor it names.  An event loop is told "stop watching fd N"=
;
> if fd N is
> > > ++// already closed by then, the number can have been handed to
> something
> > else --
> > > ++// including to application code running from a deferred query
> callback -- and
> > > ++// the application ends up setting and clearing interest in a
> descriptor it now
> > > ++// owns for another purpose.
> > > ++//
> > > ++// The invariant is checked directly: while the callback naming the
> descriptor
> > > ++// runs, that descriptor must still be open.
> > > ++#ifndef _WIN32
> > > ++struct SockStateCloseOrderData {
> > > ++  size_t closes_seen;
> > > ++  size_t closed_while_already_shut;
> > > ++};
> > > ++
> > > ++static void SockStateCloseOrderCallback(void *data, ares_socket_t
> > socket_fd,
> > > ++                                        int readable, int writable)
> > > ++{
> > > ++  SockStateCloseOrderData *d =3D static_cast<SockStateCloseOrderDat=
a
> > *>(data);
> > > ++  if (readable || writable) {
> > > ++    return;
> > > ++  }
> > > ++  d->closes_seen++;
> > > ++  // F_GETFD on a closed descriptor fails with EBADF.  c-ares must
> not have
> > > ++  // closed it yet at this point.
> > > ++  if (fcntl(static_cast<int>(socket_fd), F_GETFD) =3D=3D -1 && errn=
o =3D=3D
> EBADF) {
> > > ++    d->closed_while_already_shut++;
> > > ++  }
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, SockStateCloseIsReportedBeforeDescriptorCloses)=
 {
> > > ++  SockStateCloseOrderData data;
> > > ++  ares_channel_t         *chan =3D nullptr;
> > > ++  struct ares_options     opts;
> > > ++
> > > ++  data.closes_seen               =3D 0;
> > > ++  data.closed_while_already_shut =3D 0;
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  opts.sock_state_cb      =3D SockStateCloseOrderCallback;
> > > ++  opts.sock_state_cb_data =3D &data;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_init_options(&chan, &opts, ARES_OPT_SOCK_STATE_CB)=
);
> > > ++  ASSERT_NE(nullptr, chan);
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,
> > "127.0.0.1:53055"));
> > > ++
> > > ++  QueryResult result;
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    QueryCallback, &result, NULL);
> > > ++  ares_destroy(chan);
> > > ++
> > > ++  EXPECT_GT(data.closes_seen, (size_t)0);
> > > ++  EXPECT_EQ((size_t)0, data.closed_while_already_shut)
> > > ++    << "the application was told to stop watching a descriptor
> c-ares had "
> > > ++       "already closed";
> > > ++}
> > > ++#endif
> > > ++
> > > ++// Reconfiguring the servers from an I/O hook frees the server and
> its
> > > ++// connection while the library is still holding both.  Deferred
> reclamation is
> > > ++// what makes these safe: the objects are unlinked from every looku=
p
> > structure
> > > ++// immediately, so nothing can find them, but their memory survives
> until the
> > > ++// outermost call unwinds.  Without it these are heap-use-after-fre=
e
> in
> > > ++// ares_conn_connect() and handle_conn_error() respectively.
> > > ++//
> > > ++// This is the class behind CVE-2025-31498 and CVE-2025-62408 -- a
> > connection
> > > ++// cleaned up while a caller further up the stack still held it.
> > > ++struct ReconfigureFromHookData {
> > > ++  ares_channel_t *channel;
> > > ++  bool            done;
> > > ++  int             status;
> > > ++};
> > > ++
> > > ++static int ReconfigureConfigureCallback(ares_socket_t fd, int type,
> void
> > *data)
> > > ++{
> > > ++  ReconfigureFromHookData *d =3D static_cast<ReconfigureFromHookDat=
a
> > *>(data);
> > > ++  (void)fd;
> > > ++  (void)type;
> > > ++  // Frees the server this connection is being opened for.
> > > ++  ares_set_servers_csv(d->channel, "127.0.0.1:53056");
> > > ++  return 0;
> > > ++}
> > > ++
> > > ++static void ReconfigureFromHookCallback(void *arg, ares_status_t
> status,
> > > ++                                        size_t
>  timeouts,
> > > ++                                        const ares_dns_record_t
> *dnsrec)
> > > ++{
> > > ++  ReconfigureFromHookData *d =3D static_cast<ReconfigureFromHookDat=
a
> > *>(arg);
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  d->done   =3D true;
> > > ++  d->status =3D static_cast<int>(status);
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, ReconfigureInConfigureHookNoUseAfterFree) {
> > > ++  ares_channel_t         *chan =3D nullptr;
> > > ++  struct ares_options     opts;
> > > ++  int                     optmask =3D 0;
> > > ++  ReconfigureFromHookData data;
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  opts.tries  =3D 1;
> > > ++  optmask    |=3D ARES_OPT_TRIES;
> > > ++  opts.flags  =3D ARES_FLAG_NOSEARCH;
> > > ++  optmask    |=3D ARES_OPT_FLAGS;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&chan, &opts,
> > optmask));
> > > ++  ASSERT_NE(nullptr, chan);
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,
> > "127.0.0.1:53055"));
> > > ++
> > > ++  data.channel =3D chan;
> > > ++  data.done    =3D false;
> > > ++  data.status  =3D ARES_SUCCESS;
> > > ++  ares_set_socket_configure_callback(chan,
> ReconfigureConfigureCallback,
> > &data);
> > > ++
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    ReconfigureFromHookCallback, &data, NULL);
> > > ++
> > > ++  // Must complete rather than be stranded -- every exit from the
> send path
> > > ++  // either enqueues the query or ends it.
> > > ++  EXPECT_TRUE(data.done);
> > > ++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++// The second route to the same freed connection, and the one that
> drove the
> > > ++// change from suppressing the idle sweep to deferring the
> notification:
> > > ++// reconfiguring the servers from the socket-state callback destroy=
s
> the server
> > > ++// and with it the connection ares_open_connection() is still
> using.  Nothing
> > > ++// covered this route, so a regression in it would have gone
> unnoticed.
> > > ++struct SockStateReconfigureData {
> > > ++  ares_channel_t *channel;
> > > ++  size_t          calls;
> > > ++};
> > > ++
> > > ++static void SockStateReconfigureCallback(void *data, ares_socket_t
> > socket_fd,
> > > ++                                         int readable, int writable=
)
> > > ++{
> > > ++  SockStateReconfigureData *d =3D
> > > ++    static_cast<SockStateReconfigureData *>(data);
> > > ++  (void)socket_fd;
> > > ++  (void)readable;
> > > ++  (void)writable;
> > > ++  d->calls++;
> > > ++  if (d->channel !=3D nullptr) {
> > > ++    // Destroys the server, and with it the connection being opened=
.
> > > ++    ares_set_servers_csv(d->channel, "127.0.0.1:53056");
> > > ++  }
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, ReconfigureInSockStateCallbackNoUseAfterFree) {
> > > ++  SockStateReconfigureData data;
> > > ++  ares_channel_t          *chan =3D nullptr;
> > > ++  struct ares_options      opts;
> > > ++
> > > ++  data.channel =3D nullptr;
> > > ++  data.calls   =3D 0;
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  opts.sock_state_cb      =3D SockStateReconfigureCallback;
> > > ++  opts.sock_state_cb_data =3D &data;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_init_options(&chan, &opts, ARES_OPT_SOCK_STATE_CB)=
);
> > > ++  ASSERT_NE(nullptr, chan);
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,
> > "127.0.0.1:53055"));
> > > ++
> > > ++  /* Armed only now, so channel setup itself does not reconfigure. =
*/
> > > ++  data.channel =3D chan;
> > > ++
> > > ++  QueryResult result;
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    QueryCallback, &result, NULL);
> > > ++
> > > ++  EXPECT_GT(data.calls, (size_t)0);
> > > ++
> > > ++  data.channel =3D nullptr; /* don't reconfigure from teardown
> notifications */
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++// Deferring the notifications must not lose them: every public
> entry point
> > > ++// that closes a socket still has to tell the application about it
> before it
> > > ++// returns, or an event loop is left polling a descriptor that
> c-ares closed.
> > > ++struct SockStateRecordData {
> > > ++  std::vector<std::pair<ares_socket_t, bool>> events; /* fd,
> still-armed */
> > > ++};
> > > ++
> > > ++static void SockStateRecordCallback(void *data, ares_socket_t
> socket_fd,
> > > ++                                    int readable, int writable)
> > > ++{
> > > ++  SockStateRecordData *d =3D static_cast<SockStateRecordData *>(dat=
a);
> > > ++  d->events.push_back(std::make_pair(socket_fd, readable ||
> writable));
> > > ++}
> > > ++
> > > ++static bool SawClose(const SockStateRecordData &d)
> > > ++{
> > > ++  for (size_t i =3D 0; i < d.events.size(); i++) {
> > > ++    if (!d.events[i].second) {
> > > ++      return true;
> > > ++    }
> > > ++  }
> > > ++  return false;
> > > ++}
> > > ++
> > > ++class SockStateDeliveryTest : public LibraryTest {
> > > ++protected:
> > > ++  void OpenConnection(ares_channel_t **chan, SockStateRecordData
> *data,
> > > ++                      QueryResult *result)
> > > ++  {
> > > ++    struct ares_options opts;
> > > ++    memset(&opts, 0, sizeof(opts));
> > > ++    opts.sock_state_cb      =3D SockStateRecordCallback;
> > > ++    opts.sock_state_cb_data =3D data;
> > > ++
> > > ++    ASSERT_EQ(ARES_SUCCESS,
> > > ++              ares_init_options(chan, &opts,
> ARES_OPT_SOCK_STATE_CB));
> > > ++    ASSERT_NE(nullptr, *chan);
> > > ++    /* TEST-NET-1, guaranteed not to answer, so the socket is still
> open when
> > > ++     * the call under test runs. */
> > > ++    ASSERT_EQ(ARES_SUCCESS, ares_set_servers_csv(*chan,
> > "192.0.2.1:53"));
> > > ++
> > > ++    ares_query_dnsrec(*chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                      QueryCallback, result, NULL);
> > > ++    ASSERT_FALSE(result->done_);
> > > ++    ASSERT_FALSE(data->events.empty());
> > > ++    ASSERT_TRUE(data->events.back().second); /* opened, armed for
> read */
> > > ++    data->events.clear();
> > > ++  }
> > > ++};
> > > ++
> > > ++TEST_F(SockStateDeliveryTest, CancelReportsSocketClose) {
> > > ++  ares_channel_t     *chan =3D nullptr;
> > > ++  SockStateRecordData data;
> > > ++  QueryResult         result;
> > > ++
> > > ++  OpenConnection(&chan, &data, &result);
> > > ++  ares_cancel(chan);
> > > ++  EXPECT_TRUE(SawClose(data)) << "ares_cancel() closed the socket
> > without "
> > > ++                                 "telling the application";
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++TEST_F(SockStateDeliveryTest, SetServersReportsSocketClose) {
> > > ++  ares_channel_t     *chan =3D nullptr;
> > > ++  SockStateRecordData data;
> > > ++  QueryResult         result;
> > > ++
> > > ++  OpenConnection(&chan, &data, &result);
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,
> > "198.51.100.1:53"));
> > > ++  EXPECT_TRUE(SawClose(data)) << "ares_set_servers_csv() closed the
> > socket "
> > > ++                                 "without telling the application";
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++TEST_F(SockStateDeliveryTest, DestroyReportsSocketClose) {
> > > ++  ares_channel_t     *chan =3D nullptr;
> > > ++  SockStateRecordData data;
> > > ++  QueryResult         result;
> > > ++
> > > ++  OpenConnection(&chan, &data, &result);
> > > ++  ares_destroy(chan);
> > > ++  EXPECT_TRUE(SawClose(data)) << "ares_destroy() closed the socket
> > without "
> > > ++                                 "telling the application";
> > > ++}
> > > ++
> > > ++// The server-state callback is dispatched from the middle of
> processing, and
> > > ++// every caller keeps using its query afterwards.  Nothing document=
s
> the
> > > ++// callback as non-reentrant, and the channel lock is recursive
> precisely so
> > > ++// API calls from callbacks are allowed -- so an application that
> cancels from
> > > ++// it left the library using a freed query.
> > > ++//
> > > ++// No hostile input is needed: an ordinary timeout reaches the same
> place.  A
> > > ++// SERVFAIL is used here because it is deterministic in the harness=
.
> > > ++struct ServerStateCancelData {
> > > ++  ares_channel_t *channel;
> > > ++  int             server_cb_calls;
> > > ++  bool            query_done;
> > > ++};
> > > ++
> > > ++static void ServerStateCancelCallback(const char *server_string,
> > > ++                                      ares_bool_t success, int flag=
s,
> > > ++                                      void *data) {
> > > ++  ServerStateCancelData *d =3D static_cast<ServerStateCancelData
> *>(data);
> > > ++  (void)server_string;
> > > ++  (void)success;
> > > ++  (void)flags;
> > > ++  d->server_cb_calls++;
> > > ++  // Reentrant cancel from the notification.
> > > ++  ares_cancel(d->channel);
> > > ++}
> > > ++
> > > ++static void ServerStateQueryCallback(void *arg, ares_status_t statu=
s,
> > > ++                                     size_t timeouts,
> > > ++                                     const ares_dns_record_t
> *dnsrec) {
> > > ++  ServerStateCancelData *d =3D static_cast<ServerStateCancelData
> *>(arg);
> > > ++  (void)status;
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  d->query_done =3D true;
> > > ++}
> > > ++
> > > ++// The advisory's headline claim is that no hostile input is needed=
,
> because an
> > > ++// ordinary timeout reaches the same place.  The SERVFAIL test belo=
w
> does
> > not
> > > ++// show that; this one does.
> > > ++class ServerStateTimeoutCancelTest
> > > ++  : public MockChannelOptsTest,
> > > ++    public ::testing::WithParamInterface<int> {
> > > ++ public:
> > > ++  ServerStateTimeoutCancelTest()
> > > ++    : MockChannelOptsTest(1, GetParam(), false, false,
> FillOptions(&opts_),
> > > ++                          ARES_OPT_TIMEOUTMS | ARES_OPT_TRIES) {}
> > > ++  static struct ares_options *FillOptions(struct ares_options *opts=
)
> {
> > > ++    memset(opts, 0, sizeof(struct ares_options));
> > > ++    opts->timeout =3D 100;
> > > ++    opts->tries   =3D 3;
> > > ++    return opts;
> > > ++  }
> > > ++
> > > ++ private:
> > > ++  struct ares_options opts_;
> > > ++};
> > > ++
> > > ++TEST_P(ServerStateTimeoutCancelTest,
> > CancelInServerStateCallbackOnTimeout) {
> > > ++  ServerStateCancelData data;
> > > ++  data.channel         =3D channel_;
> > > ++  data.server_cb_calls =3D 0;
> > > ++  data.query_done      =3D false;
> > > ++
> > > ++  ares_set_server_state_callback(channel_, ServerStateCancelCallbac=
k,
> > &data);
> > > ++
> > > ++  // No reply configured, so the query times out and the
> notification comes
> > > ++  // from process_timeouts() rather than from a response.
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel_, "www.google.com",
> ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A,
> ServerStateQueryCallback, &data,
> > > ++                              NULL));
> > > ++  Process();
> > > ++
> > > ++  EXPECT_GT(data.server_cb_calls, 0);
> > > ++  EXPECT_TRUE(data.query_done);
> > > ++}
> > > ++
> > > ++INSTANTIATE_TEST_SUITE_P(AddressFamilies,
> > ServerStateTimeoutCancelTest,
> > > ++                         ::testing::ValuesIn(ares::test::families),
> > > ++                         PrintFamily);
> > > ++
> > > ++// Unregistering with a NULL callback discards whatever is still
> queued -- the
> > > ++// documented behaviour of deferring delivery, and the only way an
> > application
> > > ++// can opt back out once notifications are in flight.
> > > ++struct ServerStateUnregisterData {
> > > ++  ares_channel_t *channel;
> > > ++  size_t          server_cb_calls;
> > > ++  bool            query_done;
> > > ++};
> > > ++
> > > ++static void ServerStateUnregisterCallback(const char *server_string=
,
> > > ++                                          ares_bool_t success,
> > > ++                                          int flags, void *user_dat=
a)
> > > ++{
> > > ++  ServerStateUnregisterData *d =3D
> > > ++    static_cast<ServerStateUnregisterData *>(user_data);
> > > ++  (void)server_string;
> > > ++  (void)success;
> > > ++  (void)flags;
> > > ++  d->server_cb_calls++;
> > > ++  // Clear ourselves from inside the first notification.  Any
> notification
> > > ++  // still queued behind this one must be dropped rather than
> delivered.
> > > ++  ares_set_server_state_callback(d->channel, NULL, NULL);
> > > ++}
> > > ++
> > > ++static void ServerStateUnregisterQueryCallback(void *arg,
> ares_status_t
> > status,
> > > ++                                               size_t timeouts,
> > > ++                                               const
> ares_dns_record_t *dnsrec)
> > > ++{
> > > ++  ServerStateUnregisterData *d =3D
> > > ++    static_cast<ServerStateUnregisterData *>(arg);
> > > ++  (void)status;
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  d->query_done =3D true;
> > > ++}
> > > ++
> > > ++TEST_P(ServerStateTimeoutCancelTest,
> > UnregisterInCallbackDiscardsQueued) {
> > > ++  ServerStateUnregisterData data;
> > > ++  data.channel         =3D channel_;
> > > ++  data.server_cb_calls =3D 0;
> > > ++  data.query_done      =3D false;
> > > ++
> > > ++  ares_set_server_state_callback(channel_,
> ServerStateUnregisterCallback,
> > > ++                                 &data);
> > > ++
> > > ++  // No reply configured: the query times out on every try, so more
> than one
> > > ++  // notification is queued before the flush point is reached.
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel_, "www.google.com",
> ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A,
> > > ++                              ServerStateUnregisterQueryCallback,
> &data, NULL));
> > > ++  Process();
> > > ++
> > > ++  EXPECT_EQ((size_t)1, data.server_cb_calls);
> > > ++  EXPECT_TRUE(data.query_done);
> > > ++}
> > > ++
> > > ++TEST_P(MockUDPChannelTest,
> > CancelInServerStateCallbackNoUseAfterFree) {
> > > ++  DNSPacket servfail;
> > > ++  servfail.set_response().set_aa().set_rcode(SERVFAIL)
> > > ++    .add_question(new DNSQuestion("www.google.com", T_A));
> > > ++  ON_CALL(server_, OnRequest("www.google.com", T_A))
> > > ++    .WillByDefault(SetReply(&server_, &servfail));
> > > ++
> > > ++  ServerStateCancelData data;
> > > ++  data.channel         =3D channel_;
> > > ++  data.server_cb_calls =3D 0;
> > > ++  data.query_done      =3D false;
> > > ++
> > > ++  ares_set_server_state_callback(channel_, ServerStateCancelCallbac=
k,
> > &data);
> > > ++
> > > ++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    ServerStateQueryCallback, &data, NULL);
> > > ++  Process();
> > > ++
> > > ++  EXPECT_GT(data.server_cb_calls, 0);
> > > ++  EXPECT_TRUE(data.query_done);
> > > ++}
> > > ++
> > > ++// The deferred requeue list records the target server as a raw
> pointer, and
> > > ++// the drain never revalidated it -- although it does revalidate th=
e
> query, by
> > > ++// qid, for exactly the same reason.  Application callbacks run fro=
m
> inside that
> > > ++// drain, and a callback may legally reconfigure the servers, which
> frees the
> > > ++// ones no longer in the list.  A later entry in the same drain the=
n
> dispatches
> > > ++// through a freed ares_server_t.
> > > ++//
> > > ++// Two replies must be read in one batch: an ordinary answer whose
> callback
> > > ++// reconfigures, and a FORMERR carrying no OPT record, which is wha=
t
> > makes
> > > ++// process_answer() queue a retry *to the same server* (the EDNS
> fallback --
> > > ++// the only site that records a server pointer at all).
> > > ++struct ReconfigureInCbData {
> > > ++  ares_channel_t *channel;
> > > ++  bool            done;
> > > ++};
> > > ++
> > > ++static void ReconfigureChannelCallback(void *arg, ares_status_t
> status,
> > > ++                                       size_t timeouts,
> > > ++                                       const ares_dns_record_t
> *dnsrec) {
> > > ++  ReconfigureInCbData *data =3D static_cast<ReconfigureInCbData
> *>(arg);
> > > ++  (void)status;
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  data->done =3D true;
> > > ++  /* Frees every server absent from the new configuration. */
> > > ++  ares_set_servers_csv(data->channel, "127.0.0.1:53055");
> > > ++}
> > > ++
> > > ++TEST_P(MockUDPChannelTest,
> > ReconfigureInCallbackStaleRequeueServer) {
> > > ++  DNSPacket okrsp;
> > > ++  okrsp.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("www.google.com", T_A))
> > > ++    .add_answer(new DNSARR("www.google.com", 100, {1, 2, 3, 4}));
> > > ++  ON_CALL(server_, OnRequest("www.google.com", T_A))
> > > ++    .WillByDefault(SetReply(&server_, &okrsp));
> > > ++
> > > ++  /* FORMERR with no OPT record: the server looks like it does not
> > understand
> > > ++   * EDNS, so the query is queued for retry to this same server. */
> > > ++  DNSPacket formerr;
> > > ++  formerr.set_response().set_aa().set_rcode(FORMERR)
> > > ++    .add_question(new DNSQuestion("www.example.com", T_A));
> > > ++  ON_CALL(server_, OnRequest("www.example.com", T_A))
> > > ++    .WillByDefault(SetReply(&server_, &formerr));
> > > ++
> > > ++  ReconfigureInCbData data;
> > > ++  data.channel =3D channel_;
> > > ++  data.done    =3D false;
> > > ++
> > > ++  QueryResult second;
> > > ++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    ReconfigureChannelCallback, &data, NULL);
> > > ++  ares_query_dnsrec(channel_, "www.example.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    QueryCallback, &second, NULL);
> > > ++
> > > ++  /* Both replies have to be consumed in a single pass so they shar=
e
> one
> > > ++   * deferred-requeue scope -- that is what puts the ENDQUERY entry
> whose
> > > ++   * callback reconfigures ahead of the REQUEUE entry holding a
> server
> > > ++   * pointer.  The usual Process() loop lets c-ares read between th=
e
> two, so
> > > ++   * they never share a batch; answer both first, then read once. *=
/
> > > ++  for (int i =3D 0; i < 4; i++) {
> > > ++    std::set<ares_socket_t> server_fds =3D fds();
> > > ++    fd_set                  r;
> > > ++    struct timeval          tv   =3D {0, 20000};
> > > ++    int                     nfds =3D 0;
> > > ++    FD_ZERO(&r);
> > > ++    for (ares_socket_t fd : server_fds) {
> > > ++      FD_SET(fd, &r);
> > > ++      if ((int)fd >=3D nfds) {
> > > ++        nfds =3D (int)fd + 1;
> > > ++      }
> > > ++    }
> > > ++    if (select(nfds, &r, nullptr, nullptr, &tv) <=3D 0) {
> > > ++      break;
> > > ++    }
> > > ++    for (ares_socket_t fd : server_fds) {
> > > ++      if (FD_ISSET(fd, &r)) {
> > > ++        ProcessFD(fd);
> > > ++      }
> > > ++    }
> > > ++  }
> > > ++  {
> > > ++    fd_set         readers;
> > > ++    fd_set         writers;
> > > ++    struct timeval tv =3D {0, 0};
> > > ++    int            nfds;
> > > ++    FD_ZERO(&readers);
> > > ++    FD_ZERO(&writers);
> > > ++    nfds =3D ares_fds(channel_, &readers, &writers);
> > > ++    select(nfds, &readers, &writers, nullptr, &tv);
> > > ++    ares_process(channel_, &readers, &writers);
> > > ++  }
> > > ++
> > > ++  EXPECT_TRUE(data.done);
> > > ++
> > > ++  /* With the fix the FORMERR query is correctly re-dispatched (to
> the newly
> > > ++   * configured, unreachable server) rather than going through a
> freed one, so
> > > ++   * it is still outstanding here.  Cancel it so its callback runs
> while its
> > > ++   * result object is still in scope. */
> > > ++  ares_cancel(channel_);
> > > ++  EXPECT_TRUE(second.done_);
> > > ++}
> > > ++
> > > ++// ares_servers_remove_stale() destroys each stale server in turn,
> and that
> > > ++// reaches application callbacks (ares_destroy_server() ->
> > ares_close_sockets()
> > > ++// -> ares_requeue_queries() -> end_query()).  A callback that
> reconfigures
> > the
> > > ++// servers again destroys the servers the outer loop has not visite=
d
> yet, so a
> > > ++// cached "next" node points at freed memory.
> > > ++struct NestedReconfigureData {
> > > ++  ares_channel_t *channel;
> > > ++  bool            nested;
> > > ++};
> > > ++
> > > ++static void NestedReconfigureCallback(void *arg, ares_status_t
> status,
> > > ++                                      size_t
>  timeouts,
> > > ++                                      const ares_dns_record_t
> *dnsrec) {
> > > ++  NestedReconfigureData *data =3D static_cast<NestedReconfigureData
> > *>(arg);
> > > ++  (void)status;
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  if (data->nested) {
> > > ++    return;
> > > ++  }
> > > ++  data->nested =3D true;
> > > ++  // Destroys the stale servers the outer removal loop has not
> reached yet.
> > > ++  ares_set_servers_csv(data->channel, "");
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, NestedReconfigureInCallbackRemoveStale) {
> > > ++  ares_channel_t     *channel =3D nullptr;
> > > ++  struct ares_options opts;
> > > ++  int                 optmask =3D 0;
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  /* One try per server, so tearing them down exhausts the query's
> retries and
> > > ++   * runs its callback from inside the removal loop. */
> > > ++  opts.tries  =3D 1;
> > > ++  optmask    |=3D ARES_OPT_TRIES;
> > > ++  opts.flags  =3D ARES_FLAG_NOSEARCH;
> > > ++  optmask    |=3D ARES_OPT_FLAGS;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&channel, &opts,
> > optmask));
> > > ++  /* Three servers, so the loop still has entries after destroying
> the first.
> > > ++   * Nothing listens on these ports; no traffic is needed. */
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_set_servers_csv(channel, "127.0.0.1:53101,
> 127.0.0.1:53102,"
> > > ++                                          "127.0.0.1:53103"));
> > > ++
> > > ++  NestedReconfigureData data;
> > > ++  data.channel =3D channel;
> > > ++  data.nested  =3D false;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel, "www.example.com",
> ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A,
> NestedReconfigureCallback,
> > > ++                              &data, NULL));
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel, ""));
> > > ++  EXPECT_TRUE(data.nested);
> > > ++
> > > ++  ares_destroy(channel);
> > > ++}
> > > ++
> > > ++// The same nesting, but the nested reconfiguration *installs* a
> server rather
> > > ++// than clearing the list.  Restarting the removal walk from the
> head then
> > > ++// re-judges that server against the outer call's list, decides it
> is stale and
> > > ++// deletes it -- so ares_set_servers_csv() returns success and
> leaves the
> > > ++// channel with no servers at all.  Memory-safe and still wrong.
> > > ++static void NestedReplaceCallback(void *arg, ares_status_t status,
> > > ++                                  size_t                   timeouts=
,
> > > ++                                  const ares_dns_record_t *dnsrec) =
{
> > > ++  NestedReconfigureData *data =3D static_cast<NestedReconfigureData
> > *>(arg);
> > > ++  (void)status;
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  if (data->nested) {
> > > ++    return;
> > > ++  }
> > > ++  data->nested =3D true;
> > > ++  // Installs a server the outer loop has never seen.
> > > ++  ares_set_servers_csv(data->channel, "127.0.0.1:53201");
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, NestedReconfigureInCallbackKeepsNestedServers) =
{
> > > ++  ares_channel_t     *channel =3D nullptr;
> > > ++  struct ares_options opts;
> > > ++  int                 optmask =3D 0;
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  opts.tries  =3D 1;
> > > ++  optmask    |=3D ARES_OPT_TRIES;
> > > ++  opts.flags  =3D ARES_FLAG_NOSEARCH;
> > > ++  optmask    |=3D ARES_OPT_FLAGS;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&channel, &opts,
> > optmask));
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel,
> > "127.0.0.1:53101"));
> > > ++
> > > ++  NestedReconfigureData data;
> > > ++  data.channel =3D channel;
> > > ++  data.nested  =3D false;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(channel, "www.example.com",
> ARES_CLASS_IN,
> > > ++                              ARES_REC_TYPE_A,
> NestedReplaceCallback, &data,
> > > ++                              NULL));
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel,
> > "127.0.0.1:53301"));
> > > ++  EXPECT_TRUE(data.nested);
> > > ++
> > > ++  // The nested call reconciled the whole list; what it installed
> must survive.
> > > ++  char *csv =3D ares_get_servers_csv(channel);
> > > ++  ASSERT_NE(nullptr, csv);
> > > ++  EXPECT_STREQ("127.0.0.1:53201", csv);
> > > ++  ares_free_string(csv);
> > > ++
> > > ++  ares_destroy(channel);
> > > ++}
> > > ++
> > > + TEST_P(MockUDPChannelTest, CancelInCallbackNoDoubleFree) {
> > > +   DNSPacket reply;
> > > +   reply.set_response().set_aa()
> > > +@@ -1940,6 +3007,7 @@ TEST_P(MockUDPChannelTest,
> > CancelInCallbackNoDoubleFree) {
> > > +   CancelInCbData data;
> > > +   data.channel =3D channel_;
> > > +   data.done    =3D false;
> > > ++  data.cbs     =3D 0;
> > > +   ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > +                     CancelChannelCallback, &data, NULL);
> > > +   Process();
> > > diff --git
> a/meta-oe/recipes-support/c-ares/c-ares/0002-Deliver-deferred-socket-
> > server-state-notifications.patch
> b/meta-oe/recipes-support/c-ares/c-ares/0002-
> > Deliver-deferred-socket-server-state-notifications.patch
> > > new file mode 100644
> > > index 0000000000..c34d3ab7c7
> > > --- /dev/null
> > > +++
> b/meta-oe/recipes-support/c-ares/c-ares/0002-Deliver-deferred-socket-
> > server-state-notifications.patch
> > > @@ -0,0 +1,393 @@
> > > +From f944c4718fd672c9c0befd65a340abb2ccfc1a31 Mon Sep 17 00:00:00
> > 2001
> > > +From: Brad House <brad@brad-house.com>
> > > +Date: Sun, 18 Oct 2026 20:28:11 -0400
> > > +Subject: [PATCH] Deliver deferred socket/server-state notifications
> only from
> > > + the outermost public call (#1340)
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +Backport of f023a52a (#1340) to v1.34.
> > > +
> > > +The recent change that queues socket-state and server-state
> > > +notifications delivers them, and runs the deferred cleanup, only fro=
m
> > > +the outermost `ares_deferred_cb_leave()`. `ares_send_nolock()`
> brackets
> > > +`ares_send_query()` itself, but most public lookup functions never
> > > +opened a region of their own. When reached from `ares_getaddrinfo()`=
,
> > > +`ares_query_dnsrec()` and similar, the bracket inside
> > > +`ares_send_nolock()` was therefore the outermost one. Notifications
> were
> > > +then delivered from inside an internal call while the library was
> still
> > > +in the middle of the public call, and its callers were still using
> their
> > > +lookup state (the host query, the query id out-pointer, ...). A
> > > +server-state callback that reconfigures the servers, which
> > > +`ares_set_server_state_callback(3)` documents as allowed, could end
> that
> > > +lookup before the caller was done with it.
> > > +
> > > +This is a regression in unreleased code. No released version is
> > > +affected.
> > > +
> > > +The outermost region is now opened by the public entry points
> > > +themselves, under the channel lock:
> > > +
> > > +- `ares_send_dnsrec()` (also used by `ares_send()`)
> > > +- `ares_query_dnsrec()` (also used by `ares_query()`)
> > > +- `ares_search()`, `ares_search_dnsrec()`
> > > +- `ares_getaddrinfo()` (also used by `ares_gethostbyname()`)
> > > +- `ares_gethostbyaddr()`, `ares_getnameinfo()`
> > > +- `ares_process_pending_write()`: a failed flush closes the connecti=
on
> > > +and fails its queries over, and this function had no bracket at all.
> > > +
> > > +`ares_process_fds()` (and through it
> > > +`ares_process()`/`ares_process_fd()`), `ares_cancel()`,
> `ares_destroy()`
> > > +and the server configuration functions already had their own. The
> nested
> > > +bracket in `ares_send_nolock()` stays, because it keeps connections
> and
> > > +servers unlinked during the send readable until the send returns.
> > > +Internal sends made from query callbacks (search next domain,
> > > +getaddrinfo next lookup, requeue, server probes) already run inside
> the
> > > +processing bracket.
> > > +
> > > +The comments on `ares_deferred_cb_enter()` and the flush now state t=
he
> > > +rule: the outermost region belongs to the public entry point, never =
to
> > > +an internal helper.
> > > +
> > > +The documented behaviour (notifications arrive before the outermost
> > > +c-ares call returns) does not change, so no man page changes.
> > > +
> > > +Two new `LibraryTest` cases in `test/ares-test-mock.cc`. The IPv6
> server
> > > +cannot get a socket, so the first send fails over to the IPv4 server=
,
> > > +and a server-state callback then reconfigures the servers:
> > > +
> > > +- `ServerFailoverDuringGetAddrInfo`: the lookup completes cleanly. I=
t
> > > +fails under ASAN without this change.
> > > +- `ServerFailoverDuringQuery`: the query id from `ares_query_dnsrec(=
)`
> > > +is already reported by the time the query callback runs. It fails
> > > +without this change.
> > > +
> > > +The full non-live suite passes under ASAN/UBSAN and with
> > > +`-DCARES_WERROR=3DON`.
> > > +
> > > +Signed-off-by: Brad House <brad@brad-house.com>
> > > +Upstream-Status: Backport [https://github.com/c-ares/c-
> > ares/commit/f944c4718fd672c9c0befd65a340abb2ccfc1a31]
> > > +GHSA: GHSA-wpr3-8q3r-4q8c, GHSA-97vq-4mxv-7vhm, GHSA-mw23-pfg6-
> > 2x9r, GHSA-rf6g-ww74-97qh, GHSA-v33j-65h4-4ch8, GHSA-pj7p-v3cw-hq66
> > > +---
> > > + src/lib/ares_conn.c          |   4 +-
> > > + src/lib/ares_getaddrinfo.c   |   5 ++
> > > + src/lib/ares_gethostbyaddr.c |   5 ++
> > > + src/lib/ares_getnameinfo.c   |   5 ++
> > > + src/lib/ares_private.h       |  10 ++++
> > > + src/lib/ares_process.c       |   6 ++
> > > + src/lib/ares_query.c         |   5 ++
> > > + src/lib/ares_search.c        |  10 ++++
> > > + src/lib/ares_send.c          |  13 ++++-
> > > + test/ares-test-mock.cc       | 106
> +++++++++++++++++++++++++++++++++++
> > > + 10 files changed, 166 insertions(+), 3 deletions(-)
> > > +
> > > +diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c
> > > +index 78f57e7d10..4cc0d1871d 100644
> > > +--- a/src/lib/ares_conn.c
> > > ++++ b/src/lib/ares_conn.c
> > > +@@ -94,7 +94,9 @@ static void ares_deferred_cb_flush(ares_channel_t
> > *channel)
> > > + {
> > > +   /* Only the outermost frame delivers: anything above us on the
> stack may
> > > +    * still be holding the connection a reentrant call from one of
> these
> > > +-   * callbacks could free.
> > > ++   * callbacks could free, or lookup state of its own that a
> callback could
> > > ++   * end.  That is why the outermost frame belongs to the public
> entry point
> > > ++   * and never to an internal helper; see ares_deferred_cb_enter().
> > > +    *
> > > +    * The dispatch below counts as a nesting level of its own.
> Without that, a
> > > +    * callback that calls back into the library re-enters here
> through the
> > > +diff --git a/src/lib/ares_getaddrinfo.c b/src/lib/ares_getaddrinfo.c
> > > +index 6d9e21af4b..5d9ddb311e 100644
> > > +--- a/src/lib/ares_getaddrinfo.c
> > > ++++ b/src/lib/ares_getaddrinfo.c
> > > +@@ -762,7 +762,12 @@ void ares_getaddrinfo(ares_channel_t *channel,
> > const char *name,
> > > +     return;
> > > +   }
> > > +   ares_channel_lock(channel);
> > > ++  /* Notifications raised along the way are delivered once this
> whole call
> > > ++   * has unwound, not from inside the internals it runs.  See
> > > ++   * ares_deferred_cb_enter(). */
> > > ++  ares_deferred_cb_enter(channel);
> > > +   ares_getaddrinfo_int(channel, name, service, hints, callback, arg=
);
> > > ++  ares_deferred_cb_leave(channel);
> > > +   ares_channel_unlock(channel);
> > > + }
> > > +
> > > +diff --git a/src/lib/ares_gethostbyaddr.c
> b/src/lib/ares_gethostbyaddr.c
> > > +index 69c509ab11..b314359331 100644
> > > +--- a/src/lib/ares_gethostbyaddr.c
> > > ++++ b/src/lib/ares_gethostbyaddr.c
> > > +@@ -112,7 +112,12 @@ void ares_gethostbyaddr(ares_channel_t *channel=
,
> > const void *addr, int addrlen,
> > > +     return;
> > > +   }
> > > +   ares_channel_lock(channel);
> > > ++  /* Notifications raised along the way are delivered once this
> whole call
> > > ++   * has unwound, not from inside the internals it runs.  See
> > > ++   * ares_deferred_cb_enter(). */
> > > ++  ares_deferred_cb_enter(channel);
> > > +   ares_gethostbyaddr_nolock(channel, addr, addrlen, family,
> callback, arg);
> > > ++  ares_deferred_cb_leave(channel);
> > > +   ares_channel_unlock(channel);
> > > + }
> > > +
> > > +diff --git a/src/lib/ares_getnameinfo.c b/src/lib/ares_getnameinfo.c
> > > +index 0159354530..7365e9ed82 100644
> > > +--- a/src/lib/ares_getnameinfo.c
> > > ++++ b/src/lib/ares_getnameinfo.c
> > > +@@ -194,7 +194,12 @@ void ares_getnameinfo(ares_channel_t *channel,
> > const struct sockaddr *sa,
> > > +   }
> > > +
> > > +   ares_channel_lock(channel);
> > > ++  /* Notifications raised along the way are delivered once this
> whole call
> > > ++   * has unwound, not from inside the internals it runs.  See
> > > ++   * ares_deferred_cb_enter(). */
> > > ++  ares_deferred_cb_enter(channel);
> > > +   ares_getnameinfo_int(channel, sa, salen, flags_int, callback, arg=
);
> > > ++  ares_deferred_cb_leave(channel);
> > > +   ares_channel_unlock(channel);
> > > + }
> > > +
> > > +diff --git a/src/lib/ares_private.h b/src/lib/ares_private.h
> > > +index 0a1029e0f8..9610ba7dab 100644
> > > +--- a/src/lib/ares_private.h
> > > ++++ b/src/lib/ares_private.h
> > > +@@ -676,6 +676,16 @@ void          ares_server_reap(ares_server_t
> *server);
> > > +  *  Nesting is counted; queued notifications are delivered by the
> outermost
> > > +  *  leave.
> > > +  *
> > > ++ *  The outermost region must be opened by the public entry point
> itself
> > > ++ *  (ares_send_dnsrec(), ares_query_dnsrec(), ares_search(),
> > ares_getaddrinfo(),
> > > ++ *  ares_process_fds(), ares_set_servers_*(), ...), with the channe=
l
> lock
> > > ++ *  held, around everything it does.  Internal helpers such as
> > > ++ *  ares_send_nolock() open nested regions of their own, but their
> callers
> > > ++ *  often keep using lookup state afterwards -- a host or search
> query, a
> > > ++ *  query id out-pointer -- that a callback reentering the library
> may end
> > > ++ *  and free.  If such a helper were the outermost region, its leav=
e
> would
> > > ++ *  run the callbacks while that state is still in use.
> > > ++ *
> > > +  *  \param[in] channel  Initialized ares channel.
> > > +  */
> > > + void          ares_deferred_cb_enter(ares_channel_t *channel);
> > > +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
> > > +index 82f53610fb..1569408b1b 100644
> > > +--- a/src/lib/ares_process.c
> > > ++++ b/src/lib/ares_process.c
> > > +@@ -490,6 +490,11 @@ void ares_process_pending_write(ares_channel_t
> > *channel)
> > > +     return;
> > > +   }
> > > +
> > > ++  /* A failed flush closes the connection and fails its queries
> over, which
> > > ++   * notifies.  Deliver once we are done walking the servers, and
> keep
> > > ++   * anything unlinked meanwhile readable until then. */
> > > ++  ares_deferred_cb_enter(channel);
> > > ++
> > > +   /* Set as untriggerd before calling into ares_conn_flush(), this =
is
> > > +    * because its possible ares_conn_flush() might cause additional
> data to
> > > +    * be enqueued if there is some form of exception so it will need
> to recurse.
> > > +@@ -513,6 +518,7 @@ void ares_process_pending_write(ares_channel_t
> > *channel)
> > > +     }
> > > +   }
> > > +
> > > ++  ares_deferred_cb_leave(channel);
> > > +   ares_channel_unlock(channel);
> > > + }
> > > +
> > > +diff --git a/src/lib/ares_query.c b/src/lib/ares_query.c
> > > +index ca3b6a9b73..0cf7f70760 100644
> > > +--- a/src/lib/ares_query.c
> > > ++++ b/src/lib/ares_query.c
> > > +@@ -125,7 +125,12 @@ ares_status_t ares_query_dnsrec(ares_channel_t
> > *channel, const char *name,
> > > +   }
> > > +
> > > +   ares_channel_lock(channel);
> > > ++  /* Notifications raised along the way are delivered once this
> whole call
> > > ++   * has unwound, not from inside the internals it runs.  See
> > > ++   * ares_deferred_cb_enter(). */
> > > ++  ares_deferred_cb_enter(channel);
> > > +   status =3D ares_query_nolock(channel, name, dnsclass, type,
> callback, arg,
> > qid);
> > > ++  ares_deferred_cb_leave(channel);
> > > +   ares_channel_unlock(channel);
> > > +   return status;
> > > + }
> > > +diff --git a/src/lib/ares_search.c b/src/lib/ares_search.c
> > > +index c605caf42c..ebc3d91e20 100644
> > > +--- a/src/lib/ares_search.c
> > > ++++ b/src/lib/ares_search.c
> > > +@@ -463,7 +463,12 @@ void ares_search(ares_channel_t *channel, const
> > char *name, int dnsclass,
> > > +   }
> > > +
> > > +   ares_channel_lock(channel);
> > > ++  /* Notifications raised along the way are delivered once this
> whole call
> > > ++   * has unwound, not from inside the internals it runs.  See
> > > ++   * ares_deferred_cb_enter(). */
> > > ++  ares_deferred_cb_enter(channel);
> > > +   ares_search_int(channel, dnsrec, ares_dnsrec_convert_cb, carg);
> > > ++  ares_deferred_cb_leave(channel);
> > > +   ares_channel_unlock(channel);
> > > +
> > > +   ares_dns_record_destroy(dnsrec);
> > > +@@ -481,7 +486,12 @@ ares_status_t ares_search_dnsrec(ares_channel_t
> > *channel,
> > > +   }
> > > +
> > > +   ares_channel_lock(channel);
> > > ++  /* Notifications raised along the way are delivered once this
> whole call
> > > ++   * has unwound, not from inside the internals it runs.  See
> > > ++   * ares_deferred_cb_enter(). */
> > > ++  ares_deferred_cb_enter(channel);
> > > +   status =3D ares_search_int(channel, dnsrec, callback, arg);
> > > ++  ares_deferred_cb_leave(channel);
> > > +   ares_channel_unlock(channel);
> > > +
> > > +   return status;
> > > +diff --git a/src/lib/ares_send.c b/src/lib/ares_send.c
> > > +index 2e0482bf19..dd4a28544b 100644
> > > +--- a/src/lib/ares_send.c
> > > ++++ b/src/lib/ares_send.c
> > > +@@ -246,8 +246,12 @@ ares_status_t ares_send_nolock(ares_channel_t
> > *channel, ares_server_t *server,
> > > +   /* Perform the first query action. */
> > > +
> > > +   /* Sending opens and writes to connections and can mark a server
> down,
> > both
> > > +-   * of which notify.  Deliver those once we are done with the
> connection and
> > > +-   * the server, not part-way through. */
> > > ++   * of which notify.  This bracket keeps any connection or server
> unlinked
> > > ++   * during the send readable until it returns.  It is never the
> outermost
> > > ++   * one: every public entry point that can get here, and query
> processing,
> > > ++   * holds its own, so delivery waits until the caller -- which may
> still be
> > > ++   * holding its own lookup state, as ares_getaddrinfo() does -- ha=
s
> unwound
> > > ++   * too. */
> > > +   ares_deferred_cb_enter(channel);
> > > +   status =3D ares_send_query(server, query, &now);
> > > +   ares_deferred_cb_leave(channel);
> > > +@@ -271,9 +275,14 @@ ares_status_t ares_send_dnsrec(ares_channel_t
> > *channel,
> > > +   }
> > > +
> > > +   ares_channel_lock(channel);
> > > ++  /* Notifications raised along the way are delivered once this
> whole call
> > > ++   * has unwound, not from inside the internals it runs.  See
> > > ++   * ares_deferred_cb_enter(). */
> > > ++  ares_deferred_cb_enter(channel);
> > > +
> > > +   status =3D ares_send_nolock(channel, NULL, 0, dnsrec, callback, a=
rg,
> qid);
> > > +
> > > ++  ares_deferred_cb_leave(channel);
> > > +   ares_channel_unlock(channel);
> > > +
> > > +   return status;
> > > +diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc
> > > +index 2158c5a913..b848c02434 100644
> > > +--- a/test/ares-test-mock.cc
> > > ++++ b/test/ares-test-mock.cc
> > > +@@ -2533,6 +2533,112 @@ TEST_F(LibraryTest,
> > ReconfigureInSockStateCallbackNoUseAfterFree) {
> > > +   data.channel =3D nullptr; /* don't reconfigure from teardown
> notifications */
> > > +   ares_destroy(chan);
> > > + }
> > > ++// Server-state notifications raised while a public call is issuing
> its first
> > > ++// request must not be delivered until that whole call has unwound.
> A
> > > ++// failover handler that reconfigures the servers ends the in-fligh=
t
> request,
> > > ++// and with it the state the issuing call still has to finish with.
> The IPv6
> > > ++// server cannot get a socket, so the first send fails over to the
> IPv4 one
> > > ++// and queues a failure notification for the handler below.
> > > ++static ares_socket_t FailoverNoIPv6Socket(int af, int type, int
> protocol,
> > > ++                                          void *user_data)
> > > ++{
> > > ++  (void)user_data;
> > > ++  if (af =3D=3D AF_INET6) {
> > > ++    return ARES_SOCKET_BAD;
> > > ++  }
> > > ++  return socket(af, type, protocol);
> > > ++}
> > > ++
> > > ++static void FailoverOnServerDown(const char *server_string,
> ares_bool_t
> > success,
> > > ++                                 int flags, void *data)
> > > ++{
> > > ++  (void)server_string;
> > > ++  (void)flags;
> > > ++  if (!success) {
> > > ++    ares_set_servers_csv(static_cast<ares_channel_t *>(data),
> > > ++                         "127.0.0.1:53063");
> > > ++  }
> > > ++}
> > > ++
> > > ++static ares_channel_t *FailoverChannel(ares_socket_functions *funcs=
)
> > > ++{
> > > ++  ares_channel_t     *chan =3D nullptr;
> > > ++  struct ares_options opts;
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  opts.tries =3D 1;
> > > ++  opts.flags =3D ARES_FLAG_NOSEARCH;
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_init_options(&chan, &opts, ARES_OPT_TRIES |
> > ARES_OPT_FLAGS));
> > > ++  if (chan =3D=3D nullptr) {
> > > ++    return nullptr;
> > > ++  }
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_set_servers_csv(chan, "[::1]:53061,127.0.0.1:53062
> "));
> > > ++  ares_set_server_state_callback(chan, FailoverOnServerDown, chan);
> > > ++
> > > ++  memset(funcs, 0, sizeof(*funcs));
> > > ++  funcs->asocket =3D FailoverNoIPv6Socket;
> > > ++  ares_set_socket_functions(chan, funcs, NULL);
> > > ++  return chan;
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, ServerFailoverDuringGetAddrInfo) {
> > > ++  ares_socket_functions      funcs;
> > > ++  struct ares_addrinfo_hints hints;
> > > ++  AddrInfoResult             result;
> > > ++  ares_channel_t            *chan =3D FailoverChannel(&funcs);
> > > ++  ASSERT_NE(nullptr, chan);
> > > ++
> > > ++  memset(&hints, 0, sizeof(hints));
> > > ++  hints.ai_family =3D AF_INET;
> > > ++  ares_getaddrinfo(chan, "www.google.com", NULL, &hints,
> AddrInfoCallback,
> > > ++                   &result);
> > > ++
> > > ++  ares_cancel(chan);
> > > ++  EXPECT_TRUE(result.done_);
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++// Same, through ares_query_dnsrec(): the query id must already hav=
e
> been
> > > ++// reported to the caller by the time the query can complete.
> > > ++struct FailoverQueryData {
> > > ++  unsigned short qid;
> > > ++  unsigned short qid_at_callback;
> > > ++  bool           done;
> > > ++};
> > > ++
> > > ++static void FailoverQueryCallback(void *data, ares_status_t status,
> > > ++                                  size_t                   timeouts=
,
> > > ++                                  const ares_dns_record_t *dnsrec)
> > > ++{
> > > ++  FailoverQueryData *d =3D static_cast<FailoverQueryData *>(data);
> > > ++  (void)status;
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  d->qid_at_callback =3D d->qid;
> > > ++  d->done            =3D true;
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, ServerFailoverDuringQuery) {
> > > ++  ares_socket_functions funcs;
> > > ++  FailoverQueryData     data;
> > > ++  ares_channel_t       *chan =3D FailoverChannel(&funcs);
> > > ++  ASSERT_NE(nullptr, chan);
> > > ++
> > > ++  data.qid             =3D 0;
> > > ++  data.qid_at_callback =3D 0;
> > > ++  data.done            =3D false;
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN=
,
> > > ++                              ARES_REC_TYPE_A,
> FailoverQueryCallback, &data,
> > > ++                              &data.qid));
> > > ++
> > > ++  EXPECT_TRUE(data.done);
> > > ++  EXPECT_EQ(data.qid, data.qid_at_callback);
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > +
> > > + // Deferring the notifications must not lose them: every public
> entry point
> > > + // that closes a socket still has to tell the application about it
> before it
> > > diff --git
> a/meta-oe/recipes-support/c-ares/c-ares/0003-ares_qcache-hand-
> > callbacks-their-own-copy.patch
> b/meta-oe/recipes-support/c-ares/c-ares/0003-
> > ares_qcache-hand-callbacks-their-own-copy.patch
> > > new file mode 100644
> > > index 0000000000..02039e92e0
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/c-ares/c-ares/0003-ares_qcache-hand-
> > callbacks-their-own-copy.patch
> > > @@ -0,0 +1,1054 @@
> > > +From a21160045f9d7039225fa285be7cb1b02173a3a5 Mon Sep 17 00:00:00
> > 2001
> > > +From: Brad House <brad@brad-house.com>
> > > +Date: Sun, 18 Oct 2026 22:12:09 -0400
> > > +Subject: [PATCH] [Backport v1.34] ares_qcache: hand callbacks their
> own
> > copy
> > > + of a cached answer (#1339)
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +Backport of 31e2f51e8715d418fa8272a6c3a1ee651917fec5 (`ares_qcache:
> > hand
> > > +callbacks their own copy of a cached answer`) to `v1.34`. See that
> > > +commit for the full description.
> > > +
> > > +**Conflicts:**
> > > +- `ares_private.h`: alignment only; formatted with `v1.34`'s
> > > +`.clang-format`.
> > > +- `test/ares-test-internal.cc`: context only =E2=80=94 on `main` the=
 new
> > > +`QcacheKeyDistinguishesQuestions` test follows the IDNA/punycode tes=
ts
> > > +(#1031), which are not on `v1.34`, so it is placed after the URI tes=
t
> > > +instead.
> > > +
> > > +**Test fixes from #1334:** carries the part of #1334 that applies to
> the
> > > +tests this introduces =E2=80=94 `ReentrantFlushInCallbackNoUseAfterF=
ree`
> > > +reconfigures to `127.0.0.1:53055` instead of `127.0.0.55` (only
> routable
> > > +on Linux), and `UnknownQueryTypesDoNotShareCacheEntries` drops
> > > +`static_cast<ns_type>`, which does not compile on OpenBSD.
> > > +
> > > +Test file contents match `main`. Independent of the dd62bdfc backpor=
t
> > > +(#1338); applies cleanly with or without it.
> > > +
> > > +The full non-live suite passes 650/650 under ASAN+UBSAN and with
> > > +`-DCARES_WERROR=3DON` on macOS.
> > `ReentrantFlushInCallbackNoUseAfterFree`
> > > +is a heap-use-after-free in `ares_dns_record_rr_cnt()` on `v1.34`
> > > +without this change, and passes with it.
> > > +
> > > +Signed-off-by: Brad House <brad@brad-house.com>
> > > +Upstream-Status: Backport [https://github.com/c-ares/c-
> > ares/commit/a21160045f9d7039225fa285be7cb1b02173a3a5]
> > > +GHSA: GHSA-grv7-fq5q-9vfc, GHSA-wrgc-prmw-27xh
> > > +---
> > > + docs/ares_init_options.3   |  11 +-
> > > + src/lib/ares_private.h     |  44 +++-
> > > + src/lib/ares_process.c     |   1 +
> > > + src/lib/ares_qcache.c      | 212 ++++++++++++++++---
> > > + src/lib/ares_send.c        |  47 ++++-
> > > + test/ares-test-internal.cc |  54 +++++
> > > + test/ares-test-mock.cc     | 419
> +++++++++++++++++++++++++++++++++++++
> > > + 7 files changed, 743 insertions(+), 45 deletions(-)
> > > +
> > > +diff --git a/docs/ares_init_options.3 b/docs/ares_init_options.3
> > > +index e6f6ee8ba6..1ce7fb8e30 100644
> > > +--- a/docs/ares_init_options.3
> > > ++++ b/docs/ares_init_options.3
> > > +@@ -324,7 +324,16 @@ with the maximum number of seconds a query resu=
lt
> > may be cached which will
> > > + override a larger TTL in the response message. This must be a
> non-zero
> > value
> > > + otherwise the cache will be disabled. Choose a reasonable value for
> your
> > > + application such as 300 (5 minutes) or 3600 (1 hour).  The query
> cache is
> > > +-automatically flushed if a server configuration change is made.
> > > ++automatically flushed if a server configuration change is made.  As
> of c-ares
> > > ++1.35.0, and c-ares 1.34.9 on the 1.34 branch, a cached answer
> reports its
> > > ++remaining time to live rather than the
> > > ++original value received from the server, so TTLs returned on a cach=
e
> hit
> > > ++decrease as the entry ages.  Two lookups share a cached answer only
> if their
> > > ++EDNS state matches: the version, the flag bits including DNSSEC OK,
> and
> > every
> > > ++EDNS option other than the DNS cookie and the advertised UDP payloa=
d
> > size,
> > > ++which are both ignored.  Options are compared in the order the
> application
> > > ++added them.  An application that attaches its own options and varie=
s
> them
> > > ++between otherwise identical lookups gets a separate cache entry for
> each.
> > > + .br
> > > + .TP 18
> > > + .B ARES_OPT_EVENT_THREAD
> > > +diff --git a/src/lib/ares_private.h b/src/lib/ares_private.h
> > > +index 9610ba7dab..dd06d303b8 100644
> > > +--- a/src/lib/ares_private.h
> > > ++++ b/src/lib/ares_private.h
> > > +@@ -153,6 +153,9 @@ struct ares_query {
> > > +   ares_timeval_t       ts; /*!< Timestamp query was sent */
> > > +   ares_timeval_t       timeout;
> > > +   ares_channel_t      *channel;
> > > ++  /*! Query cache key, derived from the caller's request before the
> send path
> > > ++   *  can mutate query->query.  NULL when the cache is disabled. */
> > > ++  char                *qcache_key;
> > > +
> > > +   /*
> > > +    * Node object for each list entry the query belongs to in order =
to
> > > +@@ -718,14 +721,47 @@ ares_status_t
> > ares_qcache_create(ares_rand_state *rand_state,
> > > +                                  unsigned int     max_ttl,
> > > +                                  ares_qcache_t  **cache_out);
> > > + void          ares_qcache_flush(ares_qcache_t *cache);
> > > ++/*! Derive the query cache key for a request.  Caller owns the
> result.
> > > ++ *
> > > ++ *  \param[in] dnsrec  Request to derive the key from.
> > > ++ *  \return allocated key, or NULL on failure.
> > > ++ */
> > > ++char         *ares_qcache_calc_key(const ares_dns_record_t *dnsrec)=
;
> > > ++
> > > ++/*! Insert a response into the query cache.
> > > ++ *
> > > ++ *  \param[in] channel  Initialized channel object.
> > > ++ *  \param[in] now      Current timestamp.
> > > ++ *  \param[in] query    Query the response answers.  Its cache key,
> derived
> > > ++ *                      when the query was created, becomes the
> entry key; a
> > > ++ *                      NULL key means caching is switched off.
> > > ++ *  \param[in] dnsrec   Response to cache.  Duplicated internally;
> the caller
> > > ++ *                      retains ownership.
> > > ++ *  \return ARES_SUCCESS if cached, ARES_ENOTIMP if caching is off =
or
> > the
> > > ++ *          response is not cacheable, otherwise another status.
> > > ++ */
> > > + ares_status_t ares_qcache_insert(ares_channel_t          *channel,
> > > +                                  const ares_timeval_t    *now,
> > > +                                  const ares_query_t      *query,
> > > +                                  const ares_dns_record_t *dnsrec);
> > > +-ares_status_t ares_qcache_fetch(ares_channel_t           *channel,
> > > +-                                const ares_timeval_t     *now,
> > > +-                                const ares_dns_record_t  *dnsrec,
> > > +-                                const ares_dns_record_t
> **dnsrec_resp);
> > > ++/*! Fetch a cached answer for a request.
> > > ++ *
> > > ++ *  \param[in]  channel      Initialized channel object.
> > > ++ *  \param[in]  now          Current timestamp.
> > > ++ *  \param[in]  key          Cache key for the request, as produced
> by
> > > ++ *                           ares_qcache_calc_key().  Owned by the
> caller.
> > > ++ *  \param[out] dnsrec_resp  On ARES_SUCCESS, the cached answer,
> > owned by the
> > > ++ *                           caller and destroyed with
> > > ++ *                           ares_dns_record_destroy().  Set to NUL=
L
> on any
> > > ++ *                           other status, except ARES_EFORMERR,
> which is
> > > ++ *                           returned by the argument check before
> this is
> > > ++ *                           touched.
> > > ++ *  \return ARES_SUCCESS on a hit, ARES_ENOTFOUND on a miss,
> > ARES_EFORMERR on
> > > ++ *          invalid arguments.
> > > ++ */
> > > ++ares_status_t ares_qcache_fetch(ares_channel_t       *channel,
> > > ++                                const ares_timeval_t *now, const
> char *key,
> > > ++                                ares_dns_record_t **dnsrec_resp);
> > > +
> > > + void   ares_metrics_record(const ares_query_t *query, ares_server_t
> *server,
> > > +                            ares_status_t status, const
> ares_dns_record_t *dnsrec);
> > > +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
> > > +index 1569408b1b..88536704ad 100644
> > > +--- a/src/lib/ares_process.c
> > > ++++ b/src/lib/ares_process.c
> > > +@@ -1859,6 +1859,7 @@ void ares_free_query(ares_query_t *query)
> > > +   query->arg      =3D NULL;
> > > +   /* Deallocate the memory associated with the query */
> > > +   ares_dns_record_destroy(query->query);
> > > ++  ares_free(query->qcache_key);
> > > +
> > > +   ares_free(query);
> > > + }
> > > +diff --git a/src/lib/ares_qcache.c b/src/lib/ares_qcache.c
> > > +index ad3bc83505..f48669b56c 100644
> > > +--- a/src/lib/ares_qcache.c
> > > ++++ b/src/lib/ares_qcache.c
> > > +@@ -38,7 +38,7 @@ typedef struct {
> > > +   time_t             insert_ts;
> > > + } ares_qcache_entry_t;
> > > +
> > > +-static char *ares_qcache_calc_key(const ares_dns_record_t *dnsrec)
> > > ++char *ares_qcache_calc_key(const ares_dns_record_t *dnsrec)
> > > + {
> > > +   ares_buf_t      *buf =3D ares_buf_create();
> > > +   size_t           i;
> > > +@@ -49,7 +49,22 @@ static char *ares_qcache_calc_key(const
> > ares_dns_record_t *dnsrec)
> > > +     return NULL; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > +   }
> > > +
> > > +-  /* Format is OPCODE|FLAGS[|QTYPE1|QCLASS1|QNAME1]... */
> > > ++  /* Format is
> > > ++   *
> > OPCODE|FLAGS[|EDNS|VER|FLAGS[|ID:HEX]...]|QDCOUNT[|TYPE|CLASS|LEN:
> > QNAME]...
> > > ++   *
> > > ++   * The EDNS section matters: an answer fetched under one set of
> EDNS
> > options
> > > ++   * is not interchangeable with one fetched under another.  A
> request with no
> > > ++   * OPT record appends nothing; note that EDNS is on by default, s=
o
> ordinary
> > > ++   * lookups do carry one and their keys did change with this.
> > > ++   *
> > > ++   * Everything a caller does not control is emitted before the
> questions, so
> > > ++   * the names are always last.  A name reaches the key unescaped, =
so
> > anything
> > > ++   * keyed after it could otherwise be imitated by a name containin=
g
> that same
> > > ++   * text, giving two different requests one key.  The question
> count is part
> > > ++   * of that: without it, a request with two questions and a reques=
t
> with one
> > > ++   * whose name spells out the second produce identical keys.  Each
> name is
> > > ++   * also length-prefixed, so adjacent names cannot be made to run
> together
> > > ++   * even when the question counts match. */
> > > +
> > > +   status =3D ares_buf_append_str(
> > > +     buf, ares_dns_opcode_tostr(ares_dns_record_get_opcode(dnsrec)))=
;
> > > +@@ -63,7 +78,11 @@ static char *ares_qcache_calc_key(const
> > ares_dns_record_t *dnsrec)
> > > +   }
> > > +
> > > +   flags =3D ares_dns_record_get_flags(dnsrec);
> > > +-  /* Only care about RD and CD */
> > > ++  /* RD, CD and AD.  AD is here because RFC 6840 section 5.7 define=
s
> it in a
> > > ++   * request as a signal that the requester wants the AD bit
> evaluated in the
> > > ++   * response, and section 5.8 says a validating resolver should
> only set AD
> > > ++   * in a response when the request carried DO or AD -- so an answe=
r
> fetched
> > > ++   * without it can legitimately differ from one fetched with it. *=
/
> > > +   if (flags & ARES_FLAG_RD) {
> > > +     status =3D ares_buf_append_str(buf, "rd");
> > > +     if (status !=3D ARES_SUCCESS) {
> > > +@@ -76,6 +95,95 @@ static char *ares_qcache_calc_key(const
> > ares_dns_record_t *dnsrec)
> > > +       goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > +     }
> > > +   }
> > > ++  if (flags & ARES_FLAG_AD) {
> > > ++    status =3D ares_buf_append_str(buf, "ad");
> > > ++    if (status !=3D ARES_SUCCESS) {
> > > ++      goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++    }
> > > ++  }
> > > ++
> > > ++  /* EDNS state.  Skipped entirely when the request carries no OPT
> record. */
> > > ++  {
> > > ++    const ares_dns_rr_t *opt =3D ares_dns_get_opt_rr_const(dnsrec);
> > > ++
> > > ++    if (opt !=3D NULL) {
> > > ++      size_t opt_cnt =3D ares_dns_rr_get_opt_cnt(opt,
> > ARES_RR_OPT_OPTIONS);
> > > ++      size_t j;
> > > ++
> > > ++      status =3D ares_buf_append_str(buf, "|EDNS|");
> > > ++      if (status !=3D ARES_SUCCESS) {
> > > ++        goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++      }
> > > ++      status =3D ares_buf_append_num_hex(
> > > ++        buf, ares_dns_rr_get_u8(opt, ARES_RR_OPT_VERSION), 0);
> > > ++      if (status !=3D ARES_SUCCESS) {
> > > ++        goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++      }
> > > ++      status =3D ares_buf_append_byte(buf, '|');
> > > ++      if (status !=3D ARES_SUCCESS) {
> > > ++        goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++      }
> > > ++      /* Carries the DO bit, so a DNSSEC-aware request cannot be
> served an
> > > ++       * answer that was fetched without it. */
> > > ++      status =3D ares_buf_append_num_hex(
> > > ++        buf, ares_dns_rr_get_u16(opt, ARES_RR_OPT_FLAGS), 0);
> > > ++      if (status !=3D ARES_SUCCESS) {
> > > ++        goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++      }
> > > ++
> > > ++      /* The advertised UDP payload size is deliberately excluded: =
it
> > > ++       * constrains how a response is transported, not what it
> says.  A server
> > > ++       * that cannot fit the additional section may omit it without
> setting
> > > ++       * the TC bit (RFC 2181 section 9), so two sizes can produce
> answers
> > > ++       * that differ outside the answer section; that is accepted
> here. */
> > > ++      for (j =3D 0; j < opt_cnt; j++) {
> > > ++        const unsigned char *val     =3D NULL;
> > > ++        size_t               val_len =3D 0;
> > > ++        unsigned short       optid =3D
> > > ++          ares_dns_rr_get_opt(opt, ARES_RR_OPT_OPTIONS, j, &val,
> > &val_len);
> > > ++
> > > ++        /* DNS cookies are per-server transport state and say
> nothing about
> > > ++         * the content of an answer.  A cookie c-ares adds never
> reaches here
> > > ++         * -- ares_cookie_apply() writes to query->query, after thi=
s
> key has
> > > ++         * been derived -- so this only ever skips one the caller
> supplied. */
> > > ++        if (optid =3D=3D ARES_OPT_PARAM_COOKIE) {
> > > ++          continue;
> > > ++        }
> > > ++
> > > ++        status =3D ares_buf_append_byte(buf, '|');
> > > ++        if (status !=3D ARES_SUCCESS) {
> > > ++          goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++        }
> > > ++        status =3D ares_buf_append_num_hex(buf, optid, 0);
> > > ++        if (status !=3D ARES_SUCCESS) {
> > > ++          goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++        }
> > > ++        status =3D ares_buf_append_byte(buf, ':');
> > > ++        if (status !=3D ARES_SUCCESS) {
> > > ++          goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++        }
> > > ++        if (val !=3D NULL) {
> > > ++          size_t k;
> > > ++          for (k =3D 0; k < val_len; k++) {
> > > ++            status =3D ares_buf_append_num_hex(buf, val[k], 2);
> > > ++            if (status !=3D ARES_SUCCESS) {
> > > ++              goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++            }
> > > ++          }
> > > ++        }
> > > ++      }
> > > ++    }
> > > ++  }
> > > ++
> > > ++  status =3D ares_buf_append_byte(buf, '|');
> > > ++  if (status !=3D ARES_SUCCESS) {
> > > ++    goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++  }
> > > ++
> > > ++  status =3D ares_buf_append_num_dec(buf,
> > ares_dns_record_query_cnt(dnsrec), 0);
> > > ++  if (status !=3D ARES_SUCCESS) {
> > > ++    goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++  }
> > > +
> > > +   for (i =3D 0; i < ares_dns_record_query_cnt(dnsrec); i++) {
> > > +     const char         *name;
> > > +@@ -93,7 +201,13 @@ static char *ares_qcache_calc_key(const
> > ares_dns_record_t *dnsrec)
> > > +       goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > +     }
> > > +
> > > +-    status =3D ares_buf_append_str(buf,
> ares_dns_rec_type_tostr(qtype));
> > > ++    /* Numeric, not the mnemonic: ares_dns_rec_type_tostr() returns
> > "UNKNOWN"
> > > ++     * for every type outside its table, and
> ares_dns_record_query_add() does
> > > ++     * not validate the type, so any 16-bit value reaches here
> through the
> > > ++     * ordinary public API.  Two such lookups -- LOC and DNAME, say
> -- would
> > > ++     * otherwise key identically and be answered with each other's
> records.
> > > ++     * The key only has to be injective, not readable. */
> > > ++    status =3D ares_buf_append_num_dec(buf, (size_t)qtype, 0);
> > > +     if (status !=3D ARES_SUCCESS) {
> > > +       goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > +     }
> > > +@@ -103,7 +217,10 @@ static char *ares_qcache_calc_key(const
> > ares_dns_record_t *dnsrec)
> > > +       goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > +     }
> > > +
> > > +-    status =3D ares_buf_append_str(buf, ares_dns_class_tostr(qclass=
));
> > > ++    /* Numeric for the same reason.  ares_dns_record_query_add() do=
es
> > reject
> > > ++     * classes outside its list today, so the mnemonic is safe --
> but the key
> > > ++     * should not depend on that validation staying where it is. */
> > > ++    status =3D ares_buf_append_num_dec(buf, (size_t)qclass, 0);
> > > +     if (status !=3D ARES_SUCCESS) {
> > > +       goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > +     }
> > > +@@ -121,6 +238,21 @@ static char *ares_qcache_calc_key(const
> > ares_dns_record_t *dnsrec)
> > > +       name_len--;
> > > +     }
> > > +
> > > ++    /* Length-prefix the name so it is self-delimiting.  The
> question count
> > > ++     * above stops one question imitating two, but with the counts
> equal the
> > > ++     * boundary between adjacent names is still guessable, since
> names reach
> > > ++     * the key unescaped separated only by '|'.  A length makes eac=
h
> name
> > > ++     * unambiguous for any question count. */
> > > ++    status =3D ares_buf_append_num_dec(buf, name_len, 0);
> > > ++    if (status !=3D ARES_SUCCESS) {
> > > ++      goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++    }
> > > ++
> > > ++    status =3D ares_buf_append_byte(buf, ':');
> > > ++    if (status !=3D ARES_SUCCESS) {
> > > ++      goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > ++    }
> > > ++
> > > +     if (name_len > 0) {
> > > +       status =3D ares_buf_append(buf, (const unsigned char *)name,
> name_len);
> > > +       if (status !=3D ARES_SUCCESS) {
> > > +@@ -301,10 +433,10 @@ static unsigned int
> > ares_qcache_soa_minimum(ares_dns_record_t *dnsrec)
> > > + }
> > > +
> > > + /* On success, takes ownership of dnsrec */
> > > +-static ares_status_t ares_qcache_insert_int(ares_qcache_t
>  *qcache,
> > > +-                                            ares_dns_record_t
>  *qresp,
> > > +-                                            const ares_dns_record_t
> *qreq,
> > > +-                                            const ares_timeval_t
> *now)
> > > ++static ares_status_t ares_qcache_insert_int(ares_qcache_t
> *qcache,
> > > ++                                            ares_dns_record_t
> *qresp,
> > > ++                                            const char
>  *key,
> > > ++                                            const ares_timeval_t
> *now)
> > > + {
> > > +   ares_qcache_entry_t *entry;
> > > +   unsigned int         ttl;
> > > +@@ -350,11 +482,11 @@ static ares_status_t
> > ares_qcache_insert_int(ares_qcache_t           *qcache,
> > > +   entry->expire_ts =3D (time_t)now->sec + (time_t)ttl;
> > > +   entry->insert_ts =3D (time_t)now->sec;
> > > +
> > > +-  /* We can't guarantee the server responded with the same flags as
> the
> > > +-   * request had, so we have to re-parse the request in order to
> generate the
> > > +-   * key for caching, but we'll only do this once we know for sure
> we really
> > > +-   * want to cache it */
> > > +-  entry->key =3D ares_qcache_calc_key(qreq);
> > > ++  /* The key was derived from the caller's request when the query w=
as
> > created.
> > > ++   * It must not be recomputed from query->query here: the EDNS
> fallback
> > path
> > > ++   * strips the OPT record from that record before a successful
> retry, so a
> > > ++   * key derived from it would not match the one a later lookup
> computes. */
> > > ++  entry->key =3D ares_strdup(key);
> > > +   if (entry->key =3D=3D NULL) {
> > > +     goto fail; /* LCOV_EXCL_LINE: OutOfMemory */
> > > +   }
> > > +@@ -382,31 +514,25 @@ static ares_status_t
> > ares_qcache_insert_int(ares_qcache_t           *qcache,
> > > +   /* LCOV_EXCL_STOP */
> > > + }
> > > +
> > > +-ares_status_t ares_qcache_fetch(ares_channel_t           *channel,
> > > +-                                const ares_timeval_t     *now,
> > > +-                                const ares_dns_record_t  *dnsrec,
> > > +-                                const ares_dns_record_t
> **dnsrec_resp)
> > > ++ares_status_t ares_qcache_fetch(ares_channel_t       *channel,
> > > ++                                const ares_timeval_t *now, const
> char *key,
> > > ++                                ares_dns_record_t **dnsrec_resp)
> > > + {
> > > +-  char                *key =3D NULL;
> > > +   ares_qcache_entry_t *entry;
> > > +   ares_status_t        status =3D ARES_SUCCESS;
> > > +
> > > +-  if (channel =3D=3D NULL || dnsrec =3D=3D NULL || dnsrec_resp =3D=
=3D NULL) {
> > > ++  if (channel =3D=3D NULL || key =3D=3D NULL || dnsrec_resp =3D=3D =
NULL) {
> > > +     return ARES_EFORMERR;
> > > +   }
> > > +
> > > ++  *dnsrec_resp =3D NULL;
> > > ++
> > > +   if (channel->qcache =3D=3D NULL) {
> > > +     return ARES_ENOTFOUND;
> > > +   }
> > > +
> > > +   ares_qcache_expire(channel->qcache, now);
> > > +
> > > +-  key =3D ares_qcache_calc_key(dnsrec);
> > > +-  if (key =3D=3D NULL) {
> > > +-    status =3D ARES_ENOMEM; /* LCOV_EXCL_LINE: OutOfMemory */
> > > +-    goto done;            /* LCOV_EXCL_LINE: OutOfMemory */
> > > +-  }
> > > +-
> > > +   entry =3D ares_htable_strvp_get_direct(channel->qcache->cache, ke=
y);
> > > +   if (entry =3D=3D NULL) {
> > > +     status =3D ARES_ENOTFOUND;
> > > +@@ -416,10 +542,24 @@ ares_status_t ares_qcache_fetch(ares_channel_t
> > *channel,
> > > +   ares_dns_record_ttl_decrement(entry->dnsrec,
> > > +                                 (unsigned int)(now->sec -
> entry->insert_ts));
> > > +
> > > +-  *dnsrec_resp =3D entry->dnsrec;
> > > ++  /* Hand back a copy the caller owns rather than the cache's own
> record.
> > > ++   * This is passed straight into an application callback, and that
> callback
> > > ++   * is allowed to re-enter c-ares.  Any lookup it starts runs the
> expiry
> > > ++   * reaper first, and changing the server list flushes the cache
> outright --
> > > ++   * either would destroy this entry while the callback still held =
a
> pointer
> > > ++   * into it.  Mirrors the ownership fix already made on the insert
> side. */
> > > ++  status =3D ares_dns_record_duplicate_ex(dnsrec_resp, entry->dnsre=
c);
> > > ++  if (status !=3D ARES_SUCCESS) {
> > > ++    /* Could not hand back a private copy.  Report a miss so the
> lookup falls
> > > ++     * through to a real query rather than failing outright:
> duplication
> > > ++     * writes and re-parses the record, so it can fail for reasons
> other than
> > > ++     * memory exhaustion, and none of them are a reason to fail a
> lookup that
> > > ++     * would have gone to a server a moment earlier. */
> > > ++    status =3D ARES_ENOTFOUND; /* LCOV_EXCL_LINE: UntestablePath */
> > > ++    goto done;               /* LCOV_EXCL_LINE: UntestablePath */
> > > ++  }
> > > +
> > > + done:
> > > +-  ares_free(key);
> > > +   return status;
> > > + }
> > > +
> > > +@@ -428,13 +568,25 @@ ares_status_t ares_qcache_insert(ares_channel_=
t
> > *channel,
> > > +                                  const ares_query_t      *query,
> > > +                                  const ares_dns_record_t *dnsrec)
> > > + {
> > > +-  ares_dns_record_t *dupdns =3D ares_dns_record_duplicate(dnsrec);
> > > ++  ares_dns_record_t *dupdns;
> > > +   ares_status_t      status;
> > > +
> > > ++  /* Checked before the duplicate below, which is a full write and
> re-parse:
> > > ++   * no key means caching is switched off, so the copy would be
> thrown away.
> > > ++   * ares_init_options() always creates the cache object -- it is
> disabled by
> > > ++   * a zero maximum TTL, not by a NULL pointer -- so this is the
> only place
> > > ++   * the distinction is visible here. */
> > > ++  if (query->qcache_key =3D=3D NULL) {
> > > ++    return ARES_ENOTIMP;
> > > ++  }
> > > ++
> > > ++  dupdns =3D ares_dns_record_duplicate(dnsrec);
> > > +   if (dupdns =3D=3D NULL) {
> > > +     return ARES_ENOMEM;
> > > +   }
> > > +-  status =3D ares_qcache_insert_int(channel->qcache, dupdns,
> query->query,
> > now);
> > > ++
> > > ++  status =3D
> > > ++    ares_qcache_insert_int(channel->qcache, dupdns,
> query->qcache_key,
> > now);
> > > +   if (status !=3D ARES_SUCCESS) {
> > > +     ares_dns_record_destroy(dupdns);
> > > +   }
> > > +diff --git a/src/lib/ares_send.c b/src/lib/ares_send.c
> > > +index dd4a28544b..117745ce28 100644
> > > +--- a/src/lib/ares_send.c
> > > ++++ b/src/lib/ares_send.c
> > > +@@ -111,11 +111,12 @@ ares_status_t ares_send_nolock(ares_channel_t
> > *channel, ares_server_t *server,
> > > +                                ares_callback_dnsrec callback, void
> *arg,
> > > +                                unsigned short *qid)
> > > + {
> > > +-  ares_query_t            *query;
> > > +-  ares_timeval_t           now;
> > > +-  ares_status_t            status;
> > > +-  unsigned short           id          =3D
> generate_unique_qid(channel);
> > > +-  const ares_dns_record_t *dnsrec_resp =3D NULL;
> > > ++  ares_query_t      *query;
> > > ++  ares_timeval_t     now;
> > > ++  ares_status_t      status;
> > > ++  unsigned short     id          =3D generate_unique_qid(channel);
> > > ++  ares_dns_record_t *dnsrec_resp =3D NULL;
> > > ++  char              *qcache_key  =3D NULL;
> > > +
> > > +   /* A channel being destroyed accepts no new queries.
> ares_destroy(3)
> > > +    * documents that a callback must not add new requests to a
> channel being
> > > +@@ -145,13 +146,28 @@ ares_status_t ares_send_nolock(ares_channel_t
> > *channel, ares_server_t *server,
> > > +     return ARES_ENOSERVER;
> > > +   }
> > > +
> > > +-  if (!(flags & ARES_SEND_FLAG_NOCACHE)) {
> > > ++  /* Derive the cache key once, from the caller's request, and only
> when the
> > > ++   * cache is actually on.  The send path may mutate query->query
> afterwards
> > > ++   * -- the EDNS fallback strips its OPT record -- and a key derive=
d
> from it
> > > ++   * later would not match.  ares_init_options() always creates the
> cache
> > > ++   * object, so a zero maximum TTL is what "off" means. */
> > > ++  if (channel->qcache_max_ttl > 0) {
> > > ++    qcache_key =3D ares_qcache_calc_key(dnsrec);
> > > ++    if (qcache_key =3D=3D NULL) {
> > > ++      callback(arg, ARES_ENOMEM, 0, NULL); /* LCOV_EXCL_LINE:
> > OutOfMemory */
> > > ++      return ARES_ENOMEM;                  /* LCOV_EXCL_LINE:
> OutOfMemory */
> > > ++    }
> > > ++  }
> > > ++
> > > ++  if (qcache_key !=3D NULL && !(flags & ARES_SEND_FLAG_NOCACHE)) {
> > > +     /* Check query cache */
> > > +-    status =3D ares_qcache_fetch(channel, &now, dnsrec, &dnsrec_res=
p);
> > > ++    status =3D ares_qcache_fetch(channel, &now, qcache_key,
> &dnsrec_resp);
> > > +     if (status !=3D ARES_ENOTFOUND) {
> > > +       /* ARES_SUCCESS means we retrieved the cache, anything else i=
s
> a
> > critical
> > > +        * failure, all result in termination */
> > > ++      ares_free(qcache_key);
> > > +       callback(arg, status, 0, dnsrec_resp);
> > > ++      ares_dns_record_destroy(dnsrec_resp);
> > > +       return status;
> > > +     }
> > > +   }
> > > +@@ -159,8 +175,11 @@ ares_status_t ares_send_nolock(ares_channel_t
> > *channel, ares_server_t *server,
> > > +   /* Allocate space for query and allocated fields. */
> > > +   query =3D ares_malloc(sizeof(ares_query_t));
> > > +   if (!query) {
> > > +-    callback(arg, ARES_ENOMEM, 0, NULL); /* LCOV_EXCL_LINE:
> > OutOfMemory */
> > > +-    return ARES_ENOMEM;                  /* LCOV_EXCL_LINE:
> OutOfMemory */
> > > ++    /* LCOV_EXCL_START: OutOfMemory */
> > > ++    ares_free(qcache_key);
> > > ++    callback(arg, ARES_ENOMEM, 0, NULL);
> > > ++    return ARES_ENOMEM;
> > > ++    /* LCOV_EXCL_STOP */
> > > +   }
> > > +   memset(query, 0, sizeof(*query));
> > > +
> > > +@@ -173,6 +192,10 @@ ares_status_t ares_send_nolock(ares_channel_t
> > *channel, ares_server_t *server,
> > > +     (channel->flags & ARES_FLAG_USEVC) ? ARES_TRUE : ARES_FALSE;
> > > +
> > > +   /* Duplicate Query */
> > > ++  /* The query adopts the key derived above; ares_free_query()
> releases it. */
> > > ++  query->qcache_key =3D qcache_key;
> > > ++  qcache_key        =3D NULL;
> > > ++
> > > +   status =3D ares_dns_record_duplicate_ex(&query->query, dnsrec);
> > > +   if (status !=3D ARES_SUCCESS) {
> > > +     /* Sometimes we might get a EBADRESP response from duplicate du=
e
> to
> > > +@@ -180,7 +203,11 @@ ares_status_t ares_send_nolock(ares_channel_t
> > *channel, ares_server_t *server,
> > > +     if (status =3D=3D ARES_EBADRESP) {
> > > +       status =3D ARES_EBADQUERY;
> > > +     }
> > > +-    ares_free(query);
> > > ++    /* ares_free_query() rather than ares_free(): the query was
> zeroed above,
> > > ++     * so detaching finds every node NULL and the qid not yet
> registered, and
> > > ++     * it also releases qcache_key.  Reachable without memory
> pressure -- a
> > > ++     * name that is not a valid hostname fails the duplicate. */
> > > ++    ares_free_query(query);
> > > +     callback(arg, status, 0, NULL);
> > > +     return status;
> > > +   }
> > > +diff --git a/test/ares-test-internal.cc b/test/ares-test-internal.cc
> > > +index 8881f3b7cc..5ba5d2b39b 100644
> > > +--- a/test/ares-test-internal.cc
> > > ++++ b/test/ares-test-internal.cc
> > > +@@ -502,6 +502,60 @@ TEST_F(LibraryTest, URI) {
> > > +   EXPECT_NE(ARES_SUCCESS, ares_uri_parse_buf(NULL, NULL));
> > > +   EXPECT_NE(ARES_SUCCESS, ares_uri_parse_buf(NULL, NULL));
> > > + }
> > > ++
> > > ++// The cache key must distinguish requests whose answers are not
> > > ++// interchangeable.  Two shapes are easy to get wrong because names
> reach
> > the
> > > ++// key unescaped: a request with two questions versus one whose nam=
e
> > spells out
> > > ++// the second, and two requests with the same question count whose
> names
> > can be
> > > ++// made to run together.  Both are narrow to reach -- they need a
> hand-built
> > > ++// record with more than one question, which real servers reject --
> but the key
> > > ++// asserts they are distinct, so pin it.
> > > ++TEST_F(LibraryTest, QcacheKeyDistinguishesQuestions) {
> > > ++  struct qcase {
> > > ++    const char *n1;
> > > ++    const char *n2; /* nullptr for a single-question record */
> > > ++  };
> > > ++  const qcase cases[] =3D {
> > > ++    { "one.example.net",                      "two.example.net"
>                     },
> > > ++    { "one.example.net|A|IN|two.example.net", nullptr
>                     },
> > > ++    { "one.example.net",                      "two.example.net|A|IN=
|
> three.example.net"
> > },
> > > ++    { "one.example.net|A|IN|two.example.net", "three.example.net"
> > },
> > > ++  };
> > > ++  std::vector<std::string> keys;
> > > ++
> > > ++  for (size_t i =3D 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
> > > ++    ares_dns_record_t *req =3D nullptr;
> > > ++    char              *key =3D nullptr;
> > > ++
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_record_create(&req, 0, ARES_FLAG_RD,
> > ARES_OPCODE_QUERY,
> > > ++                                     ARES_RCODE_NOERROR));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_record_query_add(req, cases[i].n1,
> ARES_REC_TYPE_A,
> > > ++                                        ARES_CLASS_IN));
> > > ++    if (cases[i].n2 !=3D nullptr) {
> > > ++      EXPECT_EQ(ARES_SUCCESS,
> > > ++                ares_dns_record_query_add(req, cases[i].n2,
> > ARES_REC_TYPE_A,
> > > ++                                          ARES_CLASS_IN));
> > > ++    }
> > > ++
> > > ++    key =3D ares_qcache_calc_key(req);
> > > ++    ASSERT_NE(nullptr, key);
> > > ++    keys.push_back(std::string(key));
> > > ++    ares_free_string(key);
> > > ++    ares_dns_record_destroy(req);
> > > ++  }
> > > ++
> > > ++  /* Every one of these is a different request, so every key must
> differ. */
> > > ++  for (size_t i =3D 0; i < keys.size(); i++) {
> > > ++    for (size_t j =3D i + 1; j < keys.size(); j++) {
> > > ++      EXPECT_NE(keys[i], keys[j])
> > > ++        << "cache key collision between case " << i << " and case "
> << j
> > > ++        << ": " << keys[i];
> > > ++    }
> > > ++  }
> > > ++}
> > > ++
> > > + #endif /* !CARES_SYMBOL_HIDING */
> > > +
> > > + TEST_F(LibraryTest, InetPtoN) {
> > > +diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc
> > > +index b848c02434..4b409db7c3 100644
> > > +--- a/test/ares-test-mock.cc
> > > ++++ b/test/ares-test-mock.cc
> > > +@@ -611,6 +611,425 @@ class CacheQueriesTest
> > > +   struct ares_options opts_;
> > > + };
> > > +
> > > ++// A cache hit used to hand the callback a pointer to the cache's
> own record.
> > > ++// That is fine only while the callback does nothing else -- but
> re-entering
> > > ++// c-ares from a callback is documented as allowed, and two ordinar=
y
> things a
> > > ++// callback might do destroy the entry underneath it: changing the
> server list
> > > ++// flushes the whole cache, and starting another lookup runs the
> expiry reaper
> > > ++// first.  The record must therefore be the caller's own copy.
> > > ++//
> > > ++// Here the callback changes the server list, which flushes the
> cache, and
> > then
> > > ++// reads the record it was handed.
> > > ++struct QcacheReentrantCbData {
> > > ++  ares_channel_t *channel;
> > > ++  bool            done;
> > > ++  size_t          ancount;
> > > ++};
> > > ++
> > > ++static void QcacheReentrantCallback(void *arg, ares_status_t status=
,
> > > ++                                    size_t timeouts,
> > > ++                                    const ares_dns_record_t *dnsrec=
)
> {
> > > ++  QcacheReentrantCbData *data =3D static_cast<QcacheReentrantCbData
> > *>(arg);
> > > ++  (void)timeouts;
> > > ++  data->done =3D true;
> > > ++  if (status !=3D ARES_SUCCESS || dnsrec =3D=3D NULL) {
> > > ++    return;
> > > ++  }
> > > ++  /* Documented re-entry.  Reconfiguring servers flushes the query
> cache. */
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_set_servers_csv(data->channel, "127.0.0.1:53055"))=
;
> > > ++  /* Still inside the callback, so this record must still be
> readable. */
> > > ++  data->ancount =3D ares_dns_record_rr_cnt(dnsrec,
> > ARES_SECTION_ANSWER);
> > > ++}
> > > ++
> > > ++TEST_P(CacheQueriesTest, ReentrantFlushInCallbackNoUseAfterFree) {
> > > ++  DNSPacket rsp;
> > > ++  rsp.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("www.google.com", T_A))
> > > ++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
> > > ++  ON_CALL(server_, OnRequest("www.google.com", T_A))
> > > ++    .WillByDefault(SetReply(&server_, &rsp));
> > > ++
> > > ++  /* Populate the cache. */
> > > ++  QueryResult first;
> > > ++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    QueryCallback, &first, NULL);
> > > ++  Process();
> > > ++  EXPECT_TRUE(first.done_);
> > > ++
> > > ++  /* Served from the cache, so the callback runs synchronously
> holding the
> > > ++   * record the cache handed it. */
> > > ++  QcacheReentrantCbData data;
> > > ++  data.channel =3D channel_;
> > > ++  data.done    =3D false;
> > > ++  data.ancount =3D 0;
> > > ++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    QcacheReentrantCallback, &data, NULL);
> > > ++
> > > ++  EXPECT_TRUE(data.done);
> > > ++  EXPECT_EQ((size_t)1, data.ancount);
> > > ++}
> > > ++
> > > ++// The cache key covered the question and a couple of header flags
> but
> > ignored
> > > ++// the request's OPT record entirely, so two requests differing onl=
y
> in their
> > > ++// EDNS options collided.  An answer obtained under one set of
> options is not
> > > ++// interchangeable with one obtained under another -- most
> obviously, a
> > request
> > > ++// with the DO bit set must not be handed an answer fetched without
> it.
> > > ++//
> > > ++// Both requests here ask the identical question; only the EDNS
> state differs,
> > > ++// so the server must see two of them.
> > > ++TEST_P(CacheQueriesTest, EdnsOptionsSeparateCacheEntries) {
> > > ++  DNSPacket rsp;
> > > ++  rsp.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("www.google.com", T_A))
> > > ++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
> > > ++  EXPECT_CALL(server_, OnRequest("www.google.com", T_A))
> > > ++    .Times(2)
> > > ++    .WillRepeatedly(SetReply(&server_, &rsp));
> > > ++
> > > ++  /* First: no OPT record at all. */
> > > ++  ares_dns_record_t *req1 =3D nullptr;
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_record_create(&req1, 0, ARES_FLAG_RD,
> > ARES_OPCODE_QUERY,
> > > ++                                   ARES_RCODE_NOERROR));
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_record_query_add(req1, "www.google.com",
> > ARES_REC_TYPE_A,
> > > ++                                      ARES_CLASS_IN));
> > > ++  QueryResult r1;
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_send_dnsrec(channel_, req1, QueryCallback, &r1,
> nullptr));
> > > ++  Process();
> > > ++  EXPECT_TRUE(r1.done_);
> > > ++  EXPECT_EQ(ARES_SUCCESS, r1.status_);
> > > ++
> > > ++  /* Second: same question, but carrying EDNS with the DO bit set. =
*/
> > > ++  ares_dns_record_t *req2 =3D nullptr;
> > > ++  ares_dns_rr_t     *opt  =3D nullptr;
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_record_create(&req2, 0, ARES_FLAG_RD,
> > ARES_OPCODE_QUERY,
> > > ++                                   ARES_RCODE_NOERROR));
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_record_query_add(req2, "www.google.com",
> > ARES_REC_TYPE_A,
> > > ++                                      ARES_CLASS_IN));
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_record_rr_add(&opt, req2,
> ARES_SECTION_ADDITIONAL,
> > "",
> > > ++                                   ARES_REC_TYPE_OPT, ARES_CLASS_IN=
,
> 0));
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_rr_set_u16(opt, ARES_RR_OPT_UDP_SIZE, 1232));
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_dns_rr_set_u8(opt,
> > ARES_RR_OPT_VERSION, 0));
> > > ++  /* DO */
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_rr_set_u16(opt, ARES_RR_OPT_FLAGS, 0x8000));
> > > ++
> > > ++  QueryResult r2;
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_send_dnsrec(channel_, req2, QueryCallback, &r2,
> nullptr));
> > > ++  Process();
> > > ++  EXPECT_TRUE(r2.done_);
> > > ++  EXPECT_EQ(ARES_SUCCESS, r2.status_);
> > > ++
> > > ++  ares_dns_record_destroy(req1);
> > > ++  ares_dns_record_destroy(req2);
> > > ++}
> > > ++
> > > ++// The test above sets the DO bit, which lives in the OPT flags --
> it never
> > > ++// reaches the loop that keys the individual EDNS options.  That
> loop is what
> > > ++// separates two client subnets, so it needs its own coverage.
> > > ++// The mirror image of the tests above: two things are deliberately
> left out
> > > ++// of the cache key, and leaving them out is a security-relevant
> judgement --
> > > ++// it declares that two requests differing only in these still have
> > > ++// interchangeable answers.  Without a test, keying on either one
> later would
> > > ++// turn every request from an affected application into a permanent
> cache
> > miss
> > > ++// and nothing would fail.
> > > ++
> > > ++// A DNS cookie is per-server transport state and says nothing abou=
t
> the
> > > ++// content of an answer, so two requests differing only in their
> cookie share
> > > ++// an entry.  The server must therefore be asked exactly once.
> > > ++// Two query types with no mnemonic in ares_dns_rec_type_tostr() bo=
th
> > render as
> > > ++// "UNKNOWN", so keying the mnemonic made every such type share one
> > entry -- a
> > > ++// lookup answered with a record of a type it never asked for.  Any
> 16-bit
> > > ++// value reaches here through ares_query_dnsrec(); LOC (29) and DNA=
ME
> > (39) are
> > > ++// both real and both outside the table.
> > > ++TEST_P(CacheQueriesTest,
> > UnknownQueryTypesDoNotShareCacheEntries) {
> > > ++  DNSPacket rsp29;
> > > ++  rsp29.set_response().set_aa().add_question(
> > > ++    new DNSQuestion("example.net", 29));
> > > ++  DNSPacket rsp39;
> > > ++  rsp39.set_response().set_aa().add_question(
> > > ++    new DNSQuestion("example.net", 39));
> > > ++
> > > ++  // One call per type: neither may be served the other's answer.
> > > ++  EXPECT_CALL(server_, OnRequest("example.net", 29))
> > > ++    .Times(1)
> > > ++    .WillRepeatedly(SetReply(&server_, &rsp29));
> > > ++  EXPECT_CALL(server_, OnRequest("example.net", 39))
> > > ++    .Times(1)
> > > ++    .WillRepeatedly(SetReply(&server_, &rsp39));
> > > ++
> > > ++  QueryResult r1;
> > > ++  ares_query_dnsrec(channel_, "example.net", ARES_CLASS_IN,
> > > ++                    static_cast<ares_dns_rec_type_t>(29),
> QueryCallback, &r1,
> > > ++                    nullptr);
> > > ++  Process();
> > > ++  EXPECT_TRUE(r1.done_);
> > > ++
> > > ++  QueryResult r2;
> > > ++  ares_query_dnsrec(channel_, "example.net", ARES_CLASS_IN,
> > > ++                    static_cast<ares_dns_rec_type_t>(39),
> QueryCallback, &r2,
> > > ++                    nullptr);
> > > ++  Process();
> > > ++  EXPECT_TRUE(r2.done_);
> > > ++}
> > > ++
> > > ++// Handing back a duplicate materialises the pending TTL decrement,
> so a
> > > ++// callback that reads the TTL off the record it is given sees the
> remaining
> > > ++// lifetime rather than the value the server sent.
> docs/ares_init_options.3
> > > ++// states this, so pin it.  Only visible to a caller that does not
> duplicate
> > > ++// first -- QueryResult does, which is why the other cache tests
> cannot see it.
> > > ++static unsigned int g_qcache_hit_ttl =3D 0;
> > > ++
> > > ++static void QcacheTtlCallback(void *arg, ares_status_t status,
> size_t timeouts,
> > > ++                              const ares_dns_record_t *dnsrec) {
> > > ++  const ares_dns_rr_t *rr;
> > > ++  (void)arg;
> > > ++  (void)timeouts;
> > > ++  if (status !=3D ARES_SUCCESS || dnsrec =3D=3D NULL) {
> > > ++    return;
> > > ++  }
> > > ++  rr =3D ares_dns_record_rr_get_const(dnsrec, ARES_SECTION_ANSWER, =
0);
> > > ++  g_qcache_hit_ttl =3D rr ? ares_dns_rr_get_ttl(rr) : 0;
> > > ++}
> > > ++
> > > ++TEST_P(CacheQueriesTest, CacheHitReportsRemainingTtl) {
> > > ++  DNSPacket rsp;
> > > ++  rsp.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("www.google.com", T_A))
> > > ++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
> > > ++  EXPECT_CALL(server_, OnRequest("www.google.com", T_A))
> > > ++    .Times(1)
> > > ++    .WillRepeatedly(SetReply(&server_, &rsp));
> > > ++
> > > ++  g_qcache_hit_ttl =3D 0;
> > > ++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    QcacheTtlCallback, nullptr, nullptr);
> > > ++  Process();
> > > ++  EXPECT_EQ((unsigned int)100, g_qcache_hit_ttl);
> > > ++
> > > ++  ares_sleep_time(2100);
> > > ++
> > > ++  g_qcache_hit_ttl =3D 0;
> > > ++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    QcacheTtlCallback, nullptr, nullptr);
> > > ++  Process();
> > > ++  // Served from the cache, and reporting what is left rather than
> the
> > > ++  // original 100.
> > > ++  EXPECT_GT(g_qcache_hit_ttl, (unsigned int)0);
> > > ++  EXPECT_LT(g_qcache_hit_ttl, (unsigned int)100);
> > > ++}
> > > ++
> > > ++TEST_P(CacheQueriesTest, CookieDoesNotSplitCacheEntries) {
> > > ++  DNSPacket rsp;
> > > ++  rsp.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("www.google.com", T_A))
> > > ++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
> > > ++  EXPECT_CALL(server_, OnRequest("www.google.com", T_A))
> > > ++    .Times(1)
> > > ++    .WillRepeatedly(SetReply(&server_, &rsp));
> > > ++
> > > ++  const unsigned char  ck1[]   =3D {1, 2, 3, 4, 5, 6, 7, 8};
> > > ++  const unsigned char  ck2[]   =3D {8, 7, 6, 5, 4, 3, 2, 1};
> > > ++  const unsigned char *ck[2]   =3D {ck1, ck2};
> > > ++  QueryResult          r[2];
> > > ++
> > > ++  for (int i =3D 0; i < 2; i++) {
> > > ++    ares_dns_record_t *req =3D nullptr;
> > > ++    ares_dns_rr_t     *opt =3D nullptr;
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_record_create(&req, 0, ARES_FLAG_RD,
> > ARES_OPCODE_QUERY,
> > > ++                                     ARES_RCODE_NOERROR));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_record_query_add(req, "www.google.com",
> > ARES_REC_TYPE_A,
> > > ++                                        ARES_CLASS_IN));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_record_rr_add(&opt, req,
> ARES_SECTION_ADDITIONAL,
> > "",
> > > ++                                     ARES_REC_TYPE_OPT,
> ARES_CLASS_IN, 0));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_rr_set_u16(opt, ARES_RR_OPT_UDP_SIZE, 1232))=
;
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_rr_set_opt(opt, ARES_RR_OPT_OPTIONS,
> > > ++                                  ARES_OPT_PARAM_COOKIE, ck[i],
> sizeof(ck1)));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_send_dnsrec(channel_, req, QueryCallback, &r[i],
> nullptr));
> > > ++    Process();
> > > ++    EXPECT_TRUE(r[i].done_);
> > > ++    EXPECT_EQ(ARES_SUCCESS, r[i].status_);
> > > ++    ares_dns_record_destroy(req);
> > > ++  }
> > > ++}
> > > ++
> > > ++// The advertised UDP payload size constrains how a response is
> > transported,
> > > ++// not what it says, so it is excluded too.  Same expectation: one
> request.
> > > ++TEST_P(CacheQueriesTest, UdpPayloadSizeDoesNotSplitCacheEntries) {
> > > ++  DNSPacket rsp;
> > > ++  rsp.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("www.google.com", T_A))
> > > ++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
> > > ++  EXPECT_CALL(server_, OnRequest("www.google.com", T_A))
> > > ++    .Times(1)
> > > ++    .WillRepeatedly(SetReply(&server_, &rsp));
> > > ++
> > > ++  const unsigned short sizes[2] =3D {512, 1232};
> > > ++  QueryResult          r[2];
> > > ++
> > > ++  for (int i =3D 0; i < 2; i++) {
> > > ++    ares_dns_record_t *req =3D nullptr;
> > > ++    ares_dns_rr_t     *opt =3D nullptr;
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_record_create(&req, 0, ARES_FLAG_RD,
> > ARES_OPCODE_QUERY,
> > > ++                                     ARES_RCODE_NOERROR));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_record_query_add(req, "www.google.com",
> > ARES_REC_TYPE_A,
> > > ++                                        ARES_CLASS_IN));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_record_rr_add(&opt, req,
> ARES_SECTION_ADDITIONAL,
> > "",
> > > ++                                     ARES_REC_TYPE_OPT,
> ARES_CLASS_IN, 0));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_rr_set_u16(opt, ARES_RR_OPT_UDP_SIZE,
> sizes[i]));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_send_dnsrec(channel_, req, QueryCallback, &r[i],
> nullptr));
> > > ++    Process();
> > > ++    EXPECT_TRUE(r[i].done_);
> > > ++    EXPECT_EQ(ARES_SUCCESS, r[i].status_);
> > > ++    ares_dns_record_destroy(req);
> > > ++  }
> > > ++}
> > > ++
> > > ++TEST_P(CacheQueriesTest, EdnsClientSubnetSeparateCacheEntries) {
> > > ++  DNSPacket rsp;
> > > ++  rsp.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("www.google.com", T_A))
> > > ++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
> > > ++  EXPECT_CALL(server_, OnRequest("www.google.com", T_A))
> > > ++    .Times(2)
> > > ++    .WillRepeatedly(SetReply(&server_, &rsp));
> > > ++
> > > ++  /* 192.0.2.0/24 and 198.51.100.0/24 */
> > > ++  const unsigned char  ecs1[]  =3D {0x00, 0x01, 0x18, 0x00, 0xc0,
> 0x00, 0x02};
> > > ++  const unsigned char  ecs2[]  =3D {0x00, 0x01, 0x18, 0x00, 0xc6,
> 0x33, 0x64};
> > > ++  const unsigned char *ecs[2]  =3D {ecs1, ecs2};
> > > ++  QueryResult          r[2];
> > > ++
> > > ++  for (int i =3D 0; i < 2; i++) {
> > > ++    ares_dns_record_t *req =3D nullptr;
> > > ++    ares_dns_rr_t     *opt =3D nullptr;
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_record_create(&req, 0, ARES_FLAG_RD,
> > ARES_OPCODE_QUERY,
> > > ++                                     ARES_RCODE_NOERROR));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_record_query_add(req, "www.google.com",
> > ARES_REC_TYPE_A,
> > > ++                                        ARES_CLASS_IN));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_record_rr_add(&opt, req,
> ARES_SECTION_ADDITIONAL,
> > "",
> > > ++                                     ARES_REC_TYPE_OPT,
> ARES_CLASS_IN, 0));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_rr_set_u16(opt, ARES_RR_OPT_UDP_SIZE, 1232))=
;
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_dns_rr_set_opt(opt, ARES_RR_OPT_OPTIONS,
> > > ++                                  ARES_OPT_PARAM_EDNS_CLIENT_SUBNET=
,
> ecs[i],
> > > ++                                  sizeof(ecs1)));
> > > ++    EXPECT_EQ(ARES_SUCCESS,
> > > ++              ares_send_dnsrec(channel_, req, QueryCallback, &r[i],
> nullptr));
> > > ++    Process();
> > > ++    EXPECT_TRUE(r[i].done_);
> > > ++    EXPECT_EQ(ARES_SUCCESS, r[i].status_);
> > > ++    ares_dns_record_destroy(req);
> > > ++  }
> > > ++}
> > > ++
> > > ++// A server answering an EDNS query with FORMERR makes c-ares strip
> the
> > OPT
> > > ++// record from query->query and retry.  The cache key must not be
> derived
> > from
> > > ++// that record afterwards, or the entry is stored under a key no
> later lookup
> > > ++// computes and the cache silently stops working for that name.
> > > ++TEST_P(CacheQueriesTest, EdnsFallbackStillCaches) {
> > > ++  DNSPacket rspfail;
> > > ++  rspfail.set_response().set_aa().set_rcode(FORMERR)
> > > ++    .add_question(new DNSQuestion("www.google.com", T_A));
> > > ++  DNSPacket rspok;
> > > ++  rspok.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("www.google.com", T_A))
> > > ++    .add_answer(new DNSARR("www.google.com", 100, {1, 2, 3, 4}));
> > > ++  /* Two: the FORMERR and the retry.  The second lookup must be a
> cache
> > hit. */
> > > ++  EXPECT_CALL(server_, OnRequest("www.google.com", T_A))
> > > ++    .Times(2)
> > > ++    .WillOnce(SetReply(&server_, &rspfail))
> > > ++    .WillRepeatedly(SetReply(&server_, &rspok));
> > > ++
> > > ++  HostResult r1;
> > > ++  ares_gethostbyname(channel_, "www.google.com.", AF_INET,
> > HostCallback, &r1);
> > > ++  Process();
> > > ++  EXPECT_TRUE(r1.done_);
> > > ++  EXPECT_EQ(ARES_SUCCESS, r1.status_);
> > > ++
> > > ++  HostResult r2;
> > > ++  ares_gethostbyname(channel_, "www.google.com.", AF_INET,
> > HostCallback, &r2);
> > > ++  Process();
> > > ++  EXPECT_TRUE(r2.done_);
> > > ++  EXPECT_EQ(ARES_SUCCESS, r2.status_);
> > > ++}
> > > ++
> > > ++// The question name is caller-supplied and unescaped, so anything
> keyed
> > after
> > > ++// it could be imitated by a name containing that same text.  A
> request for
> > > ++// "example.net|EDNS|0|8000" with no OPT record must not collide
> with a
> > request
> > > ++// for "example.net" carrying EDNS with the DNSSEC OK bit set.
> > > ++TEST_P(CacheQueriesTest, EdnsSectionCannotBeImitatedByName) {
> > > ++  DNSPacket rsp;
> > > ++  rsp.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("example.net", T_A))
> > > ++    .add_answer(new DNSARR("example.net", 100, {5, 6, 7, 8}));
> > > ++  ON_CALL(server_, OnRequest("example.net", T_A))
> > > ++    .WillByDefault(SetReply(&server_, &rsp));
> > > ++
> > > ++  /* Cache an answer for the real name, with EDNS and the DO bit
> set. */
> > > ++  ares_dns_record_t *req =3D nullptr;
> > > ++  ares_dns_rr_t     *opt =3D nullptr;
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_record_create(&req, 0, ARES_FLAG_RD,
> > ARES_OPCODE_QUERY,
> > > ++                                   ARES_RCODE_NOERROR));
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_record_query_add(req, "example.net",
> > ARES_REC_TYPE_A,
> > > ++                                      ARES_CLASS_IN));
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_record_rr_add(&opt, req,
> ARES_SECTION_ADDITIONAL,
> > "",
> > > ++                                   ARES_REC_TYPE_OPT, ARES_CLASS_IN=
,
> 0));
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_rr_set_u16(opt, ARES_RR_OPT_UDP_SIZE, 1232));
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_dns_rr_set_u16(opt,
> > ARES_RR_OPT_FLAGS, 0x8000));
> > > ++  QueryResult r1;
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_send_dnsrec(channel_, req, QueryCallback, &r1,
> nullptr));
> > > ++  Process();
> > > ++  EXPECT_TRUE(r1.done_);
> > > ++  EXPECT_EQ(ARES_SUCCESS, r1.status_);
> > > ++  ares_dns_record_destroy(req);
> > > ++
> > > ++  /* A different name that spells out the EDNS suffix, with no OPT
> record.
> > > ++   * It must not be served the entry above; with the cache keyed
> correctly it
> > > ++   * is refused, because '|' is not valid in a hostname. */
> > > ++  ares_dns_record_t *req2 =3D nullptr;
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_record_create(&req2, 0, ARES_FLAG_RD,
> > ARES_OPCODE_QUERY,
> > > ++                                   ARES_RCODE_NOERROR));
> > > ++  EXPECT_EQ(ARES_SUCCESS,
> > > ++            ares_dns_record_query_add(req2, "example.net
> |EDNS|0|8000",
> > > ++                                      ARES_REC_TYPE_A,
> ARES_CLASS_IN));
> > > ++  QueryResult r2;
> > > ++  ares_send_dnsrec(channel_, req2, QueryCallback, &r2, nullptr);
> > > ++  Process();
> > > ++  EXPECT_TRUE(r2.done_);
> > > ++  EXPECT_NE(ARES_SUCCESS, r2.status_);
> > > ++  ares_dns_record_destroy(req2);
> > > ++}
> > > ++
> > > + TEST_P(CacheQueriesTest, GetHostByNameCache) {
> > > +   DNSPacket rsp;
> > > +   rsp.set_response().set_aa()
> > > diff --git
> a/meta-oe/recipes-support/c-ares/c-ares/0004-Handle-connections-
> > torn-down-by-application.patch
> b/meta-oe/recipes-support/c-ares/c-ares/0004-
> > Handle-connections-torn-down-by-application.patch
> > > new file mode 100644
> > > index 0000000000..f78e9726b0
> > > --- /dev/null
> > > +++
> b/meta-oe/recipes-support/c-ares/c-ares/0004-Handle-connections-torn-
> > down-by-application.patch
> > > @@ -0,0 +1,1107 @@
> > > +From 13a10dddbabc30b6fca8e23f9efff73fedba9401 Mon Sep 17 00:00:00
> > 2001
> > > +From: Brad House <brad@brad-house.com>
> > > +Date: Sun, 18 Oct 2026 22:51:53 -0400
> > > +Subject: [PATCH] [Backport v1.34] Handle connections torn down by
> > application
> > > + socket functions (#1343)
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +Backport of cb25d8bf297aed0aad8f6e0777ca0635cacc6cb1 to `v1.34`. See
> > > +that commit for the full description.
> > > +
> > > +Application code that c-ares calls while using a connection can
> > > +reconfigure the servers and so tear that connection down. That
> includes
> > > +the socket functions from `ares_set_socket_functions_ex()` and the
> older
> > > +`ares_set_socket_functions()`, and the pending-write callback. c-are=
s
> > > +now notices this while opening, writing to, reading from or closing =
a
> > > +connection. It requeues the affected queries, or drops the stale dat=
a,
> > > +instead of continuing to use the connection.
> > > +
> > > +It applied cleanly on top of the dd62bdfc and #1340 backports (#1338=
).
> > > +Test file contents match `main`.
> > > +
> > > +Each of the 11 new tests fails on `v1.34` without this change: nine
> with
> > > +an ASAN heap-use-after-free, and the two receive tests on their
> > > +assertions. All 11 pass with it. The full non-live suite passes
> 674/674
> > > +under ASAN+UBSAN and with `-DCARES_WERROR=3DON` on macOS.
> > > +
> > > +Signed-off-by: Brad House <brad@brad-house.com>
> > > +Co-authored-by: Mar <mardgez13@gmail.com>
> > > +Upstream-Status: Backport [https://github.com/c-ares/c-
> > ares/commit/13a10dddbabc30b6fca8e23f9efff73fedba9401]
> > > +GHSA: GHSA-pj7p-v3cw-hq66
> > > +---
> > > + src/lib/ares_close_sockets.c |   7 +-
> > > + src/lib/ares_conn.c          |  29 ++
> > > + src/lib/ares_process.c       |  65 ++-
> > > + test/ares-test-mock.cc       | 842
> +++++++++++++++++++++++++++++++++++
> > > + 4 files changed, 935 insertions(+), 8 deletions(-)
> > > +
> > > +diff --git a/src/lib/ares_close_sockets.c
> b/src/lib/ares_close_sockets.c
> > > +index 6be662fdd3..a3af721bc6 100644
> > > +--- a/src/lib/ares_close_sockets.c
> > > ++++ b/src/lib/ares_close_sockets.c
> > > +@@ -148,6 +148,7 @@ void ares_check_cleanup_conns(const
> > ares_channel_t *channel)
> > > +     return; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > +   }
> > > +
> > > ++restart:
> > > +   /* Iterate across each server */
> > > +   for (snode =3D ares_slist_node_first(channel->servers); snode !=
=3D
> NULL;
> > > +        snode =3D ares_slist_node_next(snode)) {
> > > +@@ -190,8 +191,12 @@ void ares_check_cleanup_conns(const
> > ares_channel_t *channel)
> > > +         continue;
> > > +       }
> > > +
> > > +-      /* Clean it up */
> > > ++      /* Clean it up.  The close function is application code and
> may have
> > > ++       * reconfigured the servers, freeing the list nodes this walk
> holds --
> > > ++       * the server's, and the next connection's.  Start over;
> connections
> > > ++       * already closed are no longer listed, so this ends. */
> > > +       ares_close_connection(conn, ARES_SUCCESS);
> > > ++      goto restart;
> > > +     }
> > > +   }
> > > + }
> > > +diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c
> > > +index 4cc0d1871d..5e0827fbdf 100644
> > > +--- a/src/lib/ares_conn.c
> > > ++++ b/src/lib/ares_conn.c
> > > +@@ -262,6 +262,15 @@ ares_conn_err_t ares_conn_read(ares_conn_t
> > *conn, void *data, size_t len,
> > > +     err =3D ares_socket_recv(channel, conn->fd, ARES_TRUE, data, le=
n,
> > read_bytes);
> > > +   }
> > > +
> > > ++  /* The receive function is application code and may have
> reconfigured the
> > > ++   * servers, tearing this connection down.  Nothing read from it
> can be
> > > ++   * matched any more -- its queries have moved to the new
> configuration --
> > > ++   * and its descriptor is gone, so it must not be read again. */
> > > ++  if (conn->flags & ARES_CONN_FLAG_DEAD) {
> > > ++    *read_bytes =3D 0;
> > > ++    return ARES_CONN_ERR_CONNCLOSED;
> > > ++  }
> > > ++
> > > +   /* Toggle connected state if needed */
> > > +   if (err =3D=3D ARES_CONN_ERR_SUCCESS) {
> > > +     conn->state_flags |=3D ARES_CONN_STATE_CONNECTED;
> > > +@@ -408,6 +417,19 @@ ares_conn_err_t ares_conn_write(ares_conn_t
> > *conn, const void *data, size_t len,
> > > +   }
> > > +
> > > + done:
> > > ++  /* The send function -- from ares_set_socket_functions_ex() or th=
e
> legacy
> > > ++   * ares_set_socket_functions() -- and on the first TCP Fast Open
> write the
> > > ++   * getsockname function, are application code and may have
> reconfigured
> > the
> > > ++   * servers, tearing this connection down.  Whatever the write
> returned,
> > > ++   * nothing written here can be answered any more, and the
> descriptor has
> > > ++   * already been closed or handed to the close notification, so
> there is no
> > > ++   * socket state left to report.  Say so, so every caller treats i=
t
> as the
> > > ++   * connection failure it is. */
> > > ++  if (conn->flags & ARES_CONN_FLAG_DEAD) {
> > > ++    *written =3D 0;
> > > ++    return ARES_CONN_ERR_CONNCLOSED;
> > > ++  }
> > > ++
> > > +   if (err =3D=3D ARES_CONN_ERR_SUCCESS && len =3D=3D *written) {
> > > +     /* Wrote all data, make sure we're not listening for write
> events unless
> > > +      * using TFO, in which case we'll need a write event to know wh=
en
> > > +@@ -644,6 +666,13 @@ ares_status_t ares_open_connection(ares_conn_t
> > **conn_out,
> > > +     goto done; /* LCOV_EXCL_LINE: UntestablePath */
> > > +   }
> > > +
> > > ++  /* The getsockname function is application code as well, and may
> have
> > > ++   * reconfigured the servers the same way. */
> > > ++  if (!ares_server_in_channel(channel, server)) {
> > > ++    status =3D ARES_ECONNREFUSED;
> > > ++    goto done;
> > > ++  }
> > > ++
> > > +   /* TCP connections are thrown to the end as we don't spawn
> multiple TCP
> > > +    * connections. UDP connections are put on front where the newest
> > connection
> > > +    * can be quickly pulled */
> > > +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
> > > +index 88536704ad..5686b077a6 100644
> > > +--- a/src/lib/ares_process.c
> > > ++++ b/src/lib/ares_process.c
> > > +@@ -189,7 +189,9 @@ static void
> server_increment_failures(ares_server_t
> > *server,
> > > +   ares_timeval_t        next_retry_time;
> > > +
> > > +   node =3D ares_slist_node_find(channel->servers, server);
> > > +-  if (node =3D=3D NULL) {
> > > ++  /* Matches by sort key, not identity, so a removed server can
> match the live
> > > ++   * one that replaced it at the same configuration index. */
> > > ++  if (node =3D=3D NULL || ares_slist_node_val(node) !=3D server) {
> > > +     return; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > +   }
> > > +
> > > +@@ -220,7 +222,9 @@ static void server_set_good(ares_server_t *serve=
r,
> > ares_bool_t used_tcp)
> > > +   const ares_channel_t *channel =3D server->channel;
> > > +
> > > +   node =3D ares_slist_node_find(channel->servers, server);
> > > +-  if (node =3D=3D NULL) {
> > > ++  /* Matches by sort key, not identity, so a removed server can
> match the live
> > > ++   * one that replaced it at the same configuration index. */
> > > ++  if (node =3D=3D NULL || ares_slist_node_val(node) !=3D server) {
> > > +     return; /* LCOV_EXCL_LINE: DefensiveCoding */
> > > +   }
> > > +
> > > +@@ -501,21 +505,39 @@ void ares_process_pending_write(ares_channel_t
> > *channel)
> > > +    */
> > > +   channel->notify_pending_write =3D ARES_FALSE;
> > > +
> > > +-  for (node =3D ares_slist_node_first(channel->servers); node !=3D =
NULL;
> > > +-       node =3D ares_slist_node_next(node)) {
> > > +-    ares_server_t *server =3D ares_slist_node_val(node);
> > > +-    ares_conn_t   *conn   =3D server->tcp_conn;
> > > ++  node =3D ares_slist_node_first(channel->servers);
> > > ++  while (node !=3D NULL) {
> > > ++    ares_server_t *server     =3D ares_slist_node_val(node);
> > > ++    ares_conn_t   *conn       =3D server->tcp_conn;
> > > ++    size_t         generation =3D channel->servers_generation;
> > > +     ares_status_t  status;
> > > +
> > > +     if (conn =3D=3D NULL) {
> > > ++      node =3D ares_slist_node_next(node);
> > > +       continue;
> > > +     }
> > > +
> > > +-    /* Enqueue any pending data if there is any */
> > > ++    /* Enqueue any pending data if there is any.  The flush runs th=
e
> > > ++     * application's send function, which may have reconfigured the
> servers
> > > ++     * and removed this one; its connection is then already closed,
> which
> > > ++     * handle_conn_error() ignores. */
> > > +     status =3D ares_conn_flush(conn);
> > > +     if (status !=3D ARES_SUCCESS) {
> > > +       handle_conn_error(conn, ARES_TRUE, status);
> > > +     }
> > > ++
> > > ++    /* Tearing down a connection runs the callbacks of the queries
> it ends,
> > > ++     * and those may reconfigure the servers too, destroying the
> ones the new
> > > ++     * configuration omits along with their list nodes.  A failure
> also moves
> > > ++     * this server further down the list.  So when either may have
> happened,
> > > ++     * start over from the head rather than step from this node;
> flushing a
> > > ++     * connection again is harmless. */
> > > ++    if (status !=3D ARES_SUCCESS || channel->servers_generation !=
=3D
> > generation) {
> > > ++      node =3D ares_slist_node_first(channel->servers);
> > > ++      continue;
> > > ++    }
> > > ++
> > > ++    node =3D ares_slist_node_next(node);
> > > +   }
> > > +
> > > +   ares_deferred_cb_leave(channel);
> > > +@@ -902,6 +924,13 @@ static ares_status_t process_read(ares_channel_=
t
> > *channel,
> > > +     return status;
> > > +   }
> > > +
> > > ++  /* A later call to the receive function may have reconfigured the
> servers,
> > > ++   * tearing this connection down after earlier calls buffered
> answers on it.
> > > ++   * Its queries have moved to the new configuration, so drop the
> answers. */
> > > ++  if (conn->flags & ARES_CONN_FLAG_DEAD) {
> > > ++    return ARES_SUCCESS;
> > > ++  }
> > > ++
> > > +   status =3D read_answers(conn, now);
> > > +   if (status !=3D ARES_SUCCESS) {
> > > +     return status;
> > > +@@ -1192,6 +1221,15 @@ static void handle_conn_error(ares_conn_t
> *conn,
> > ares_bool_t critical_failure,
> > > + {
> > > +   ares_server_t *server =3D conn->server;
> > > +
> > > ++  /* Already torn down, most likely by a reconfiguration from
> application code
> > > ++   * the failing call ran, such as the send function.  Its queries
> have been
> > > ++   * requeued, and its server did not fail -- it was removed, or th=
e
> > > ++   * connection was closed deliberately -- so there is nothing to
> record and
> > > ++   * nothing left to close. */
> > > ++  if (conn->flags & ARES_CONN_FLAG_DEAD) {
> > > ++    return;
> > > ++  }
> > > ++
> > > +   /* Increment failures first before requeue so it is unlikely to
> requeue
> > > +    * to the same server */
> > > +   if (critical_failure) {
> > > +@@ -1508,6 +1546,14 @@ static ares_status_t
> > ares_conn_query_write(ares_conn_t          *conn,
> > > +       conn->flags & ARES_CONN_FLAG_TCP) {
> > > +     channel->notify_pending_write =3D ARES_TRUE;
> > > +     channel->notify_pending_write_cb(channel-
> > >notify_pending_write_cb_data);
> > > ++
> > > ++    /* The callback is application code and may have reconfigured t=
he
> > > ++     * servers, closing this connection with the query already
> buffered on
> > > ++     * it.  Report it as a connection failure so the query is
> requeued rather
> > > ++     * than attached to the closed connection. */
> > > ++    if (conn->flags & ARES_CONN_FLAG_DEAD) {
> > > ++      return ARES_ECONNREFUSED;
> > > ++    }
> > > +     return ARES_SUCCESS;
> > > +   }
> > > +
> > > +@@ -1650,6 +1696,11 @@ static ares_status_t
> > ares_send_query_int(ares_server_t        *requested_server,
> > > +     return ARES_ECANCELLED;
> > > +   }
> > > +
> > > ++  /* Application code that tore this connection down during the
> write -- the
> > > ++   * send function, or the pending-write callback when the write is
> deferred,
> > > ++   * reconfiguring the servers, say -- surfaces here as
> > ARES_ECONNREFUSED,
> > > ++   * even if the send itself reported success or never happened, so
> the query
> > > ++   * is requeued below rather than attached to the closed
> connection. */
> > > +   switch (status) {
> > > +     /* Good result, continue on */
> > > +     case ARES_SUCCESS:
> > > +diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc
> > > +index 4b409db7c3..f1d9d360e7 100644
> > > +--- a/test/ares-test-mock.cc
> > > ++++ b/test/ares-test-mock.cc
> > > +@@ -2593,6 +2593,86 @@ INSTANTIATE_TEST_SUITE_P(AddressFamilies,
> > MockUDPSingleTryTest,
> > > +                          ::testing::ValuesIn(ares::test::families),
> > > +                          PrintFamily);
> > > +
> > > ++// ares_process_pending_write() flushes each server's TCP
> connection.  A
> > flush
> > > ++// that fails tears the connection down, which ends a query that is
> out of
> > > ++// retries and runs its callback right there.  A callback that
> reconfigures the
> > > ++// servers removes the one being flushed, and the walk must not go
> on to use
> > > ++// that server, its connection or its place in the list.
> > > ++class MockTCPSingleTryStayOpenTest
> > > ++  : public MockChannelOptsTest,
> > > ++    public ::testing::WithParamInterface<int> {
> > > ++public:
> > > ++  MockTCPSingleTryStayOpenTest()
> > > ++    : MockChannelOptsTest(1, GetParam(), true, false,
> FillOptions(&opts_),
> > > ++                          ARES_OPT_TRIES | ARES_OPT_FLAGS)
> > > ++  {
> > > ++  }
> > > ++
> > > ++  static struct ares_options *FillOptions(struct ares_options *opts=
)
> > > ++  {
> > > ++    memset(opts, 0, sizeof(struct ares_options));
> > > ++    opts->tries =3D 1;
> > > ++    /* ARES_OPT_FLAGS replaces the defaults, which include EDNS. */
> > > ++    opts->flags =3D ARES_FLAG_STAYOPEN | ARES_FLAG_EDNS;
> > > ++    return opts;
> > > ++  }
> > > ++
> > > ++private:
> > > ++  struct ares_options opts_;
> > > ++};
> > > ++
> > > ++static void PendingWriteNotifyCallback(void *data)
> > > ++{
> > > ++  *static_cast<bool *>(data) =3D true;
> > > ++}
> > > ++
> > > ++TEST_P(MockTCPSingleTryStayOpenTest,
> > ReconfigureInPendingWriteFailureCallback) {
> > > ++  DNSPacket rsp;
> > > ++  rsp.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("www.google.com", T_A))
> > > ++    .add_answer(new DNSARR("www.google.com", 100, {2, 3, 4, 5}));
> > > ++  ON_CALL(server_, OnRequest("www.google.com", T_A))
> > > ++    .WillByDefault(SetReply(&server_, &rsp));
> > > ++
> > > ++  /* Answered, so the TCP connection is connected; STAYOPEN keeps
> it. */
> > > ++  QueryResult first;
> > > ++  ares_query_dnsrec(channel_, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    QueryCallback, &first, NULL);
> > > ++  Process();
> > > ++  EXPECT_TRUE(first.done_);
> > > ++
> > > ++  /* From here writes on that connection wait for
> ares_process_pending_write.
> > */
> > > ++  bool pending =3D false;
> > > ++  ares_set_pending_write_cb(channel_, PendingWriteNotifyCallback,
> > &pending);
> > > ++
> > > ++  CancelInCbData data;
> > > ++  data.channel =3D channel_;
> > > ++  data.done    =3D false;
> > > ++  data.cbs     =3D 0;
> > > ++  ares_query_dnsrec(channel_, "www.example.com", ARES_CLASS_IN,
> > > ++                    ARES_REC_TYPE_A, ReconfigureServersCallback,
> &data,
> > NULL);
> > > ++  EXPECT_TRUE(pending);
> > > ++  EXPECT_FALSE(data.done);
> > > ++
> > > ++  /* ares_set_socket_functions() stores the pointer rather than
> copying it. */
> > > ++  static ares_socket_functions sock_funcs;
> > > ++  memset(&sock_funcs, 0, sizeof(sock_funcs));
> > > ++  sock_funcs.asendv =3D ares_sendv_fail;
> > > ++  ares_set_socket_functions(channel_, &sock_funcs, NULL);
> > > ++  LibraryTest::SetFailSend();
> > > ++
> > > ++  ares_process_pending_write(channel_);
> > > ++
> > > ++  EXPECT_TRUE(data.done);
> > > ++  EXPECT_EQ((size_t)1, data.cbs);
> > > ++
> > > ++  ares_set_pending_write_cb(channel_, NULL, NULL);
> > > ++}
> > > ++
> > > ++INSTANTIATE_TEST_SUITE_P(AddressFamilies,
> > MockTCPSingleTryStayOpenTest,
> > > ++                         ::testing::ValuesIn(ares::test::families),
> > > ++                         PrintFamily);
> > > ++
> > > + TEST_P(MockUDPChannelTest, CancelInDestroyCallbackNoUseAfterFree) {
> > > +   CancelInCbData data;
> > > +   data.channel =3D channel_;
> > > +@@ -2898,6 +2978,768 @@ TEST_F(LibraryTest,
> > ReconfigureInConfigureHookNoUseAfterFree) {
> > > +   ares_destroy(chan);
> > > + }
> > > +
> > > ++// Reconfiguring the servers from the application's own send
> function.  The
> > > ++// write itself goes through: the send function reports every byte
> sent.  But
> > > ++// the reconfiguration has already closed the connection being
> written to and
> > > ++// removed its server, so the query must be moved to the new
> configuration
> > > ++// rather than attached to the closed connection -- where it would
> sit on a
> > > ++// list that is freed once the call unwinds, in flight on no socket=
.
> > > ++struct ReconfigureFromSendData {
> > > ++  ares_channel_t *channel;
> > > ++  bool            done;
> > > ++  int             status;
> > > ++};
> > > ++
> > > ++static ares_ssize_t ReconfigureSendv(ares_socket_t fd, const struct
> iovec
> > *iov,
> > > ++                                     int iovcnt, void *user_data)
> > > ++{
> > > ++  ReconfigureFromSendData *d =3D
> > > ++    static_cast<ReconfigureFromSendData *>(user_data);
> > > ++  ares_ssize_t len =3D 0;
> > > ++  (void)fd;
> > > ++  for (int i =3D 0; i < iovcnt; i++) {
> > > ++    len +=3D static_cast<ares_ssize_t>(iov[i].iov_len);
> > > ++  }
> > > ++  // Frees the server this connection belongs to.  Reconfiguring to
> the same
> > > ++  // list again is a no-op, so the retry is written normally.
> > > ++  ares_set_servers_csv(d->channel, "127.0.0.1:53056");
> > > ++  return len;
> > > ++}
> > > ++
> > > ++static void ReconfigureFromSendCallback(void *arg, ares_status_t
> status,
> > > ++                                        size_t
>  timeouts,
> > > ++                                        const ares_dns_record_t
> *dnsrec)
> > > ++{
> > > ++  ReconfigureFromSendData *d =3D static_cast<ReconfigureFromSendDat=
a
> > *>(arg);
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  d->done   =3D true;
> > > ++  d->status =3D static_cast<int>(status);
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, ReconfigureInSuccessfulSendNoUseAfterFree) {
> > > ++  ares_channel_t         *chan =3D nullptr;
> > > ++  struct ares_options     opts;
> > > ++  int                     optmask =3D 0;
> > > ++  ares_socket_functions   funcs;
> > > ++  ReconfigureFromSendData data;
> > > ++  ares_socket_t           socks[ARES_GETSOCK_MAXNUM];
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  opts.flags  =3D ARES_FLAG_NOSEARCH;
> > > ++  optmask    |=3D ARES_OPT_FLAGS;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&chan, &opts,
> > optmask));
> > > ++  ASSERT_NE(nullptr, chan);
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,
> > "127.0.0.1:53055"));
> > > ++
> > > ++  data.channel =3D chan;
> > > ++  data.done    =3D false;
> > > ++  data.status  =3D ARES_SUCCESS;
> > > ++  memset(&funcs, 0, sizeof(funcs));
> > > ++  funcs.asendv =3D ReconfigureSendv;
> > > ++  ares_set_socket_functions(chan, &funcs, &data);
> > > ++
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    ReconfigureFromSendCallback, &data, NULL);
> > > ++
> > > ++  // Moved to the new server and written there, so it is in flight
> on a
> > > ++  // socket the application can watch.
> > > ++  EXPECT_FALSE(data.done);
> > > ++  EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));
> > > ++  EXPECT_NE(0, ares_getsock(chan, socks, ARES_GETSOCK_MAXNUM));
> > > ++
> > > ++  ares_cancel(chan);
> > > ++  EXPECT_TRUE(data.done);
> > > ++  EXPECT_EQ(ARES_ECANCELLED, data.status);
> > > ++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++// The connection the send function tore down has already been
> reported as
> > > ++// closed, and its descriptor closed or handed to that
> notification.  Nothing
> > > ++// after the send may report socket state for it: doing so names
> > > ++// ARES_SOCKET_BAD, a descriptor the application was never given.
> > > ++struct BadSocketStateData {
> > > ++  size_t calls;
> > > ++  size_t bad;
> > > ++};
> > > ++
> > > ++static void BadSocketStateCallback(void *data, ares_socket_t
> socket_fd,
> > > ++                                   int readable, int writable)
> > > ++{
> > > ++  BadSocketStateData *d =3D static_cast<BadSocketStateData *>(data)=
;
> > > ++  (void)readable;
> > > ++  (void)writable;
> > > ++  d->calls++;
> > > ++  if (socket_fd =3D=3D ARES_SOCKET_BAD) {
> > > ++    d->bad++;
> > > ++  }
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, ReconfigureInSendReportsNoBadSocket) {
> > > ++  ares_channel_t         *chan =3D nullptr;
> > > ++  struct ares_options     opts;
> > > ++  int                     optmask =3D 0;
> > > ++  ares_socket_functions   funcs;
> > > ++  ReconfigureFromSendData data;
> > > ++  BadSocketStateData      sock;
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  memset(&sock, 0, sizeof(sock));
> > > ++  opts.flags               =3D ARES_FLAG_NOSEARCH;
> > > ++  optmask                 |=3D ARES_OPT_FLAGS;
> > > ++  opts.sock_state_cb       =3D BadSocketStateCallback;
> > > ++  opts.sock_state_cb_data  =3D &sock;
> > > ++  optmask                 |=3D ARES_OPT_SOCK_STATE_CB;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&chan, &opts,
> > optmask));
> > > ++  ASSERT_NE(nullptr, chan);
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,
> > "127.0.0.1:53055"));
> > > ++
> > > ++  data.channel =3D chan;
> > > ++  data.done    =3D false;
> > > ++  data.status  =3D ARES_SUCCESS;
> > > ++  memset(&funcs, 0, sizeof(funcs));
> > > ++  funcs.asendv =3D ReconfigureSendv;
> > > ++  ares_set_socket_functions(chan, &funcs, &data);
> > > ++
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    ReconfigureFromSendCallback, &data, NULL);
> > > ++  ares_cancel(chan);
> > > ++  EXPECT_TRUE(data.done);
> > > ++
> > > ++  EXPECT_NE((size_t)0, sock.calls);
> > > ++  EXPECT_EQ((size_t)0, sock.bad);
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++// The same reconfiguration from the send function, reached through
> the
> > > ++// deferred TCP write: ares_set_pending_write_cb() queues the write
> and the
> > > ++// application later flushes it with ares_process_pending_write().
> That flush
> > > ++// is its own outermost library call, so the connection and server
> the
> > > ++// reconfiguration closes must stay readable until it returns, and
> its walk of
> > > ++// the server list must not step from a list node the
> reconfiguration freed.
> > > ++// Covers both a send that reports success and one that fails.  A
> failure
> > > ++// on the removed server must not be charged to the server that
> replaced it.
> > > ++struct PendingWriteReconfigureData {
> > > ++  ares_channel_t *channel;
> > > ++  bool            reconfigure;
> > > ++  bool            fail;
> > > ++  bool            pending;
> > > ++  size_t          done;
> > > ++  size_t          server_failures;
> > > ++};
> > > ++
> > > ++static int PendingWriteConnect(ares_socket_t fd, const struct
> sockaddr *addr,
> > > ++                               ares_socklen_t addrlen, void
> *user_data)
> > > ++{
> > > ++  (void)fd;
> > > ++  (void)addr;
> > > ++  (void)addrlen;
> > > ++  (void)user_data;
> > > ++  // Pretend the connection is in progress; the test signals it
> writable.
> > > ++  return 0;
> > > ++}
> > > ++
> > > ++static ares_ssize_t PendingWriteSendv(ares_socket_t fd, const struc=
t
> iovec
> > *iov,
> > > ++                                      int iovcnt, void *user_data)
> > > ++{
> > > ++  PendingWriteReconfigureData *d =3D
> > > ++    static_cast<PendingWriteReconfigureData *>(user_data);
> > > ++  ares_ssize_t len =3D 0;
> > > ++  (void)fd;
> > > ++  for (int i =3D 0; i < iovcnt; i++) {
> > > ++    len +=3D static_cast<ares_ssize_t>(iov[i].iov_len);
> > > ++  }
> > > ++  if (!d->reconfigure) {
> > > ++    return len;
> > > ++  }
> > > ++  d->reconfigure =3D false;
> > > ++  // Closes this connection and frees its server.
> > > ++  ares_set_servers_csv(d->channel, "127.0.0.1:53056");
> > > ++  if (d->fail) {
> > > ++#ifdef USE_WINSOCK
> > > ++    WSASetLastError(WSAECONNREFUSED);
> > > ++#else
> > > ++    errno =3D ECONNREFUSED;
> > > ++#endif
> > > ++    return -1;
> > > ++  }
> > > ++  return len;
> > > ++}
> > > ++
> > > ++static void PendingWriteNotify(void *user_data)
> > > ++{
> > > ++  PendingWriteReconfigureData *d =3D
> > > ++    static_cast<PendingWriteReconfigureData *>(user_data);
> > > ++  d->pending =3D true;
> > > ++}
> > > ++
> > > ++static void PendingWriteServerState(const char *server_string,
> > > ++                                    ares_bool_t success, int flags,
> > > ++                                    void *user_data)
> > > ++{
> > > ++  PendingWriteReconfigureData *d =3D
> > > ++    static_cast<PendingWriteReconfigureData *>(user_data);
> > > ++  (void)server_string;
> > > ++  (void)flags;
> > > ++  if (!success) {
> > > ++    d->server_failures++;
> > > ++  }
> > > ++}
> > > ++
> > > ++static void PendingWriteCallback(void *arg, ares_status_t status,
> > > ++                                 size_t                   timeouts,
> > > ++                                 const ares_dns_record_t *dnsrec)
> > > ++{
> > > ++  PendingWriteReconfigureData *d =3D
> > > ++    static_cast<PendingWriteReconfigureData *>(arg);
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  EXPECT_EQ(ARES_ECANCELLED, status);
> > > ++  d->done++;
> > > ++}
> > > ++
> > > ++static void ReconfigureInPendingWrite(bool fail)
> > > ++{
> > > ++  ares_channel_t             *chan =3D nullptr;
> > > ++  struct ares_options         opts;
> > > ++  int                         optmask =3D 0;
> > > ++  ares_socket_functions       funcs;
> > > ++  PendingWriteReconfigureData data;
> > > ++  ares_socket_t               socks[ARES_GETSOCK_MAXNUM];
> > > ++  int                         bitmask;
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  opts.flags  =3D ARES_FLAG_NOSEARCH | ARES_FLAG_USEVC;
> > > ++  optmask    |=3D ARES_OPT_FLAGS;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&chan, &opts,
> > optmask));
> > > ++  ASSERT_NE(nullptr, chan);
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,
> > "127.0.0.1:53055"));
> > > ++
> > > ++  data.channel         =3D chan;
> > > ++  data.reconfigure     =3D false;
> > > ++  data.fail            =3D fail;
> > > ++  data.pending         =3D false;
> > > ++  data.done            =3D 0;
> > > ++  data.server_failures =3D 0;
> > > ++  memset(&funcs, 0, sizeof(funcs));
> > > ++  funcs.aconnect =3D PendingWriteConnect;
> > > ++  funcs.asendv   =3D PendingWriteSendv;
> > > ++  ares_set_socket_functions(chan, &funcs, &data);
> > > ++  ares_set_pending_write_cb(chan, PendingWriteNotify, &data);
> > > ++  ares_set_server_state_callback(chan, PendingWriteServerState,
> &data);
> > > ++
> > > ++  // The first query opens the connection; its write waits for it t=
o
> connect.
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    PendingWriteCallback, &data, NULL);
> > > ++  bitmask =3D ares_getsock(chan, socks, ARES_GETSOCK_MAXNUM);
> > > ++  ASSERT_NE(0, ARES_GETSOCK_WRITABLE(bitmask, 0));
> > > ++
> > > ++  // Report it connected, which writes the first query.
> > > ++  ares_process_fd(chan, ARES_SOCKET_BAD, socks[0]);
> > > ++  EXPECT_FALSE(data.pending);
> > > ++
> > > ++  // Now connected, so the second query's write is deferred to the
> > > ++  // application.
> > > ++  ares_query_dnsrec(chan, "www.example.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    PendingWriteCallback, &data, NULL);
> > > ++  EXPECT_TRUE(data.pending);
> > > ++
> > > ++  data.reconfigure =3D true;
> > > ++  ares_process_pending_write(chan);
> > > ++  EXPECT_FALSE(data.reconfigure);
> > > ++
> > > ++  // Both queries were moved to the new server, which has not faile=
d.
> > > ++  EXPECT_EQ((size_t)0, data.done);
> > > ++  EXPECT_EQ((size_t)0, data.server_failures);
> > > ++  EXPECT_EQ((size_t)2, ares_queue_active_queries(chan));
> > > ++
> > > ++  ares_cancel(chan);
> > > ++  EXPECT_EQ((size_t)2, data.done);
> > > ++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest,
> ReconfigureInSuccessfulPendingWriteNoUseAfterFree)
> > {
> > > ++  ReconfigureInPendingWrite(false);
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, ReconfigureInFailedPendingWriteNoUseAfterFree) =
{
> > > ++  ReconfigureInPendingWrite(true);
> > > ++}
> > > ++
> > > ++// The pending-write callback is application code too, and runs onc=
e
> the
> > query
> > > ++// has been buffered on the connection.  Reconfiguring from it
> closes that
> > > ++// connection, so the query must be requeued rather than attached t=
o
> it.
> > > ++static void PendingWriteReconfigureNotify(void *user_data)
> > > ++{
> > > ++  PendingWriteReconfigureData *d =3D
> > > ++    static_cast<PendingWriteReconfigureData *>(user_data);
> > > ++  d->pending =3D true;
> > > ++  if (d->reconfigure) {
> > > ++    d->reconfigure =3D false;
> > > ++    // Closes the connection the query was just buffered on.
> > > ++    ares_set_servers_csv(d->channel, "127.0.0.1:53056");
> > > ++  }
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, ReconfigureInPendingWriteCallbackNoUseAfterFree=
)
> {
> > > ++  ares_channel_t             *chan =3D nullptr;
> > > ++  struct ares_options         opts;
> > > ++  int                         optmask =3D 0;
> > > ++  ares_socket_functions       funcs;
> > > ++  PendingWriteReconfigureData data;
> > > ++  ares_socket_t               socks[ARES_GETSOCK_MAXNUM];
> > > ++  int                         bitmask;
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  opts.flags  =3D ARES_FLAG_NOSEARCH | ARES_FLAG_USEVC;
> > > ++  optmask    |=3D ARES_OPT_FLAGS;
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&chan, &opts,
> > optmask));
> > > ++  ASSERT_NE(nullptr, chan);
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,
> > "127.0.0.1:53055"));
> > > ++
> > > ++  data.channel         =3D chan;
> > > ++  data.reconfigure     =3D false;
> > > ++  data.fail            =3D false;
> > > ++  data.pending         =3D false;
> > > ++  data.done            =3D 0;
> > > ++  data.server_failures =3D 0;
> > > ++  memset(&funcs, 0, sizeof(funcs));
> > > ++  funcs.aconnect =3D PendingWriteConnect;
> > > ++  funcs.asendv   =3D PendingWriteSendv;
> > > ++  ares_set_socket_functions(chan, &funcs, &data);
> > > ++  ares_set_pending_write_cb(chan, PendingWriteReconfigureNotify,
> &data);
> > > ++
> > > ++  // The first query opens the connection; its write waits for it t=
o
> connect.
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    PendingWriteCallback, &data, NULL);
> > > ++  bitmask =3D ares_getsock(chan, socks, ARES_GETSOCK_MAXNUM);
> > > ++  ASSERT_NE(0, ARES_GETSOCK_WRITABLE(bitmask, 0));
> > > ++
> > > ++  // Report it connected, which writes the first query.
> > > ++  ares_process_fd(chan, ARES_SOCKET_BAD, socks[0]);
> > > ++  EXPECT_FALSE(data.pending);
> > > ++
> > > ++  // Now connected, so the second query is buffered and the
> pending-write
> > > ++  // callback runs, reconfiguring the servers.
> > > ++  data.reconfigure =3D true;
> > > ++  ares_query_dnsrec(chan, "www.example.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    PendingWriteCallback, &data, NULL);
> > > ++  EXPECT_TRUE(data.pending);
> > > ++  EXPECT_FALSE(data.reconfigure);
> > > ++
> > > ++  // Both queries were moved to the new server.
> > > ++  EXPECT_EQ((size_t)0, data.done);
> > > ++  EXPECT_EQ((size_t)2, ares_queue_active_queries(chan));
> > > ++
> > > ++  ares_cancel(chan);
> > > ++  EXPECT_EQ((size_t)2, data.done);
> > > ++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++// Fake socket functions, installed with
> ares_set_socket_functions_ex(), that
> > > ++// never touch a real descriptor.  Each test arms one of them to
> reconfigure
> > > ++// the servers part-way through c-ares's use of a connection, and
> they count
> > > ++// every call that names ARES_SOCKET_BAD, which a closed connection
> > must never
> > > ++// pass to application code.
> > > ++struct FakeSockData {
> > > ++  ares_channel_t    *channel;
> > > ++  ares_socket_t      next_fd;
> > > ++  bool               tfo;
> > > ++  bool               getsockname_fail_first;
> > > ++  ares_socket_t      getsockname_last_fd;
> > > ++  bool               getsockname_reconfigure;
> > > ++  bool               recv_reconfigure;
> > > ++  bool               recv_answer_then_reconfigure;
> > > ++  bool               recv_answered;
> > > ++  bool               recv_answer;
> > > ++  bool               close_reconfigure;
> > > ++  unsigned char      query[512];
> > > ++  size_t             query_len;
> > > ++  struct sockaddr_in peer;
> > > ++  size_t             recv_calls;
> > > ++  size_t             bad_fd_calls;
> > > ++  size_t             sock_state_bad;
> > > ++  bool               done;
> > > ++  int                status;
> > > ++};
> > > ++
> > > ++static void FakeSockSetErrno(bool wouldblock)
> > > ++{
> > > ++#ifdef USE_WINSOCK
> > > ++  WSASetLastError(wouldblock ? WSAEWOULDBLOCK : WSAENOTCONN);
> > > ++#else
> > > ++  errno =3D wouldblock ? EAGAIN : ENOTCONN;
> > > ++#endif
> > > ++}
> > > ++
> > > ++static ares_socket_t FakeSockSocket(int domain, int type, int
> protocol,
> > > ++                                    void *user_data)
> > > ++{
> > > ++  FakeSockData *d =3D static_cast<FakeSockData *>(user_data);
> > > ++  (void)domain;
> > > ++  (void)type;
> > > ++  (void)protocol;
> > > ++  return d->next_fd++;
> > > ++}
> > > ++
> > > ++static int FakeSockClose(ares_socket_t sock, void *user_data)
> > > ++{
> > > ++  FakeSockData *d =3D static_cast<FakeSockData *>(user_data);
> > > ++  if (sock =3D=3D ARES_SOCKET_BAD) {
> > > ++    d->bad_fd_calls++;
> > > ++  }
> > > ++  if (d->close_reconfigure) {
> > > ++    d->close_reconfigure =3D false;
> > > ++    // Frees the server this connection belonged to.
> > > ++    ares_set_servers_csv(d->channel, "127.0.0.1:53056");
> > > ++  }
> > > ++  return 0;
> > > ++}
> > > ++
> > > ++static int FakeSockSetsockopt(ares_socket_t sock, ares_socket_opt_t
> opt,
> > > ++                              const void *val, ares_socklen_t
> val_size,
> > > ++                              void *user_data)
> > > ++{
> > > ++  FakeSockData *d =3D static_cast<FakeSockData *>(user_data);
> > > ++  (void)sock;
> > > ++  (void)val;
> > > ++  (void)val_size;
> > > ++  if (opt =3D=3D ARES_SOCKET_OPT_TCP_FASTOPEN && !d->tfo) {
> > > ++    return -1;
> > > ++  }
> > > ++  return 0;
> > > ++}
> > > ++
> > > ++static int FakeSockConnect(ares_socket_t sock, const struct sockadd=
r
> > *address,
> > > ++                           ares_socklen_t address_len, unsigned int
> flags,
> > > ++                           void *user_data)
> > > ++{
> > > ++  FakeSockData *d =3D static_cast<FakeSockData *>(user_data);
> > > ++  (void)sock;
> > > ++  (void)flags;
> > > ++  if (address->sa_family =3D=3D AF_INET && address_len >=3D
> sizeof(d->peer)) {
> > > ++    memcpy(&d->peer, address, sizeof(d->peer));
> > > ++  }
> > > ++  return 0;
> > > ++}
> > > ++
> > > ++static ares_ssize_t FakeSockRecvfrom(ares_socket_t sock, void
> *buffer,
> > > ++                                     size_t length, int flags,
> > > ++                                     struct sockaddr *address,
> > > ++                                     ares_socklen_t  *address_len,
> > > ++                                     void            *user_data)
> > > ++{
> > > ++  FakeSockData *d =3D static_cast<FakeSockData *>(user_data);
> > > ++  (void)flags;
> > > ++  d->recv_calls++;
> > > ++  if (sock =3D=3D ARES_SOCKET_BAD) {
> > > ++    d->bad_fd_calls++;
> > > ++  }
> > > ++  if (d->query_len < 12 || length < d->query_len) {
> > > ++    FakeSockSetErrno(true);
> > > ++    return -1;
> > > ++  }
> > > ++  if (d->recv_answer_then_reconfigure) {
> > > ++    // Answer first; reconfigure on the next call, which has nothin=
g
> to read.
> > > ++    if (d->recv_answered) {
> > > ++      d->recv_answer_then_reconfigure =3D false;
> > > ++      ares_set_servers_csv(d->channel, "127.0.0.1:53056");
> > > ++      FakeSockSetErrno(true);
> > > ++      return -1;
> > > ++    }
> > > ++    d->recv_answered =3D true;
> > > ++  } else if (d->recv_reconfigure) {
> > > ++    d->recv_reconfigure =3D false;
> > > ++    // Frees the server this connection belongs to.
> > > ++    ares_set_servers_csv(d->channel, "127.0.0.1:53056");
> > > ++  } else if (d->recv_answer) {
> > > ++    d->recv_answer =3D false;
> > > ++  } else {
> > > ++    FakeSockSetErrno(true);
> > > ++    return -1;
> > > ++  }
> > > ++  // Answer the query: the same message with QR set, no records.
> > > ++  memcpy(buffer, d->query, d->query_len);
> > > ++  static_cast<unsigned char *>(buffer)[2] |=3D 0x80;
> > > ++  if (address !=3D NULL && address_len !=3D NULL &&
> > > ++      *address_len >=3D (ares_socklen_t)sizeof(d->peer)) {
> > > ++    memcpy(address, &d->peer, sizeof(d->peer));
> > > ++    *address_len =3D sizeof(d->peer);
> > > ++  }
> > > ++  return static_cast<ares_ssize_t>(d->query_len);
> > > ++}
> > > ++
> > > ++static ares_ssize_t FakeSockSendto(ares_socket_t sock, const void
> *buffer,
> > > ++                                   size_t length, int flags,
> > > ++                                   const struct sockaddr *address,
> > > ++                                   ares_socklen_t address_len, void
> *user_data)
> > > ++{
> > > ++  FakeSockData *d =3D static_cast<FakeSockData *>(user_data);
> > > ++  (void)flags;
> > > ++  (void)address;
> > > ++  (void)address_len;
> > > ++  if (sock =3D=3D ARES_SOCKET_BAD) {
> > > ++    d->bad_fd_calls++;
> > > ++  }
> > > ++  if (length <=3D sizeof(d->query)) {
> > > ++    memcpy(d->query, buffer, length);
> > > ++    d->query_len =3D length;
> > > ++  }
> > > ++  return static_cast<ares_ssize_t>(length);
> > > ++}
> > > ++
> > > ++static int FakeSockGetsockname(ares_socket_t sock, struct sockaddr
> > *address,
> > > ++                               ares_socklen_t *address_len, void
> *user_data)
> > > ++{
> > > ++  FakeSockData      *d =3D static_cast<FakeSockData *>(user_data);
> > > ++  struct sockaddr_in sin;
> > > ++  if (sock =3D=3D ARES_SOCKET_BAD) {
> > > ++    d->bad_fd_calls++;
> > > ++  }
> > > ++  // As during TCP Fast Open, before the first write has connected.
> > > ++  if (d->getsockname_fail_first && sock !=3D d->getsockname_last_fd=
) {
> > > ++    d->getsockname_last_fd =3D sock;
> > > ++    FakeSockSetErrno(false);
> > > ++    return -1;
> > > ++  }
> > > ++  if (d->getsockname_reconfigure) {
> > > ++    d->getsockname_reconfigure =3D false;
> > > ++    // Frees the server this connection belongs to.
> > > ++    ares_set_servers_csv(d->channel, "127.0.0.1:53056");
> > > ++  }
> > > ++  if (*address_len < (ares_socklen_t)sizeof(sin)) {
> > > ++    FakeSockSetErrno(false);
> > > ++    return -1;
> > > ++  }
> > > ++  memset(&sin, 0, sizeof(sin));
> > > ++  sin.sin_family      =3D AF_INET;
> > > ++  sin.sin_port        =3D htons(40000);
> > > ++  sin.sin_addr.s_addr =3D htonl(INADDR_LOOPBACK);
> > > ++  memcpy(address, &sin, sizeof(sin));
> > > ++  *address_len =3D sizeof(sin);
> > > ++  return 0;
> > > ++}
> > > ++
> > > ++static void FakeSockStateCallback(void *data, ares_socket_t
> socket_fd,
> > > ++                                  int readable, int writable)
> > > ++{
> > > ++  FakeSockData *d =3D static_cast<FakeSockData *>(data);
> > > ++  (void)readable;
> > > ++  (void)writable;
> > > ++  if (socket_fd =3D=3D ARES_SOCKET_BAD) {
> > > ++    d->sock_state_bad++;
> > > ++  }
> > > ++}
> > > ++
> > > ++static void FakeSockQueryCallback(void *arg, ares_status_t status,
> > > ++                                  size_t                   timeouts=
,
> > > ++                                  const ares_dns_record_t *dnsrec)
> > > ++{
> > > ++  FakeSockData *d =3D static_cast<FakeSockData *>(arg);
> > > ++  (void)timeouts;
> > > ++  (void)dnsrec;
> > > ++  d->done   =3D true;
> > > ++  d->status =3D static_cast<int>(status);
> > > ++}
> > > ++
> > > ++static void FakeSockInit(ares_channel_t **chan, FakeSockData *data,
> > > ++                         int extra_flags, unsigned int
> sockfunc_flags,
> > > ++                         bool sock_state =3D true)
> > > ++{
> > > ++  struct ares_options             opts;
> > > ++  int                             optmask =3D 0;
> > > ++  struct ares_socket_functions_ex funcs;
> > > ++
> > > ++  memset(&opts, 0, sizeof(opts));
> > > ++  opts.flags  =3D ARES_FLAG_NOSEARCH | extra_flags;
> > > ++  optmask    |=3D ARES_OPT_FLAGS;
> > > ++  // A socket-state callback defers the close of a connection's
> descriptor
> > > ++  // until the outermost call unwinds; without one it is closed
> inline.
> > > ++  if (sock_state) {
> > > ++    opts.sock_state_cb       =3D FakeSockStateCallback;
> > > ++    opts.sock_state_cb_data  =3D data;
> > > ++    optmask                 |=3D ARES_OPT_SOCK_STATE_CB;
> > > ++  }
> > > ++  ASSERT_EQ(ARES_SUCCESS, ares_init_options(chan, &opts, optmask));
> > > ++  ASSERT_NE(nullptr, *chan);
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(*chan,
> > "127.0.0.1:53055"));
> > > ++
> > > ++  data->channel             =3D *chan;
> > > ++  data->next_fd             =3D 100;
> > > ++  data->getsockname_last_fd =3D ARES_SOCKET_BAD;
> > > ++
> > > ++  memset(&funcs, 0, sizeof(funcs));
> > > ++  funcs.version      =3D 1;
> > > ++  funcs.flags        =3D sockfunc_flags;
> > > ++  funcs.asocket      =3D FakeSockSocket;
> > > ++  funcs.aclose       =3D FakeSockClose;
> > > ++  funcs.asetsockopt  =3D FakeSockSetsockopt;
> > > ++  funcs.aconnect     =3D FakeSockConnect;
> > > ++  funcs.arecvfrom    =3D FakeSockRecvfrom;
> > > ++  funcs.asendto      =3D FakeSockSendto;
> > > ++  funcs.agetsockname =3D FakeSockGetsockname;
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_socket_functions_ex(*chan,
> > &funcs, data));
> > > ++}
> > > ++
> > > ++// The getsockname function runs for every new connection, after th=
e
> checks
> > > ++// that follow the socket-configure and socket-create callbacks.
> Reconfiguring
> > > ++// from it must not leave the connection registered on the removed
> server.
> > > ++TEST_F(LibraryTest, ReconfigureInGetsocknameNoUseAfterFree) {
> > > ++  ares_channel_t *chan =3D nullptr;
> > > ++  FakeSockData    data;
> > > ++
> > > ++  memset(&data, 0, sizeof(data));
> > > ++  FakeSockInit(&chan, &data, 0, 0);
> > > ++  data.getsockname_reconfigure =3D true;
> > > ++
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    FakeSockQueryCallback, &data, NULL);
> > > ++  EXPECT_FALSE(data.getsockname_reconfigure);
> > > ++
> > > ++  // The first connection's descriptor: no longer known to the
> channel.
> > > ++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
> > > ++
> > > ++  // Moved to the new server.
> > > ++  EXPECT_FALSE(data.done);
> > > ++  EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));
> > > ++
> > > ++  ares_cancel(chan);
> > > ++  EXPECT_TRUE(data.done);
> > > ++  EXPECT_EQ(ARES_ECANCELLED, data.status);
> > > ++  EXPECT_EQ((size_t)0, data.bad_fd_calls);
> > > ++  EXPECT_EQ((size_t)0, data.sock_state_bad);
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++// With TCP Fast Open the first getsockname may fail, and is retrie=
d
> after the
> > > ++// first write -- from inside ares_conn_write(), after the send
> function has
> > > ++// returned.  Reconfiguring from that retry closes the connection
> the query was
> > > ++// just written on.
> > > ++TEST_F(LibraryTest, ReconfigureInFastOpenGetsocknameNoUseAfterFree)=
 {
> > > ++  ares_channel_t *chan =3D nullptr;
> > > ++  FakeSockData    data;
> > > ++
> > > ++  memset(&data, 0, sizeof(data));
> > > ++  FakeSockInit(&chan, &data, ARES_FLAG_USEVC, 0);
> > > ++  data.tfo                     =3D true;
> > > ++  data.getsockname_fail_first  =3D true;
> > > ++  data.getsockname_reconfigure =3D true;
> > > ++
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    FakeSockQueryCallback, &data, NULL);
> > > ++  EXPECT_FALSE(data.getsockname_reconfigure);
> > > ++
> > > ++  // Moved to the new server.
> > > ++  EXPECT_FALSE(data.done);
> > > ++  EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));
> > > ++  EXPECT_EQ((size_t)0, data.sock_state_bad);
> > > ++
> > > ++  ares_cancel(chan);
> > > ++  EXPECT_TRUE(data.done);
> > > ++  EXPECT_EQ(ARES_ECANCELLED, data.status);
> > > ++  EXPECT_EQ((size_t)0, data.bad_fd_calls);
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++// A non-blocking receive function that reconfigures the servers an=
d
> returns
> > > ++// an answer.  The connection it read from is closed, so the answer
> must be
> > > ++// dropped -- the query has already moved to the new server -- and
> the
> > > ++// receive function must not be called again on the closed
> connection.
> > > ++TEST_F(LibraryTest, ReconfigureInRecvDropsStaleAnswer) {
> > > ++  ares_channel_t *chan =3D nullptr;
> > > ++  FakeSockData    data;
> > > ++
> > > ++  memset(&data, 0, sizeof(data));
> > > ++  FakeSockInit(&chan, &data, 0,
> > ARES_SOCKFUNC_FLAG_NONBLOCKING);
> > > ++
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    FakeSockQueryCallback, &data, NULL);
> > > ++  ASSERT_NE((size_t)0, data.query_len);
> > > ++
> > > ++  data.recv_reconfigure =3D true;
> > > ++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
> > > ++  EXPECT_FALSE(data.recv_reconfigure);
> > > ++
> > > ++  EXPECT_EQ((size_t)1, data.recv_calls);
> > > ++  EXPECT_EQ((size_t)0, data.bad_fd_calls);
> > > ++  // Still in flight on the new server.
> > > ++  EXPECT_FALSE(data.done);
> > > ++  EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));
> > > ++
> > > ++  ares_cancel(chan);
> > > ++  EXPECT_TRUE(data.done);
> > > ++  EXPECT_EQ(ARES_ECANCELLED, data.status);
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++// As above, but the answer comes from an earlier receive call, and
> a later
> > > ++// call -- which has nothing more to read -- reconfigures the
> servers.  The
> > > ++// answer is already buffered on the connection that call tore down=
,
> and must
> > > ++// be dropped with it.
> > > ++TEST_F(LibraryTest, ReconfigureInRecvDropsBufferedAnswer) {
> > > ++  ares_channel_t *chan =3D nullptr;
> > > ++  FakeSockData    data;
> > > ++
> > > ++  memset(&data, 0, sizeof(data));
> > > ++  FakeSockInit(&chan, &data, 0,
> > ARES_SOCKFUNC_FLAG_NONBLOCKING);
> > > ++
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    FakeSockQueryCallback, &data, NULL);
> > > ++  ASSERT_NE((size_t)0, data.query_len);
> > > ++
> > > ++  data.recv_answer_then_reconfigure =3D true;
> > > ++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
> > > ++  EXPECT_FALSE(data.recv_answer_then_reconfigure);
> > > ++
> > > ++  EXPECT_EQ((size_t)2, data.recv_calls);
> > > ++  EXPECT_EQ((size_t)0, data.bad_fd_calls);
> > > ++  // Still in flight on the new server.
> > > ++  EXPECT_FALSE(data.done);
> > > ++  EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));
> > > ++
> > > ++  ares_cancel(chan);
> > > ++  EXPECT_TRUE(data.done);
> > > ++  EXPECT_EQ(ARES_ECANCELLED, data.status);
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > ++// The close function is application code too.  With no socket-stat=
e
> callback
> > > ++// to carry the descriptor, it runs inline while
> ares_check_cleanup_conns()
> > > ++// walks the server list and each server's connections, closing idl=
e
> ones.
> > > ++// Reconfiguring from it frees the list nodes that walk holds.
> > > ++TEST_F(LibraryTest, ReconfigureInCloseNoUseAfterFree) {
> > > ++  ares_channel_t *chan =3D nullptr;
> > > ++  FakeSockData    data;
> > > ++
> > > ++  memset(&data, 0, sizeof(data));
> > > ++  FakeSockInit(&chan, &data, 0, 0, false);
> > > ++
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    FakeSockQueryCallback, &data, NULL);
> > > ++  ASSERT_NE((size_t)0, data.query_len);
> > > ++
> > > ++  // Answer it; the now idle connection is then closed.
> > > ++  data.recv_answer       =3D true;
> > > ++  data.close_reconfigure =3D true;
> > > ++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
> > > ++  EXPECT_FALSE(data.recv_answer);
> > > ++  EXPECT_FALSE(data.close_reconfigure);
> > > ++
> > > ++  EXPECT_TRUE(data.done);
> > > ++  // The fake answer carries no records.
> > > ++  EXPECT_EQ(ARES_ENODATA, data.status);
> > > ++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
> > > ++  EXPECT_EQ((size_t)0, data.bad_fd_calls);
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > + // The second route to the same freed connection, and the one that
> drove the
> > > + // change from suppressing the idle sweep to deferring the
> notification:
> > > + // reconfiguring the servers from the socket-state callback destroy=
s
> the server
> > > diff --git
> a/meta-oe/recipes-support/c-ares/c-ares/0005-ares_process-only-
> > accept-an-answer-on-the-right-connection.patch
> b/meta-oe/recipes-support/c-
> > ares/c-ares/0005-ares_process-only-accept-an-answer-on-the-right-
> > connection.patch
> > > new file mode 100644
> > > index 0000000000..20fef5d2f0
> > > --- /dev/null
> > > +++
> b/meta-oe/recipes-support/c-ares/c-ares/0005-ares_process-only-accept-
> > an-answer-on-the-right-connection.patch
> > > @@ -0,0 +1,575 @@
> > > +From c8bd9ab53329f66ec0c395a11002a5696669b147 Mon Sep 17 00:00:00
> > 2001
> > > +From: Brad House <brad@brad-house.com>
> > > +Date: Mon, 19 Oct 2026 11:53:54 -0400
> > > +Subject: [PATCH] [Backport v1.34] ares_process: only accept an answe=
r
> on the
> > > + connection its query was sent on (#1361)
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +Backport of b6f8a9b47e17c681e092a74d05d73bbb35c89a39 to `v1.34`. See
> > > +that commit for the full description.
> > > +
> > > +**Conflicts:** `src/lib/ares_socket.h` only =E2=80=94 v1.34 aligns t=
he
> > > +neighbouring prototypes differently. Resolved by taking the new doc
> > > +comments and the `ares_sockaddr_addr_port_eq()` prototype, then
> > > +re-running clang-format for the v1.34 alignment (which also re-wraps
> the
> > > +new `SendData()` declaration in `test/ares-test.h`). All other files
> > > +applied unchanged; the `test/` diffs match main exactly.
> > > +
> > > +**Tests (local, macOS, Debug, Ninja):**
> > > +- ASAN+UBSAN and `-DCARES_WERROR=3DON` builds: `arestest -4
> > > +--gtest_filter=3D'-*Live*'` =E2=80=94 693/693 passed in both.
> > > +- With the `src/` changes reverted, the 4 new test instances fail
> > > +(`UDPAnswerFromWrongPortDropped`,
> > `AnswerOnOtherServerConnectionDropped`
> > > +UDP/TCP, `CookielessAnswerOnOtherServerDropped`); they pass with the=
m.
> > > +- `git clang-format --diff upstream/v1.34` clean. Also tested togeth=
er
> > > +with the other two v1.34 backports (both orders apply cleanly):
> 699/699
> > > +passed under ASAN+UBSAN and `-Werror`.
> > > +
> > > +Signed-off-by: Brad House <brad@brad-house.com>
> > > +Upstream-Status: Backport [https://github.com/c-ares/c-
> > ares/commit/c8bd9ab53329f66ec0c395a11002a5696669b147]
> > > +GHSA: GHSA-fqh5-3x7m-wp44
> > > +---
> > > + src/lib/ares_conn.c    |  11 ++-
> > > + src/lib/ares_process.c |  18 ++++
> > > + src/lib/ares_socket.c  |  24 +++++
> > > + src/lib/ares_socket.h  |  21 ++++
> > > + test/ares-test-mock.cc | 218
> > +++++++++++++++++++++++++++++++++++++++++
> > > + test/ares-test.cc      |  86 +++++++++-------
> > > + test/ares-test.h       |  12 +++
> > > + 7 files changed, 355 insertions(+), 35 deletions(-)
> > > +
> > > +diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c
> > > +index 5e0827fbdf..b868053e62 100644
> > > +--- a/src/lib/ares_conn.c
> > > ++++ b/src/lib/ares_conn.c
> > > +@@ -252,9 +252,16 @@ ares_conn_err_t ares_conn_read(ares_conn_t
> > *conn, void *data, size_t len,
> > > +                            (struct sockaddr *)&sa_storage, &salen,
> read_bytes);
> > > +
> > > + #ifdef HAVE_RECVFROM
> > > ++    /* The socket is connect()ed, so the kernel normally drops
> datagrams from
> > > ++     * any other address or port already.  Application-provided
> socket
> > > ++     * functions might not filter on connect, so also check here
> that the
> > > ++     * datagram came from the server's address and UDP port.  RFC
> 5452
> > > ++     * section 9.1 only requires the address to match; matching the
> port too
> > > ++     * keeps one server from answering for another on the same
> address. */
> > > +     if (err =3D=3D ARES_CONN_ERR_SUCCESS &&
> > > +-        !ares_sockaddr_addr_eq((struct sockaddr *)&sa_storage,
> > > +-                               &conn->server->addr)) {
> > > ++        !ares_sockaddr_addr_port_eq((struct sockaddr *)&sa_storage,
> > > ++                                    &conn->server->addr,
> > > ++                                    conn->server->udp_port)) {
> > > +       err =3D ARES_CONN_ERR_WOULDBLOCK;
> > > +     }
> > > + #endif
> > > +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
> > > +index 5686b077a6..06d0ca507c 100644
> > > +--- a/src/lib/ares_process.c
> > > ++++ b/src/lib/ares_process.c
> > > +@@ -1117,6 +1117,24 @@ static ares_status_t
> > process_answer(ares_channel_t      *channel,
> > > +     goto cleanup;
> > > +   }
> > > +
> > > ++  /* RFC 5452 section 9.1: only accept a response that arrives on t=
he
> > > ++   * connection the query was sent on, and so from the server it wa=
s
> sent to.
> > > ++   * For UDP, ares_conn_read() also drops a datagram whose source
> address
> > or
> > > ++   * port is not the server's; matching the port is hardening beyon=
d
> RFC 5452
> > > ++   * section 9.1, which only requires the address to match.
> Otherwise any
> > > ++   * server we hold a connection to could answer, and get cached, a
> query that
> > > ++   * was only ever sent to some other server, and the cookie check
> below
> > would
> > > ++   * run against the wrong server's cookie state.  Treat it like an
> unknown
> > > ++   * query id, before anything acts on it (cookies, server health,
> the cache).
> > > ++   * Our caller has already consumed the message from the
> connection's
> > buffer,
> > > ++   * so TCP framing stays in sync.  A query not attached to any
> connection
> > > ++   * (query->conn =3D=3D NULL) never matches.  This also drops a la=
te
> answer
> > from
> > > ++   * a server tried before a retry. */
> > > ++  if (query->conn !=3D conn) {
> > > ++    status =3D ARES_SUCCESS;
> > > ++    goto cleanup;
> > > ++  }
> > > ++
> > > +   /* Validate DNS cookie in response. This function may need to
> requeue the
> > > +    * query. */
> > > +   if (ares_cookie_validate(query, rdnsrec, conn, now, requeue)
> > > +diff --git a/src/lib/ares_socket.c b/src/lib/ares_socket.c
> > > +index 4ad3034021..0a12935ab7 100644
> > > +--- a/src/lib/ares_socket.c
> > > ++++ b/src/lib/ares_socket.c
> > > +@@ -127,6 +127,30 @@ ares_bool_t ares_sockaddr_addr_eq(const struct
> > sockaddr  *sa,
> > > +   return ARES_FALSE; /* different */
> > > + }
> > > +
> > > ++ares_bool_t ares_sockaddr_addr_port_eq(const struct sockaddr  *sa,
> > > ++                                       const struct ares_addr *aa,
> > > ++                                       unsigned short          port=
)
> > > ++{
> > > ++  unsigned short sa_port;
> > > ++
> > > ++  if (!ares_sockaddr_addr_eq(sa, aa)) {
> > > ++    return ARES_FALSE;
> > > ++  }
> > > ++
> > > ++  /* ares_sockaddr_addr_eq() only matches AF_INET and AF_INET6 */
> > > ++  if (sa->sa_family =3D=3D AF_INET) {
> > > ++    sa_port =3D (CARES_INADDR_CAST(const struct sockaddr_in *, sa))=
-
> > >sin_port;
> > > ++  } else {
> > > ++    sa_port =3D (CARES_INADDR_CAST(const struct sockaddr_in6 *, sa)=
)-
> > >sin6_port;
> > > ++  }
> > > ++
> > > ++  if (ntohs(sa_port) !=3D port) {
> > > ++    return ARES_FALSE;
> > > ++  }
> > > ++
> > > ++  return ARES_TRUE;
> > > ++}
> > > ++
> > > + ares_conn_err_t ares_socket_write(ares_channel_t *channel,
> ares_socket_t
> > fd,
> > > +                                   const void *data, size_t len,
> size_t *written,
> > > +                                   const struct sockaddr *sa,
> > > +diff --git a/src/lib/ares_socket.h b/src/lib/ares_socket.h
> > > +index 24a99ab331..f7128e3493 100644
> > > +--- a/src/lib/ares_socket.h
> > > ++++ b/src/lib/ares_socket.h
> > > +@@ -139,8 +139,29 @@ typedef enum {
> > > +   ARES_CONN_ERR_FAILURE      =3D 99  /*!< Generic failure */
> > > + } ares_conn_err_t;
> > > +
> > > ++/*! Compare the IP address of a socket address with an ares_addr.
> The port
> > > ++ *  in the socket address is ignored.
> > > ++ *
> > > ++ *  \param[in] sa  Socket address (AF_INET or AF_INET6)
> > > ++ *  \param[in] aa  Address to compare against
> > > ++ *  \return ARES_TRUE if the address families and IP addresses are
> equal,
> > > ++ *          ARES_FALSE otherwise
> > > ++ */
> > > + ares_bool_t     ares_sockaddr_addr_eq(const struct sockaddr  *sa,
> > > +                                       const struct ares_addr *aa);
> > > ++
> > > ++/*! Compare the IP address and port of a socket address with an
> ares_addr
> > and
> > > ++ *  port.
> > > ++ *
> > > ++ *  \param[in] sa    Socket address (AF_INET or AF_INET6)
> > > ++ *  \param[in] aa    Address to compare against
> > > ++ *  \param[in] port  Port to compare against, in host byte order
> > > ++ *  \return ARES_TRUE if the address families, IP addresses and
> ports are
> > > ++ *          equal, ARES_FALSE otherwise
> > > ++ */
> > > ++ares_bool_t     ares_sockaddr_addr_port_eq(const struct sockaddr
> *sa,
> > > ++                                           const struct ares_addr
> *aa,
> > > ++                                           unsigned short
> port);
> > > + ares_status_t   ares_socket_configure(ares_channel_t *channel, int
> family,
> > > +                                       ares_bool_t is_tcp,
> ares_socket_t fd);
> > > + ares_conn_err_t ares_socket_enable_tfo(const ares_channel_t *channe=
l,
> > > +diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc
> > > +index d233f9070f..058dc93001 100644
> > > +--- a/test/ares-test-mock.cc
> > > ++++ b/test/ares-test-mock.cc
> > > +@@ -3363,6 +3363,7 @@ struct FakeSockData {
> > > +   unsigned char      query[512];
> > > +   size_t             query_len;
> > > +   struct sockaddr_in peer;
> > > ++  unsigned short     recv_port; /* network order; 0 reports the
> peer's port */
> > > +   size_t             recv_calls;
> > > +   size_t             bad_fd_calls;
> > > +   size_t             sock_state_bad;
> > > +@@ -3471,6 +3472,9 @@ static ares_ssize_t
> > FakeSockRecvfrom(ares_socket_t sock, void *buffer,
> > > +   if (address !=3D NULL && address_len !=3D NULL &&
> > > +       *address_len >=3D (ares_socklen_t)sizeof(d->peer)) {
> > > +     memcpy(address, &d->peer, sizeof(d->peer));
> > > ++    if (d->recv_port !=3D 0) {
> > > ++      reinterpret_cast<struct sockaddr_in *>(address)->sin_port =3D
> d->recv_port;
> > > ++    }
> > > +     *address_len =3D sizeof(d->peer);
> > > +   }
> > > +   return static_cast<ares_ssize_t>(d->query_len);
> > > +@@ -3710,6 +3714,42 @@ TEST_F(LibraryTest,
> > ReconfigureInRecvDropsBufferedAnswer) {
> > > +   ares_destroy(chan);
> > > + }
> > > +
> > > ++// Socket functions need not filter on connect(), so
> ares_conn_read() checks
> > > ++// a UDP datagram's source itself.  An answer reported from the
> server's
> > > ++// address but another port (here 127.0.0.1:53 for a server at
> > > ++// 127.0.0.1:53055) must be dropped, so that one server cannot
> answer for
> > > ++// another on the same address.  The same answer from the right por=
t
> is then
> > > ++// accepted.
> > > ++TEST_F(LibraryTest, UDPAnswerFromWrongPortDropped) {
> > > ++  ares_channel_t *chan =3D nullptr;
> > > ++  FakeSockData    data;
> > > ++
> > > ++  memset(&data, 0, sizeof(data));
> > > ++  FakeSockInit(&chan, &data, 0,
> > ARES_SOCKFUNC_FLAG_NONBLOCKING);
> > > ++
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    FakeSockQueryCallback, &data, NULL);
> > > ++  ASSERT_NE((size_t)0, data.query_len);
> > > ++  ASSERT_EQ(htons(53055), data.peer.sin_port);
> > > ++
> > > ++  data.recv_port   =3D htons(53);
> > > ++  data.recv_answer =3D true;
> > > ++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
> > > ++  EXPECT_FALSE(data.recv_answer);
> > > ++  EXPECT_FALSE(data.done);
> > > ++  EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));
> > > ++
> > > ++  data.recv_port   =3D 0;
> > > ++  data.recv_answer =3D true;
> > > ++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
> > > ++  EXPECT_FALSE(data.recv_answer);
> > > ++  EXPECT_TRUE(data.done);
> > > ++  // The fake answer carries no records.
> > > ++  EXPECT_EQ(ARES_ENODATA, data.status);
> > > ++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > + // The close function is application code too.  With no socket-stat=
e
> callback
> > > + // to carry the descriptor, it runs inline while
> ares_check_cleanup_conns()
> > > + // walks the server list and each server's connections, closing idl=
e
> ones.
> > > +@@ -5530,5 +5570,183 @@
> > INSTANTIATE_TEST_SUITE_P(TransportModes, ServerRecoveryMultiMockTest,
> > ::testing:
> > > +
> > > + INSTANTIATE_TEST_SUITE_P(TransportModes,
> > ServerRecoveryNoProbeMultiMockTest,
> > ::testing::ValuesIn(ares::test::families_modes), PrintFamilyMode);
> > > +
> > > ++// An answer is only accepted on the connection its query was sent =
on
> > > ++// (RFC 5452 section 9.1).  Two servers: #0 is demoted by a SERVFAI=
L
> so a
> > later
> > > ++// query goes only to #1, while #0's connection stays open
> (STAYOPEN).
> > Server
> > > ++// #0 then answers that query on its own connection.  The answer
> must be
> > > ++// dropped without side effects, and the query must then complete
> normally.
> > > ++class ReplyConnMultiMockTest
> > > ++  : public MockChannelOptsTest,
> > > ++    public ::testing::WithParamInterface< std::pair<int, bool> > {
> > > ++ public:
> > > ++  ReplyConnMultiMockTest()
> > > ++    : MockChannelOptsTest(2, GetParam().first, GetParam().second,
> false,
> > > ++                          FillOptions(&opts_),
> > > ++                          ARES_OPT_FLAGS | ARES_OPT_TRIES |
> > > ++                          ARES_OPT_SERVER_FAILOVER |
> ARES_OPT_NOROTATE)
> > {}
> > > ++
> > > ++  static struct ares_options* FillOptions(struct ares_options *opts=
)
> {
> > > ++    memset(opts, 0, sizeof(struct ares_options));
> > > ++    /* Keep the demoted server's connection open; no DNS 0x20 so th=
e
> replies
> > > ++     * built here match the question exactly */
> > > ++    opts->flags =3D ARES_FLAG_STAYOPEN | ARES_FLAG_EDNS;
> > > ++    /* One try per server: the query goes to #1, then on timeout to
> #0 */
> > > ++    opts->tries =3D 1;
> > > ++    /* Never probe the demoted server, so the query is sent only to
> #1 */
> > > ++    opts->server_failover_opts.retry_chance =3D 0;
> > > ++    opts->server_failover_opts.retry_delay  =3D 10000;
> > > ++    return opts;
> > > ++  }
> > > ++ private:
> > > ++  struct ares_options opts_;
> > > ++};
> > > ++
> > > ++static std::string ReplyConnFirstA(const QueryResult &result)
> > > ++{
> > > ++  const ares_dns_rr_t *rr;
> > > ++  char                 addr[64];
> > > ++
> > > ++  if (result.dnsrec_.dnsrec_ =3D=3D nullptr ||
> > > ++      ares_dns_record_rr_cnt(result.dnsrec_.dnsrec_,
> > ARES_SECTION_ANSWER) =3D=3D 0) {
> > > ++    return "";
> > > ++  }
> > > ++  rr =3D ares_dns_record_rr_get_const(result.dnsrec_.dnsrec_,
> > > ++                                    ARES_SECTION_ANSWER, 0);
> > > ++  if (ares_dns_rr_get_type(rr) !=3D ARES_REC_TYPE_A ||
> > > ++      ares_inet_ntop(AF_INET, ares_dns_rr_get_addr(rr,
> > ARES_RR_A_ADDR), addr,
> > > ++                     sizeof(addr)) =3D=3D nullptr) {
> > > ++    return "";
> > > ++  }
> > > ++  return addr;
> > > ++}
> > > ++
> > > ++TEST_P(ReplyConnMultiMockTest,
> > AnswerOnOtherServerConnectionDropped) {
> > > ++  DNSPacket warm_servfail;
> > > ++  warm_servfail.set_response().set_aa().set_rcode(SERVFAIL)
> > > ++    .add_question(new DNSQuestion("warmup.example", T_A));
> > > ++  DNSPacket warm_ok;
> > > ++  warm_ok.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("warmup.example", T_A))
> > > ++    .add_answer(new DNSARR("warmup.example", 100, {1, 1, 1, 1}));
> > > ++  DNSPacket forged;
> > > ++  forged.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("victim.example", T_A))
> > > ++    .add_answer(new DNSARR("victim.example", 100, {6, 6, 6, 6}));
> > > ++  DNSPacket genuine;
> > > ++  genuine.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("victim.example", T_A))
> > > ++    .add_answer(new DNSARR("victim.example", 100, {1, 2, 3, 4}));
> > > ++  unsigned short qid =3D 0;
> > > ++
> > > ++  /* Demote #0, leaving a connection to it open */
> > > ++  EXPECT_CALL(*servers_[0], OnRequest("warmup.example", T_A))
> > > ++    .WillOnce(SetReply(servers_[0].get(), &warm_servfail));
> > > ++  EXPECT_CALL(*servers_[1], OnRequest("warmup.example", T_A))
> > > ++    .WillOnce(SetReply(servers_[1].get(), &warm_ok));
> > > ++  QueryResult warm;
> > > ++  ares_query_dnsrec(channel_, "warmup.example", ARES_CLASS_IN,
> > > ++                    ARES_REC_TYPE_A, QueryCallback, &warm, NULL);
> > > ++  Process();
> > > ++  ASSERT_TRUE(warm.done_);
> > > ++  ASSERT_EQ(ARES_SUCCESS, warm.status_);
> > > ++
> > > ++  /* The query goes only to #1, which does not answer.  Meanwhile #=
0
> > answers
> > > ++   * it on #0's own connection.  That answer must be dropped, so th=
e
> query
> > > ++   * times out on #1 and is retried on #0, whose genuine answer is
> accepted
> > on
> > > ++   * the same (still in sync, for TCP) connection. */
> > > ++  EXPECT_CALL(*servers_[1], OnRequest("victim.example", T_A))
> > > ++    .WillOnce(InvokeWithoutArgs([&]() {
> > > ++      servers_[0]->SendUnsolicited(&forged, qid);
> > > ++      servers_[1]->SetReplyData(std::vector<byte>());
> > > ++    }));
> > > ++  EXPECT_CALL(*servers_[0], OnRequest("victim.example", T_A))
> > > ++    .WillOnce(SetReply(servers_[0].get(), &genuine));
> > > ++  QueryResult result;
> > > ++  ares_query_dnsrec(channel_, "victim.example", ARES_CLASS_IN,
> > > ++                    ARES_REC_TYPE_A, QueryCallback, &result, &qid);
> > > ++  Process();
> > > ++  ASSERT_TRUE(result.done_);
> > > ++  EXPECT_EQ(ARES_SUCCESS, result.status_);
> > > ++  EXPECT_EQ("1.2.3.4", ReplyConnFirstA(result));
> > > ++  EXPECT_EQ(1, (int)result.timeouts_);
> > > ++}
> > > ++
> > > ++// DNS cookies (RFC 7873) are per-server state, validated against
> the server
> > > ++// the query was sent to.  #1 supports cookies, #0 does not.  A
> cookie-less
> > > ++// answer arriving on #0's connection for a query sent only to #1
> must not be
> > > ++// accepted: it would otherwise be checked against #0's cookie stat=
e
> and
> > pass.
> > > ++class ReplyConnCookieMultiMockTest
> > > ++  : public MockChannelOptsTest,
> > > ++    public ::testing::WithParamInterface<int> {
> > > ++ public:
> > > ++  ReplyConnCookieMultiMockTest()
> > > ++    : MockChannelOptsTest(2, GetParam(), false, false,
> > > ++
> ReplyConnMultiMockTest::FillOptions(&opts_),
> > > ++                          ARES_OPT_FLAGS | ARES_OPT_TRIES |
> > > ++                          ARES_OPT_SERVER_FAILOVER |
> ARES_OPT_NOROTATE)
> > {}
> > > ++ private:
> > > ++  struct ares_options opts_;
> > > ++};
> > > ++
> > > ++TEST_P(ReplyConnCookieMultiMockTest,
> > CookielessAnswerOnOtherServerDropped) {
> > > ++  std::vector<byte> server_cookie =3D { 1, 2, 3, 4, 5, 6, 7, 8 };
> > > ++  DNSPacket warm_servfail;
> > > ++  warm_servfail.set_response().set_aa().set_rcode(SERVFAIL)
> > > ++    .add_question(new DNSQuestion("warmup.example", T_A));
> > > ++  DNSPacket warm_ok;
> > > ++  warm_ok.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("warmup.example", T_A))
> > > ++    .add_answer(new DNSARR("warmup.example", 100, {1, 1, 1, 1}))
> > > ++    .add_additional(new DNSOptRR(0, 0, 0, 1280, { }, server_cookie,
> false));
> > > ++  DNSPacket forged;
> > > ++  forged.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("victim.example", T_A))
> > > ++    .add_answer(new DNSARR("victim.example", 100, {6, 6, 6, 6}));
> > > ++  DNSPacket genuine;
> > > ++  genuine.set_response().set_aa()
> > > ++    .add_question(new DNSQuestion("victim.example", T_A))
> > > ++    .add_answer(new DNSARR("victim.example", 100, {1, 2, 3, 4}));
> > > ++  unsigned short qid =3D 0;
> > > ++
> > > ++  /* #0 answers without a cookie (and is demoted); #1 answers with
> one, so
> > > ++   * #1's cookie state becomes SUPPORTED */
> > > ++  EXPECT_CALL(*servers_[0], OnRequest("warmup.example", T_A))
> > > ++    .WillOnce(SetReply(servers_[0].get(), &warm_servfail));
> > > ++  EXPECT_CALL(*servers_[1], OnRequest("warmup.example", T_A))
> > > ++    .WillOnce(SetReply(servers_[1].get(), &warm_ok));
> > > ++  QueryResult warm;
> > > ++  ares_query_dnsrec(channel_, "warmup.example", ARES_CLASS_IN,
> > > ++                    ARES_REC_TYPE_A, QueryCallback, &warm, NULL);
> > > ++  Process();
> > > ++  ASSERT_TRUE(warm.done_);
> > > ++  ASSERT_EQ(ARES_SUCCESS, warm.status_);
> > > ++  size_t cookie_len =3D 0;
> > > ++  fetch_server_cookie(warm.dnsrec_.dnsrec_, &cookie_len);
> > > ++  ASSERT_EQ(server_cookie.size(), cookie_len);
> > > ++
> > > ++  /* The cookie-protected query goes only to #1; a cookie-less
> answer for it
> > > ++   * arrives on #0's connection and must be dropped.  The retry to
> #0 is then
> > > ++   * legitimately answered by #0, which does not use cookies. */
> > > ++  EXPECT_CALL(*servers_[1], OnRequest("victim.example", T_A))
> > > ++    .WillOnce(InvokeWithoutArgs([&]() {
> > > ++      servers_[0]->SendUnsolicited(&forged, qid);
> > > ++      servers_[1]->SetReplyData(std::vector<byte>());
> > > ++    }));
> > > ++  EXPECT_CALL(*servers_[0], OnRequest("victim.example", T_A))
> > > ++    .WillOnce(SetReply(servers_[0].get(), &genuine));
> > > ++  QueryResult result;
> > > ++  ares_query_dnsrec(channel_, "victim.example", ARES_CLASS_IN,
> > > ++                    ARES_REC_TYPE_A, QueryCallback, &result, &qid);
> > > ++  Process();
> > > ++  ASSERT_TRUE(result.done_);
> > > ++  EXPECT_EQ(ARES_SUCCESS, result.status_);
> > > ++  EXPECT_EQ("1.2.3.4", ReplyConnFirstA(result));
> > > ++  EXPECT_EQ(1, (int)result.timeouts_);
> > > ++}
> > > ++
> > > ++INSTANTIATE_TEST_SUITE_P(TransportModes, ReplyConnMultiMockTest,
> > ::testing::ValuesIn(ares::test::families_modes), PrintFamilyMode);
> > > ++
> > > ++INSTANTIATE_TEST_SUITE_P(AddressFamilies,
> > ReplyConnCookieMultiMockTest, ::testing::ValuesIn(ares::test::families)=
,
> > PrintFamily);
> > > ++
> > > + }  // namespace test
> > > + }  // namespace ares
> > > +diff --git a/test/ares-test.cc b/test/ares-test.cc
> > > +index d333ee9419..0b3ac12c09 100644
> > > +--- a/test/ares-test.cc
> > > ++++ b/test/ares-test.cc
> > > +@@ -448,6 +448,9 @@ MockServer::MockServer(int family, unsigned shor=
t
> > port)
> > > +   // Create a TCP socket to receive data on.
> > > +   tcp_data_ =3D NULL;
> > > +   tcp_data_len_ =3D 0;
> > > ++  last_fd_ =3D ARES_SOCKET_BAD;
> > > ++  memset(&last_addr_, 0, sizeof(last_addr_));
> > > ++  last_addrlen_ =3D 0;
> > > +   tcpfd_ =3D socket(family, SOCK_STREAM, 0);
> > > +   EXPECT_NE(ARES_SOCKET_BAD, tcpfd_);
> > > +   int optval =3D 1;
> > > +@@ -710,6 +713,50 @@ std::set<ares_socket_t> MockServer::fds() const=
 {
> > > +   return result;
> > > + }
> > > +
> > > ++void MockServer::SendData(ares_socket_t fd, struct sockaddr_storage
> *addr,
> > > ++                          ares_socklen_t addrlen, int qid,
> > > ++                          std::vector<byte> reply) {
> > > ++  int flags =3D 0;
> > > ++
> > > ++  if (reply.size() >=3D  2) {
> > > ++    // Overwrite the query ID if space to do so.
> > > ++    reply[0] =3D (byte)((qid >> 8) & 0xff);
> > > ++    reply[1] =3D (byte)(qid & 0xff);
> > > ++  }
> > > ++  if (verbose) {
> > > ++    std::cerr << "sending reply " << PacketToString(reply)
> > > ++              << " on port " << ((fd =3D=3D udpfd_) ? udpport_ :
> tcpport_)
> > > ++              << ":" << getaddrport(addr) << std::endl;
> > > ++  }
> > > ++
> > > ++  // Prefix with 2-byte length if TCP.
> > > ++  if (fd !=3D udpfd_) {
> > > ++    int len =3D (int)reply.size();
> > > ++    std::vector<byte> vlen =3D {(byte)((len & 0xFF00) >> 8),
> (byte)(len & 0xFF)};
> > > ++    reply.insert(reply.begin(), vlen.begin(), vlen.end());
> > > ++    // Also, don't bother with the destination address.
> > > ++    addr =3D nullptr;
> > > ++    addrlen =3D 0;
> > > ++  }
> > > ++
> > > ++#ifdef MSG_NOSIGNAL
> > > ++  flags |=3D MSG_NOSIGNAL;
> > > ++#endif
> > > ++
> > > ++  ares_ssize_t rc =3D (ares_ssize_t)sendto(fd, BYTE_CAST reply.data=
(),
> > (SEND_TYPE_ARG3)reply.size(), flags,
> > > ++                                         (struct sockaddr *)addr,
> addrlen);
> > > ++  if (rc < static_cast<ares_ssize_t>(reply.size())) {
> > > ++    std::cerr << "Failed to send full reply, rc=3D" << rc << std::e=
ndl;
> > > ++  }
> > > ++}
> > > ++
> > > ++void MockServer::SendUnsolicited(const DNSPacket *reply, unsigned
> short
> > qid) {
> > > ++  ASSERT_NE(ARES_SOCKET_BAD, last_fd_);
> > > ++  ASSERT_TRUE(last_fd_ =3D=3D udpfd_ || connfds_.count(last_fd_) !=
=3D 0)
> > > ++    << "the most recent requester's connection has closed";
> > > ++  SendData(last_fd_, &last_addr_, last_addrlen_, qid, reply->data()=
);
> > > ++}
> > > ++
> > > + void MockServer::ProcessRequest(ares_socket_t fd, struct
> sockaddr_storage*
> > addr,
> > > +                                 ares_socklen_t addrlen, const
> std::vector<byte> &req,
> > > +                                 const std::string &reqstr,
> > > +@@ -717,10 +764,14 @@ void MockServer::ProcessRequest(ares_socket_t
> > fd, struct sockaddr_storage* addr,
> > > +
> > > +   /* DNS 0x20 will mix case, do case-insensitive matching of name i=
n
> request
> > */
> > > +   char lower_name[256];
> > > +-  int flags =3D 0;
> > > +
> > > +   arestest_strtolower(lower_name, name, sizeof(lower_name));
> > > +
> > > ++  // Remember the requester so SendUnsolicited() can reach it.
> > > ++  last_fd_ =3D fd;
> > > ++  memcpy(&last_addr_, addr, sizeof(last_addr_));
> > > ++  last_addrlen_ =3D addrlen;
> > > ++
> > > +   // Before processing, let gMock know the request is happening.
> > > +   OnRequest(lower_name, rrtype);
> > > +
> > > +@@ -747,43 +798,12 @@ void MockServer::ProcessRequest(ares_socket_t
> > fd, struct sockaddr_storage* addr,
> > > +     return;
> > > +   }
> > > +
> > > +-  // Make a local copy of the current pending reply.
> > > +-  std::vector<byte> reply =3D exact_reply_;
> > > +-
> > > +   if (qid_ >=3D 0) {
> > > +     // Use the explicitly specified query ID.
> > > +     qid =3D qid_;
> > > +   }
> > > +-  if (reply.size() >=3D  2) {
> > > +-    // Overwrite the query ID if space to do so.
> > > +-    reply[0] =3D (byte)((qid >> 8) & 0xff);
> > > +-    reply[1] =3D (byte)(qid & 0xff);
> > > +-  }
> > > +-  if (verbose) {
> > > +-    std::cerr << "sending reply " << PacketToString(reply)
> > > +-              << " on port " << ((fd =3D=3D udpfd_) ? udpport_ :
> tcpport_)
> > > +-              << ":" << getaddrport(addr) << std::endl;
> > > +-  }
> > > +-
> > > +-  // Prefix with 2-byte length if TCP.
> > > +-  if (fd !=3D udpfd_) {
> > > +-    int len =3D (int)reply.size();
> > > +-    std::vector<byte> vlen =3D {(byte)((len & 0xFF00) >> 8),
> (byte)(len & 0xFF)};
> > > +-    reply.insert(reply.begin(), vlen.begin(), vlen.end());
> > > +-    // Also, don't bother with the destination address.
> > > +-    addr =3D nullptr;
> > > +-    addrlen =3D 0;
> > > +-  }
> > > +
> > > +-#ifdef MSG_NOSIGNAL
> > > +-  flags |=3D MSG_NOSIGNAL;
> > > +-#endif
> > > +-
> > > +-  ares_ssize_t rc =3D (ares_ssize_t)sendto(fd, BYTE_CAST reply.data=
(),
> > (SEND_TYPE_ARG3)reply.size(), flags,
> > > +-                                         (struct sockaddr *)addr,
> addrlen);
> > > +-  if (rc < static_cast<ares_ssize_t>(reply.size())) {
> > > +-    std::cerr << "Failed to send full reply, rc=3D" << rc << std::e=
ndl;
> > > +-  }
> > > ++  SendData(fd, addr, addrlen, qid, exact_reply_);
> > > +
> > > +   if (disconnect_after_reply_ && fd !=3D udpfd_) {
> > > +     disconnect_after_reply_ =3D false;
> > > +diff --git a/test/ares-test.h b/test/ares-test.h
> > > +index 2b973c3982..170c284f26 100644
> > > +--- a/test/ares-test.h
> > > ++++ b/test/ares-test.h
> > > +@@ -303,6 +303,12 @@ class MockServer {
> > > +     disconnect_after_reply_ =3D true;
> > > +   }
> > > +
> > > ++  // Send reply, with the given query ID, to the client of the most
> recent
> > > ++  // request this server received, on the socket that request
> arrived on.  The
> > > ++  // client did not send this server a request with that query ID:
> this models
> > > ++  // a server answering a query that was only sent to some other
> server.
> > > ++  void SendUnsolicited(const DNSPacket *reply, unsigned short qid);
> > > ++
> > > +   // The set of file descriptors that the server handles.
> > > +   std::set<ares_socket_t> fds() const;
> > > +
> > > +@@ -327,6 +333,8 @@ class MockServer {
> > > +                                 int rrtype);
> > > +   void           ProcessPacket(ares_socket_t fd, struct
> sockaddr_storage *addr,
> > > +                                ares_socklen_t addrlen, byte *data,
> int len);
> > > ++  void SendData(ares_socket_t fd, struct sockaddr_storage *addr,
> > > ++                ares_socklen_t addrlen, int qid, std::vector<byte>
> reply);
> > > +   unsigned short udpport_;
> > > +   unsigned short tcpport_;
> > > +   ares_socket_t  udpfd_;
> > > +@@ -339,6 +347,10 @@ class MockServer {
> > > +   bool                    disconnect_after_reply_;
> > > +   unsigned char          *tcp_data_;
> > > +   size_t                  tcp_data_len_;
> > > ++  // Where the most recent request came from, for SendUnsolicited()=
.
> > > ++  ares_socket_t           last_fd_;
> > > ++  struct sockaddr_storage last_addr_;
> > > ++  ares_socklen_t          last_addrlen_;
> > > + };
> > > +
> > > + // Test fixture that uses a mock DNS server.
> > > diff --git
> a/meta-oe/recipes-support/c-ares/c-ares/0006-ares_save_options-read-
> > channel-config-under-lock.patch
> b/meta-oe/recipes-support/c-ares/c-ares/0006-
> > ares_save_options-read-channel-config-under-lock.patch
> > > new file mode 100644
> > > index 0000000000..76c072dd7e
> > > --- /dev/null
> > > +++
> b/meta-oe/recipes-support/c-ares/c-ares/0006-ares_save_options-read-
> > channel-config-under-lock.patch
> > > @@ -0,0 +1,243 @@
> > > +From 25a6911370878d4b617b44b142ea0e49d1ccede6 Mon Sep 17
> > 00:00:00 2001
> > > +From: Brad House <brad@brad-house.com>
> > > +Date: Mon, 19 Oct 2026 11:53:59 -0400
> > > +Subject: [PATCH] [Backport v1.34] ares_save_options: read channel
> > > + configuration under the channel lock (#1362)
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +Backport of 5d878a580a8b57b51d15e2725cf6775c8e7bca0e to `v1.34`. See
> > > +that commit for the full description.
> > > +
> > > +**Conflicts:** none; cherry-picked cleanly.
> > > +
> > > +**Tests (local, macOS, Debug, Ninja):**
> > > +- ASAN+UBSAN and `-DCARES_WERROR=3DON` builds: `arestest -4
> > > +--gtest_filter=3D'-*Live*'` =E2=80=94 691/691 passed in both.
> > > +- With the `src/` changes reverted, the new `DupConcurrentSetServers=
`
> /
> > > +`SaveOptionsConcurrentSetServers` tests abort with an ASAN
> > > +heap-buffer-overflow; they pass with them.
> > > +- `git clang-format --diff upstream/v1.34` clean. Also tested togeth=
er
> > > +with the other two v1.34 backports (both orders apply cleanly):
> 699/699
> > > +passed under ASAN+UBSAN and `-Werror`.
> > > +
> > > +Signed-off-by: Brad House <brad@brad-house.com>
> > > +Upstream-Status: Backport [https://github.com/c-ares/c-
> > ares/commit/25a6911370878d4b617b44b142ea0e49d1ccede6]
> > > +GHSA: GHSA-ph6c-3cvx-mq6v
> > > +---
> > > + src/lib/ares_init.c    |  3 +-
> > > + src/lib/ares_options.c | 45 ++++++++++++++++++----
> > > + test/ares-test-init.cc | 87
> > ++++++++++++++++++++++++++++++++++++++++++
> > > + 3 files changed, 126 insertions(+), 9 deletions(-)
> > > +
> > > +diff --git a/src/lib/ares_init.c b/src/lib/ares_init.c
> > > +index 4758c5de56..85b2e13050 100644
> > > +--- a/src/lib/ares_init.c
> > > ++++ b/src/lib/ares_init.c
> > > +@@ -483,7 +483,8 @@ int ares_dup(ares_channel_t **dest, const
> > ares_channel_t *src)
> > > +   *dest =3D NULL; /* in case of failure return NULL explicitly */
> > > +
> > > +   /* First get the options supported by the old ares_save_options()
> function,
> > > +-     which is most of them */
> > > ++   * which is most of them.  ares_save_options() takes the src
> channel lock
> > > ++   * itself.  No lock is held across ares_init_options(). */
> > > +   rc =3D (ares_status_t)ares_save_options(src, &opts, &optmask);
> > > +   if (rc !=3D ARES_SUCCESS) {
> > > +     ares_destroy_options(&opts);
> > > +diff --git a/src/lib/ares_options.c b/src/lib/ares_options.c
> > > +index 2b5624bbea..5ea35b732e 100644
> > > +--- a/src/lib/ares_options.c
> > > ++++ b/src/lib/ares_options.c
> > > +@@ -55,8 +55,8 @@ static struct in_addr *ares_save_opt_servers(const
> > ares_channel_t *channel,
> > > +                                              int
> *nservers)
> > > + {
> > > +   ares_slist_node_t *snode;
> > > +-  struct in_addr    *out =3D
> > > +-    ares_malloc_zero(ares_slist_len(channel->servers) *
> sizeof(*out));
> > > ++  size_t             cnt =3D ares_slist_len(channel->servers);
> > > ++  struct in_addr    *out =3D ares_malloc_zero_array(cnt, sizeof(*ou=
t));
> > > +
> > > +   *nservers =3D 0;
> > > +
> > > +@@ -64,7 +64,11 @@ static struct in_addr *ares_save_opt_servers(cons=
t
> > ares_channel_t *channel,
> > > +     return NULL;
> > > +   }
> > > +
> > > +-  for (snode =3D ares_slist_node_first(channel->servers); snode !=
=3D
> NULL;
> > > ++  /* Never write more entries than were allocated.  The caller hold=
s
> the
> > > ++   * channel lock so the server list cannot change underneath us;
> this is
> > > ++   * purely defensive. */
> > > ++  for (snode =3D ares_slist_node_first(channel->servers);
> > > ++       snode !=3D NULL && (size_t)*nservers < cnt;
> > > +        snode =3D ares_slist_node_next(snode)) {
> > > +     const ares_server_t *server =3D ares_slist_node_val(snode);
> > > +
> > > +@@ -79,9 +83,11 @@ static struct in_addr *ares_save_opt_servers(cons=
t
> > ares_channel_t *channel,
> > > +   return out;
> > > + }
> > > +
> > > +-/* Save options from initialized channel */
> > > +-int ares_save_options(const ares_channel_t *channel,
> > > +-                      struct ares_options *options, int *optmask)
> > > ++/* Save options from initialized channel.  Caller must hold the
> channel lock
> > > ++ * (if channel is not NULL). */
> > > ++static ares_status_t ares_save_options_nolock(const ares_channel_t
> > *channel,
> > > ++                                              struct ares_options
> *options,
> > > ++                                              int
> *optmask)
> > > + {
> > > +   size_t i;
> > > +
> > > +@@ -150,7 +156,8 @@ int ares_save_options(const ares_channel_t
> > *channel,
> > > +   if (channel->optmask & ARES_OPT_DOMAINS) {
> > > +     options->domains =3D NULL;
> > > +     if (channel->ndomains) {
> > > +-      options->domains =3D ares_malloc(channel->ndomains * sizeof(c=
har
> *));
> > > ++      options->domains =3D
> > > ++        ares_malloc_zero_array(channel->ndomains, sizeof(char *));
> > > +       if (!options->domains) {
> > > +         return ARES_ENOMEM;
> > > +       }
> > > +@@ -176,7 +183,8 @@ int ares_save_options(const ares_channel_t
> > *channel,
> > > +   if (channel->optmask & ARES_OPT_SORTLIST) {
> > > +     options->sortlist =3D NULL;
> > > +     if (channel->nsort) {
> > > +-      options->sortlist =3D ares_malloc(channel->nsort * sizeof(str=
uct
> apattern));
> > > ++      options->sortlist =3D
> > > ++        ares_malloc_zero_array(channel->nsort,
> sizeof(*options->sortlist));
> > > +       if (!options->sortlist) {
> > > +         return ARES_ENOMEM;
> > > +       }
> > > +@@ -238,6 +246,27 @@ int ares_save_options(const ares_channel_t
> > *channel,
> > > +   return ARES_SUCCESS;
> > > + }
> > > +
> > > ++int ares_save_options(const ares_channel_t *channel,
> > > ++                      struct ares_options *options, int *optmask)
> > > ++{
> > > ++  ares_status_t status;
> > > ++
> > > ++  if (channel =3D=3D NULL) {
> > > ++    /* Preserve historic behavior: initialize the pointers so
> > > ++     * ares_destroy_options() is safe, then return ARES_ENODATA */
> > > ++    return (int)ares_save_options_nolock(NULL, options, optmask);
> > > ++  }
> > > ++
> > > ++  /* The configuration may be modified concurrently by other thread=
s
> (e.g.
> > > ++   * ares_set_servers_csv()), so it must only be read with the
> channel lock
> > > ++   * held. */
> > > ++  ares_channel_lock(channel);
> > > ++  status =3D ares_save_options_nolock(channel, options, optmask);
> > > ++  ares_channel_unlock(channel);
> > > ++
> > > ++  return (int)status;
> > > ++}
> > > ++
> > > + static ares_status_t ares_init_options_servers(ares_channel_t
>  *channel,
> > > +                                                const struct in_addr
> *servers,
> > > +                                                size_t
> nservers)
> > > +diff --git a/test/ares-test-init.cc b/test/ares-test-init.cc
> > > +index b44211a1e4..1c5d0f2171 100644
> > > +--- a/test/ares-test-init.cc
> > > ++++ b/test/ares-test-init.cc
> > > +@@ -25,6 +25,8 @@
> > > +  */
> > > + #include "ares-test.h"
> > > +
> > > ++#include <atomic>
> > > ++
> > > + extern "C" {
> > > +   #include "ares_private.h"
> > > + }
> > > +@@ -295,6 +297,91 @@ TEST_F(LibraryTest, FailChannelInit) {
> > > +   ares_library_cleanup();
> > > + }
> > > +
> > > ++// CARES_THREADS implies ares_threadsafety() is true
> > > ++#ifdef CARES_THREADS
> > > ++// Build a CSV list of n distinct IPv4 servers.
> > > ++static std::string ConfigRaceServerCsv(size_t n)
> > > ++{
> > > ++  std::string csv;
> > > ++  for (size_t i =3D 0; i < n; i++) {
> > > ++    if (i !=3D 0) {
> > > ++      csv +=3D ",";
> > > ++    }
> > > ++    csv +=3D "127.0." + std::to_string((i / 250) + 1) + "." +
> > > ++           std::to_string((i % 250) + 1) + ":5353";
> > > ++  }
> > > ++  return csv;
> > > ++}
> > > ++
> > > ++// Readers snapshot the channel configuration (via ares_dup() or
> > > ++// ares_save_options()) while a writer thread keeps swapping the
> server list
> > > ++// between a short and a long one.  The configuration must only be
> read
> > under
> > > ++// the channel lock; otherwise the saved server array is sized from
> one list
> > > ++// and filled from another (heap-buffer-overflow under ASAN).
> > > ++static void ConfigRaceRun(bool use_dup, size_t reader_loops)
> > > ++{
> > > ++  const size_t        nreaders  =3D 4;
> > > ++  const std::string   small_csv =3D ConfigRaceServerCsv(4);
> > > ++  const std::string   large_csv =3D ConfigRaceServerCsv(400);
> > > ++  ares_channel_t     *channel   =3D nullptr;
> > > ++  std::atomic<size_t> readers_done(0);
> > > ++
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_init_options(&channel, nullptr, 0));
> > > ++  ASSERT_NE(nullptr, channel);
> > > ++  EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel,
> > small_csv.c_str()));
> > > ++
> > > ++  // Writer runs until every reader finished; readers are bounded s=
o
> the
> > > ++  // whole test is bounded.
> > > ++  std::thread              writer([&]() {
> > > ++    size_t i =3D 0;
> > > ++    while (readers_done.load() < nreaders) {
> > > ++      ares_set_servers_csv(channel,
> > > ++                           (i++ & 1) ? large_csv.c_str() :
> small_csv.c_str());
> > > ++    }
> > > ++  });
> > > ++
> > > ++  std::vector<std::thread> readers;
> > > ++  for (size_t r =3D 0; r < nreaders; r++) {
> > > ++    readers.emplace_back([&]() {
> > > ++      for (size_t i =3D 0; i < reader_loops; i++) {
> > > ++        if (use_dup) {
> > > ++          ares_channel_t *dup =3D nullptr;
> > > ++          EXPECT_EQ(ARES_SUCCESS, ares_dup(&dup, channel));
> > > ++          if (dup !=3D nullptr) {
> > > ++            ares_destroy(dup);
> > > ++          }
> > > ++        } else {
> > > ++          struct ares_options opts;
> > > ++          int                 optmask =3D 0;
> > > ++          memset(&opts, 0, sizeof(opts));
> > > ++          EXPECT_EQ(ARES_SUCCESS, ares_save_options(channel, &opts,
> > &optmask));
> > > ++          EXPECT_NE(0, optmask & ARES_OPT_SERVERS);
> > > ++          EXPECT_TRUE(opts.nservers =3D=3D 4 || opts.nservers =3D=
=3D 400);
> > > ++          ares_destroy_options(&opts);
> > > ++        }
> > > ++      }
> > > ++      readers_done++;
> > > ++    });
> > > ++  }
> > > ++
> > > ++  for (auto &t : readers) {
> > > ++    t.join();
> > > ++  }
> > > ++  writer.join();
> > > ++  ares_destroy(channel);
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, DupConcurrentSetServers)
> > > ++{
> > > ++  ConfigRaceRun(true, 20);
> > > ++}
> > > ++
> > > ++TEST_F(LibraryTest, SaveOptionsConcurrentSetServers)
> > > ++{
> > > ++  ConfigRaceRun(false, 20000);
> > > ++}
> > > ++#endif
> > > ++
> > > + #ifndef WIN32
> > > + TEST_F(LibraryTest, EnvInit) {
> > > +   ares_channel_t *channel =3D nullptr;
> > > diff --git
> a/meta-oe/recipes-support/c-ares/c-ares/0007-ares_inet_pton-reject-a-
> > prefix-length.patch
> b/meta-oe/recipes-support/c-ares/c-ares/0007-ares_inet_pton-
> > reject-a-prefix-length.patch
> > > new file mode 100644
> > > index 0000000000..2cd1ea8c24
> > > --- /dev/null
> > > +++
> b/meta-oe/recipes-support/c-ares/c-ares/0007-ares_inet_pton-reject-a-
> > prefix-length.patch
> > > @@ -0,0 +1,364 @@
> > > +From 7e65b381c0b915aa5671ddc713080c87e15fc42f Mon Sep 17 00:00:00
> > 2001
> > > +From: Brad House <brad@brad-house.com>
> > > +Date: Mon, 19 Oct 2026 12:24:52 -0400
> > > +Subject: [PATCH] [Backport v1.34] ares_inet_pton: reject a prefix
> length,
> > > + always write the full address (#1363)
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +Backport of 7b4ef8e555b611be6af39d913aa280cd1a348102 to `v1.34`. See
> > > +that commit for the full description.
> > > +
> > > +**Conflicts:** `test/ares-test-mock-ai.cc` only =E2=80=94 the neighb=
ouring
> > > +`FamilyV6IgnoresARecords` test (added on main by an unrelated change=
)
> > > +does not exist on v1.34. Resolved by adding only the new
> > > +`NumericHostRejectsPrefixLength` test at the same position. Other
> files
> > > +applied unchanged.
> > > +
> > > +**Also includes** the comment spelling fix from #1364
> > > +(ead5557d1301328536c3920bd01759a1bff5ca9a): "unparseable" ->
> > > +"unparsable" in `src/lib/inet_net_pton.c` and
> > > +`test/ares-test-internal.cc`, so Codespell passes and the text match=
es
> > > +main.
> > > +
> > > +**Tests (local, macOS, Debug, Ninja):**
> > > +- ASAN+UBSAN and `-DCARES_WERROR=3DON` builds: `arestest -4
> > > +--gtest_filter=3D'-*Live*'` =E2=80=94 693/693 passed in both.
> > > +- With the `src/` changes reverted, the 4 new test instances fail
> > > +(`InetNetPtoNPrefixZeroFills`, `InetPtoNRejectsPrefixLength`,
> > > +`NumericHostRejectsPrefixLength` UDP/TCP); they pass with them.
> > > +- `git clang-format --diff upstream/v1.34` clean. Also tested togeth=
er
> > > +with the other two v1.34 backports (both orders apply cleanly):
> 699/699
> > > +passed under ASAN+UBSAN and `-Werror`.
> > > +
> > > +Signed-off-by: Brad House <brad@brad-house.com>
> > > +Upstream-Status: Backport [https://github.com/c-ares/c-
> > ares/commit/7e65b381c0b915aa5671ddc713080c87e15fc42f]
> > > +GHSA: GHSA-cfcv-8v2j-qj6r
> > > +---
> > > + docs/ares_inet_pton.3        | 18 ++++++++--
> > > + src/lib/ares_inet_net_pton.h | 28 ++++++++++++++++
> > > + src/lib/inet_net_pton.c      | 65
> ++++++++++++++++++++----------------
> > > + test/ares-test-internal.cc   | 54 ++++++++++++++++++++++++++++++
> > > + test/ares-test-mock-ai.cc    | 23 +++++++++++++
> > > + 5 files changed, 157 insertions(+), 31 deletions(-)
> > > +
> > > +diff --git a/docs/ares_inet_pton.3 b/docs/ares_inet_pton.3
> > > +index 34b2df063c..19c5fdfda3 100644
> > > +--- a/docs/ares_inet_pton.3
> > > ++++ b/docs/ares_inet_pton.3
> > > +@@ -12,8 +12,9 @@ ares_inet_pton \- convert an IPv4 or IPv6 address
> from
> > text to binary form
> > > + int ares_inet_pton(int \fIaf\fP, const char *\fIsrc\fP, void
> *\fIdst\fP);
> > > + .fi
> > > + .SH DESCRIPTION
> > > +-This is a portable version with the identical functionality of the
> commonly
> > > +-available \fIinet_pton\fP.
> > > ++This is a portable version of the commonly available
> \fIinet_pton\fP.  It
> > > ++behaves the same for AF_INET6, and for AF_INET it additionally
> accepts the
> > > ++legacy forms described below.
> > > +
> > > + The ares_inet_pton() function converts the address in its standard
> text
> > > + presentation form into its numeric binary form. The \fBaf\fP
> argument shall
> > > +@@ -23,9 +24,20 @@ in. The \fBdst\fP argument points to a buffer int=
o
> which
> > the function stores
> > > + the numeric address; this shall be large enough to hold the numeric
> address
> > > + (32 bits for AF_INET, 128 bits for AF_INET6).
> > > +
> > > ++The \fBsrc\fP argument must be an address, not a network: a "/bits"
> prefix
> > > ++length suffix (CIDR notation) is not accepted and the function
> returns 0 for
> > > ++such input.  On success, the whole address (4 bytes for AF_INET, 16
> bytes for
> > > ++AF_INET6) is always written to \fBdst\fP.  Versions of c-ares befor=
e
> 1.34.9
> > > ++accepted a prefix length here.
> > > ++
> > > ++Unlike POSIX \fIinet_pton\fP, AF_INET also accepts shortened forms
> such as
> > > ++"10.1" and hexadecimal forms such as "0x0a000001".  Octets that are
> not
> > given
> > > ++are set to zero, so "10.1" is 10.1.0.0.
> > > ++
> > > + It returns 1 if the address was valid for the specified address
> family, or 0
> > > + if the address was not parseable in the specified address family, o=
r
> -1 if
> > > +-some system error occurred (in which case errno will have been set)=
.
> > > ++the address family is not supported (in which case errno will have
> been set
> > > ++to EAFNOSUPPORT).
> > > +
> > > + .SH SEE ALSO
> > > + .BR ares_init (3),
> > > +diff --git a/src/lib/ares_inet_net_pton.h
> b/src/lib/ares_inet_net_pton.h
> > > +index e3ed83a3cb..e1a6f2d71e 100644
> > > +--- a/src/lib/ares_inet_net_pton.h
> > > ++++ b/src/lib/ares_inet_net_pton.h
> > > +@@ -26,6 +26,34 @@
> > > + #ifndef HEADER_CARES_INET_NET_PTON_H
> > > + #define HEADER_CARES_INET_NET_PTON_H
> > > +
> > > ++/*! Parse a network (an address with an optional "/bits" prefix
> length) from
> > > ++ *  its text form.  This is not an address parser: for an address u=
se
> > > ++ *  ares_inet_pton(), which rejects a prefix length and always
> writes the
> > > ++ *  whole address.
> > > ++ *
> > > ++ *  How it differs from ares_inet_pton():
> > > ++ *   - A "/bits" prefix length is accepted (0-32 for IPv4, 0-128 fo=
r
> IPv6).
> > > ++ *   - The return value is the prefix length, not 1.  Without
> "/bits", IPv6
> > > ++ *     returns 128 and IPv4 infers it from the address class,
> widened to
> > > ++ *     cover every octet given ("10" is 8, "130.155" is 16,
> "1.2.3.4" is 32,
> > > ++ *     and a lone "224" is 4).  0 is a valid result ("::1/0").
> > > ++ *   - What is written to dst differs by family.  On success all
> size bytes
> > > ++ *     are zeroed first.  IPv4 then writes every octet given,
> including bits
> > > ++ *     beyond the prefix ("1.2.3.4/8" writes 1.2.3.4).  IPv6 writes
> only the
> > > ++ *     (bits+7)/8 bytes covering the prefix ("2001:db8::1/64" write=
s
> > > ++ *     2001:db8::).
> > > ++ *
> > > ++ *  \param[in]  af    AF_INET or AF_INET6.
> > > ++ *  \param[in]  src   NUL-terminated network in text form.
> > > ++ *  \param[out] dst   Buffer to receive the network, in network byt=
e
> order.
> > > ++ *  \param[in]  size  Size of dst in bytes.
> > > ++ *  \return Prefix length in bits on success.  -1 on failure, with
> SOCKERRNO
> > > ++ *          set to ENOENT if src is not a valid network, or EMSGSIZ=
E
> if it
> > > ++ *          does not fit in size bytes or (IPv6) src is too long to
> be a
> > > ++ *          network.  On Windows these are the WSA equivalents.  An
> > > ++ *          unsupported af returns -1 without setting SOCKERRNO.  O=
n
> failure
> > > ++ *          dst may be partially written.
> > > ++ */
> > > + int ares_inet_net_pton(int af, const char *src, void *dst, size_t
> size);
> > > +
> > > + #endif /* HEADER_CARES_INET_NET_PTON_H */
> > > +diff --git a/src/lib/inet_net_pton.c b/src/lib/inet_net_pton.c
> > > +index e1f76ef834..f60823023b 100644
> > > +--- a/src/lib/inet_net_pton.c
> > > ++++ b/src/lib/inet_net_pton.c
> > > +@@ -51,14 +51,15 @@ const struct ares_in6_addr ares_in6addr_any =3D =
{ {
> { 0,
> > 0, 0, 0, 0, 0, 0, 0, 0,
> > > +
> > > + /*
> > > +  * static int
> > > +- * inet_net_pton_ipv4(src, dst, size)
> > > ++ * inet_net_pton_ipv4(src, dst, size, allow_cidr)
> > > +  *      convert IPv4 network number from presentation to network
> format.
> > > +- *      accepts hex octets, hex strings, decimal octets, and /CIDR.
> > > +- *      "size" is in bytes and describes "dst".
> > > ++ *      accepts hex octets, hex strings, decimal octets, and, if
> > > ++ *      "allow_cidr" is true, /CIDR.  "size" is in bytes and
> describes "dst".
> > > +  * return:
> > > +  *      number of bits, either imputed classfully or specified with
> /CIDR,
> > > +  *      or -1 if some failure occurred (check errno).  ENOENT means
> it was
> > > +- *      not an IPv4 network specification.
> > > ++ *      not an IPv4 network specification (including a /CIDR suffix
> when
> > > ++ *      "allow_cidr" is false).
> > > +  * note:
> > > +  *      network byte order assumed.  this means 192.5.5.240/28 has
> > > +  *      0b11110000 in its fourth octet.
> > > +@@ -71,7 +72,7 @@ const struct ares_in6_addr ares_in6addr_any =3D { =
{ {
> 0, 0,
> > 0, 0, 0, 0, 0, 0, 0,
> > > +  *      Paul Vixie (ISC), June 1996
> > > +  */
> > > + static int ares_inet_net_pton_ipv4(const char *src, unsigned char
> *dst,
> > > +-                                   size_t size)
> > > ++                                   size_t size, ares_bool_t
> allow_cidr)
> > > + {
> > > +   static const char    xdigits[] =3D "0123456789abcdef";
> > > +   static const char    digits[]  =3D "0123456789";
> > > +@@ -147,7 +148,8 @@ static int ares_inet_net_pton_ipv4(const char
> *src,
> > unsigned char *dst,
> > > +   }
> > > +
> > > +   bits =3D -1;
> > > +-  if (ch =3D=3D '/' && ares_isascii(src[0]) && ares_isdigit(src[0])=
 &&
> dst > odst) {
> > > ++  if (allow_cidr && ch =3D=3D '/' && ares_isascii(src[0]) &&
> ares_isdigit(src[0]) &&
> > > ++      dst > odst) {
> > > +     /* CIDR width specifier.  Nothing can follow it. */
> > > +     ch   =3D *src++; /* Skip over the /. */
> > > +     bits =3D 0;
> > > +@@ -317,7 +319,7 @@ static int ares_inet_pton6(const char *src,
> unsigned
> > char *dst)
> > > +       continue;
> > > +     }
> > > +     if (ch =3D=3D '.' && ((tp + NS_INADDRSZ) <=3D endp) &&
> > > +-        ares_inet_net_pton_ipv4(curtok, tp, NS_INADDRSZ) > 0) {
> > > ++        ares_inet_net_pton_ipv4(curtok, tp, NS_INADDRSZ, ARES_FALSE=
)
> > 0)
> > {
> > > +       tp         +=3D NS_INADDRSZ;
> > > +       saw_xdigit  =3D 0;
> > > +       break; /* '\0' was seen by inet_pton4(). */
> > > +@@ -400,29 +402,23 @@ static int ares_inet_net_pton_ipv6(const char
> *src,
> > unsigned char *dst,
> > > +     SET_SOCKERRNO(EMSGSIZE);
> > > +     return -1;
> > > +   }
> > > ++  /* Only the first (bits+7)/8 bytes carry the network, zero the
> remainder of
> > > ++   * the caller's buffer so it never holds uninitialized data. */
> > > ++  memset(dst, 0, size);
> > > +   memcpy(dst, &in6, bytes);
> > > +   return (int)bits;
> > > + }
> > > +
> > > +-/*
> > > +- * int
> > > +- * inet_net_pton(af, src, dst, size)
> > > +- *      convert network number from presentation to network format.
> > > +- *      accepts hex octets, hex strings, decimal octets, and /CIDR.
> > > +- *      "size" is in bytes and describes "dst".
> > > +- * return:
> > > +- *      number of bits, either imputed classfully or specified with
> /CIDR,
> > > +- *      or -1 if some failure occurred (check errno).  ENOENT means
> it was
> > > +- *      not a valid network specification.
> > > ++/* Parse a network, not an address.  See ares_inet_net_pton.h for t=
he
> > > ++ * contract and how it differs from ares_inet_pton().
> > > +  * author:
> > > +  *      Paul Vixie (ISC), June 1996
> > > +- *
> > > +  */
> > > + int ares_inet_net_pton(int af, const char *src, void *dst, size_t
> size)
> > > + {
> > > +   switch (af) {
> > > +     case AF_INET:
> > > +-      return ares_inet_net_pton_ipv4(src, dst, size);
> > > ++      return ares_inet_net_pton_ipv4(src, dst, size, ARES_TRUE);
> > > +     case AF_INET6:
> > > +       return ares_inet_net_pton_ipv6(src, dst, size);
> > > +     default:
> > > +@@ -430,22 +426,35 @@ int ares_inet_net_pton(int af, const char *src=
,
> void
> > *dst, size_t size)
> > > +   }
> > > + }
> > > +
> > > ++/*
> > > ++ * int
> > > ++ * inet_pton(af, src, dst)
> > > ++ *      convert an address (not a network) from presentation to
> network
> > > ++ *      format, like POSIX inet_pton().  A "/bits" prefix length
> denotes a
> > > ++ *      prefix, not an address (RFC 4291 Section 2.3 vs. the addres=
s
> text
> > > ++ *      forms of Section 2.2), and is rejected; dst is always fully
> written
> > > ++ *      on success (4 bytes for AF_INET, 16 bytes for AF_INET6).
> > > ++ *      For a network with a prefix length, use ares_inet_net_pton(=
).
> > > ++ * return:
> > > ++ *      1 on success, 0 if src is not a valid address for af (as
> POSIX
> > > ++ *      inet_pton() does for any unparsable input), or -1 with errn=
o
> set to
> > > ++ *      EAFNOSUPPORT if af is not supported.
> > > ++ */
> > > + int ares_inet_pton(int af, const char *src, void *dst)
> > > + {
> > > +-  int    result;
> > > +-  size_t size;
> > > ++  int result;
> > > +
> > > +   if (af =3D=3D AF_INET) {
> > > +-    size =3D sizeof(struct in_addr);
> > > ++    result =3D
> > > ++      ares_inet_net_pton_ipv4(src, dst, sizeof(struct in_addr),
> ARES_FALSE);
> > > +   } else if (af =3D=3D AF_INET6) {
> > > +-    size =3D sizeof(struct ares_in6_addr);
> > > ++    result =3D ares_inet_pton6(src, dst);
> > > +   } else {
> > > +     SET_SOCKERRNO(EAFNOSUPPORT);
> > > +     return -1;
> > > +   }
> > > +-  result =3D ares_inet_net_pton(af, src, dst, size);
> > > +-  if (result =3D=3D -1 && SOCKERRNO =3D=3D ENOENT) {
> > > +-    return 0;
> > > +-  }
> > > +-  return (result > -1) ? 1 : -1;
> > > ++  /* Neither parser can fail for a system reason: any failure
> (ENOENT, or
> > > ++   * EMSGSIZE for too many IPv4 octets as in "1.2.3.4.5") means src
> is not a
> > > ++   * valid address. */
> > > ++  return (result > -1) ? 1 : 0;
> > > + }
> > > +diff --git a/test/ares-test-internal.cc b/test/ares-test-internal.cc
> > > +index bf06a74605..294e3f4555 100644
> > > +--- a/test/ares-test-internal.cc
> > > ++++ b/test/ares-test-internal.cc
> > > +@@ -274,6 +274,23 @@ TEST_F(LibraryTest, InetNetPtoN) {
> > > +   EXPECT_EQ(-1, ares_inet_net_pton(AF_INET, "253", &a4, sizeof(a4) =
-
> 1));
> > > + }
> > > +
> > > ++// An IPv6 network with a prefix length only carries (bits+7)/8
> bytes; the
> > > ++// rest of the destination must be zeroed rather than left as it wa=
s.
> > > ++TEST_F(LibraryTest, InetNetPtoNPrefixZeroFills) {
> > > ++  unsigned char a6[16];
> > > ++
> > > ++  memset(a6, 0x41, sizeof(a6));
> > > ++  EXPECT_EQ(0, ares_inet_net_pton(AF_INET6, "::1/0", a6,
> sizeof(a6)));
> > > ++  EXPECT_EQ("0000:0000:0000:0000:0000:0000:0000:0000",
> > > ++            AddressToString(a6, 16));
> > > ++
> > > ++  memset(a6, 0x41, sizeof(a6));
> > > ++  EXPECT_EQ(64, ares_inet_net_pton(AF_INET6,
> "2001:db8:1:2:3:4:5:6/64",
> > a6,
> > > ++                                   sizeof(a6)));
> > > ++  EXPECT_EQ("2001:0db8:0001:0002:0000:0000:0000:0000",
> > > ++            AddressToString(a6, 16));
> > > ++}
> > > ++
> > > + TEST_F(LibraryTest, FreeLongChain) {
> > > +   struct ares_addr_node *data =3D nullptr;
> > > +   for (int ii =3D 0; ii < 100000; ii++) {
> > > +@@ -600,9 +617,46 @@ TEST_F(LibraryTest, InetPtoN) {
> > > +   EXPECT_EQ(1, ares_inet_pton(AF_INET6, "12:34::ff", &a6));
> > > +   EXPECT_EQ(1, ares_inet_pton(AF_INET6, "12:34::ffff:1.2.3.4", &a6)=
);
> > > +   EXPECT_EQ(0, ares_inet_pton(AF_INET, "xyzzy", &a4));
> > > ++  // Too many octets is unparsable input, not a system error.
> > > ++  EXPECT_EQ(0, ares_inet_pton(AF_INET, "1.2.3.4.5", &a4));
> > > ++  EXPECT_EQ(0, ares_inet_pton(AF_INET, "0x0102030405", &a4));
> > > +   EXPECT_EQ(-1, ares_inet_pton(AF_INET+AF_INET6, "1.2.3.4", &a4));
> > > + }
> > > +
> > > ++// ares_inet_pton() parses addresses, not networks: like
> inet_pton(3) it must
> > > ++// reject a "/bits" prefix length.  It used to accept one and, for
> IPv6, write
> > > ++// only (bits+7)/8 bytes of dst while still returning 1.
> > > ++TEST_F(LibraryTest, InetPtoNRejectsPrefixLength) {
> > > ++  const char *cases6[] =3D { "::1/0", "ffff::1/16", "2001:db8::1/64=
",
> > > ++                           "2001:db8::1/128", "::ffff:1.2.3.4/8",
> > > ++                           "::ffff:1.2.3.4/32" };
> > > ++  const char *cases4[] =3D { "1.2.3.4/8", "1.2.3.4/0", "1.2.3.4/32"=
,
> "10/8",
> > > ++                           "0x0a000000/8" };
> > > ++  unsigned char a4[4];
> > > ++  unsigned char a6[16];
> > > ++  size_t        i;
> > > ++
> > > ++  for (i =3D 0; i < sizeof(cases6) / sizeof(*cases6); i++) {
> > > ++    EXPECT_EQ(0, ares_inet_pton(AF_INET6, cases6[i], a6)) <<
> cases6[i];
> > > ++  }
> > > ++  for (i =3D 0; i < sizeof(cases4) / sizeof(*cases4); i++) {
> > > ++    EXPECT_EQ(0, ares_inet_pton(AF_INET, cases4[i], a4)) <<
> cases4[i];
> > > ++  }
> > > ++
> > > ++  // Without a prefix length, the whole destination is written.
> > > ++  memset(a6, 0x41, sizeof(a6));
> > > ++  EXPECT_EQ(1, ares_inet_pton(AF_INET6, "ffff::1", a6));
> > > ++  EXPECT_EQ("ffff:0000:0000:0000:0000:0000:0000:0001",
> > > ++            AddressToString(a6, 16));
> > > ++  memset(a6, 0x41, sizeof(a6));
> > > ++  EXPECT_EQ(1, ares_inet_pton(AF_INET6, "::ffff:1.2.3.4", a6));
> > > ++  EXPECT_EQ("0000:0000:0000:0000:0000:ffff:0102:0304",
> > > ++            AddressToString(a6, 16));
> > > ++  memset(a4, 0x41, sizeof(a4));
> > > ++  EXPECT_EQ(1, ares_inet_pton(AF_INET, "1.2.3.4", a4));
> > > ++  EXPECT_EQ("1.2.3.4", AddressToString(a4, 4));
> > > ++}
> > > ++
> > > + TEST_F(LibraryTest, FreeCorruptData) {
> > > +   // ares_free_data(p) expects that there is a type field and a
> marker
> > > +   // field in the memory before p.  Feed it incorrect versions of
> each.
> > > +diff --git a/test/ares-test-mock-ai.cc b/test/ares-test-mock-ai.cc
> > > +index ae45c45527..43d0b89175 100644
> > > +--- a/test/ares-test-mock-ai.cc
> > > ++++ b/test/ares-test-mock-ai.cc
> > > +@@ -617,6 +617,29 @@ TEST_P(MockChannelTestAI, FamilyV6) {
> > > +   EXPECT_THAT(result.ai_,
> > IncludesV6Address("2121:0000:0000:0000:0000:0000:0000:0303"));
> > > + }
> > > +
> > > ++// A numeric host with a "/bits" prefix length is a network, not an
> address.
> > > ++// It used to be accepted, returning uninitialized stack memory as
> the address.
> > > ++TEST_P(MockChannelTestAI, NumericHostRejectsPrefixLength) {
> > > ++  struct ares_addrinfo_hints hints =3D {0, 0, 0, 0};
> > > ++  hints.ai_family =3D AF_INET6;
> > > ++  hints.ai_flags  =3D ARES_AI_NUMERICHOST;
> > > ++
> > > ++  AddrInfoResult result;
> > > ++  ares_getaddrinfo(channel_, "::1/0", NULL, &hints, AddrInfoCallbac=
k,
> > &result);
> > > ++  Process();
> > > ++  EXPECT_TRUE(result.done_);
> > > ++  EXPECT_NE(ARES_SUCCESS, result.status_);
> > > ++
> > > ++  AddrInfoResult result2;
> > > ++  ares_getaddrinfo(channel_, "::1", NULL, &hints, AddrInfoCallback,
> &result2);
> > > ++  Process();
> > > ++  EXPECT_TRUE(result2.done_);
> > > ++  EXPECT_EQ(ARES_SUCCESS, result2.status_);
> > > ++  EXPECT_THAT(result2.ai_, IncludesNumAddresses(1));
> > > ++  EXPECT_THAT(result2.ai_,
> > > ++
> IncludesV6Address("0000:0000:0000:0000:0000:0000:0000:0001"));
> > > ++}
> > > ++
> > > + // Test case for Issue #662
> > > + TEST_P(MockChannelTestAI, PartialQueryCancel) {
> > > +   std::vector<byte> nothing;
> > > diff --git
> a/meta-oe/recipes-support/c-ares/c-ares/0008-ares_conn_read-dont-
> > drop-UDP-answers-from-server-port.patch
> b/meta-oe/recipes-support/c-ares/c-
> > ares/0008-ares_conn_read-dont-drop-UDP-answers-from-server-port.patch
> > > new file mode 100644
> > > index 0000000000..f4f182b995
> > > --- /dev/null
> > > +++
> b/meta-oe/recipes-support/c-ares/c-ares/0008-ares_conn_read-dont-drop-
> > UDP-answers-from-server-port.patch
> > > @@ -0,0 +1,178 @@
> > > +From c7fa9ebcb0c0086730c53bf03191c03f03706246 Mon Sep 17 00:00:00
> > 2001
> > > +From: "c-ares-backport-gha[bot]"
> > > + <299594594+c-ares-backport-gha[bot]@users.noreply.github.com>
> > > +Date: Tue, 20 Oct 2026 02:25:59 +0000
> > > +Subject: [PATCH] [Backport v1.34] ares_conn_read: don't drop UDP
> answers
> > whose
> > > + source port isn't reported (#1371)
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +# Description
> > > +Backport of #1370 to `v1.34`.
> > > +
> > > +Signed-off-by: Brad House <brad@brad-house.com>
> > > +Co-authored-by: Brad House <brad@brad-house.com>
> > > +Upstream-Status: Backport [https://github.com/c-ares/c-
> > ares/commit/c7fa9ebcb0c0086730c53bf03191c03f03706246]
> > > +GHSA: GHSA-fqh5-3x7m-wp44
> > > +---
> > > + docs/ares_set_socket_functions.3 | 20 ++++++++++++++++++++
> > > + src/lib/ares_conn.c              |  9 ++++++++-
> > > + src/lib/ares_socket.c            |  4 +++-
> > > + src/lib/ares_socket.h            |  8 +++++---
> > > + test/ares-test-mock.cc           | 32
> +++++++++++++++++++++++++++++++-
> > > + 5 files changed, 67 insertions(+), 6 deletions(-)
> > > +
> > > +diff --git a/docs/ares_set_socket_functions.3
> > b/docs/ares_set_socket_functions.3
> > > +index 605beb26ef..75c621cb48 100644
> > > +--- a/docs/ares_set_socket_functions.3
> > > ++++ b/docs/ares_set_socket_functions.3
> > > +@@ -149,6 +149,20 @@ a socket. Additional flags controlling behavior
> are in
> > > + address, the callback should fill this in. The \fIflags\fP paramete=
r
> is
> > > + currently unused. See \fBrecvfrom(2)\fP.
> > > +
> > > ++For UDP, the callback must fill in the full source address,
> including the
> > > ++source port, exactly as \fBrecvfrom(2)\fP does. c-ares discards a
> datagram
> > > ++whose source address does not match the server it queried, or whose
> source
> > > ++port does not match that server's port.
> > > ++
> > > ++\fBSecurity:\fP for compatibility with older callbacks, a reported
> source port
> > > ++of 0 is treated as unknown and only the address is checked. A
> callback that
> > > ++does not fill in the source port is therefore insecure: c-ares will
> accept
> > > ++answers sent from any port on the server's address, for example fro=
m
> another
> > > ++DNS server or any other service or user able to send UDP from that
> host, and
> > > ++those answers are cached and returned to the application. Such an
> > > ++implementation is non-compliant and should be fixed to report the
> real
> > source
> > > ++port.
> > > ++
> > > + .TP 8
> > > + .B ares_ssize_t (*\fIasendto\fP)(ares_socket_t \fIfd\fP, const void
> * \fIbuffer\fP,
> > size_t \fIlength\fP, int \fIflags\fP, const struct sockaddr *
> \fIaddress\fP,
> > ares_socklen_t \fIaddress_len\fP, void * \fIuser_data\fP)
> > > + .br
> > > +@@ -305,6 +319,12 @@ Receives data from remote socket endpoint, if
> > available. If the \fIaddr\fP
> > > + parameter is not NULL and the connection protocol provides the sour=
ce
> > address,
> > > + the callback should fill this in. See \fBrecvfrom(2)\fP
> > > +
> > > ++For UDP, the callback must fill in the full source address,
> including the
> > > ++source port, as described above for \fIarecvfrom\fP in
> > > ++\fBares_set_socket_functions_ex\fP. \fBSecurity:\fP a callback that
> > > ++does not fill in the source port is insecure, and c-ares will accep=
t
> answers
> > > ++sent from any port on the server's address.
> > > ++
> > > + .TP 8
> > > + .B ares_ssize_t (*\fIasendv\fP)(ares_socket_t \fIfd\fP, const struc=
t
> iovec *
> > \fIdata\fP, int \fIlen\fP, void * \fIuser_data\fP)
> > > + .br
> > > +diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c
> > > +index b868053e62..7711d8649e 100644
> > > +--- a/src/lib/ares_conn.c
> > > ++++ b/src/lib/ares_conn.c
> > > +@@ -257,7 +257,14 @@ ares_conn_err_t ares_conn_read(ares_conn_t
> > *conn, void *data, size_t len,
> > > +      * functions might not filter on connect, so also check here
> that the
> > > +      * datagram came from the server's address and UDP port.  RFC
> 5452
> > > +      * section 9.1 only requires the address to match; matching the
> port too
> > > +-     * keeps one server from answering for another on the same
> address. */
> > > ++     * keeps one server from answering for another on the same
> address.
> > > ++     * Socket functions that fill in the source address but leave
> the port 0
> > > ++     * predate the port check, so for those only the address is
> checked.  A
> > > ++     * sender cannot use this to skip the port check: the default
> socket
> > > ++     * functions connect() the socket, so the kernel drops a
> datagram from
> > > ++     * port 0, and an unprivileged process on the server's host
> cannot send
> > > ++     * from port 0, while an off-path attacker able to forge port 0
> can forge
> > > ++     * the server's real port just as easily. */
> > > +     if (err =3D=3D ARES_CONN_ERR_SUCCESS &&
> > > +         !ares_sockaddr_addr_port_eq((struct sockaddr *)&sa_storage,
> > > +                                     &conn->server->addr,
> > > +diff --git a/src/lib/ares_socket.c b/src/lib/ares_socket.c
> > > +index 0a12935ab7..29d595e1a9 100644
> > > +--- a/src/lib/ares_socket.c
> > > ++++ b/src/lib/ares_socket.c
> > > +@@ -144,7 +144,9 @@ ares_bool_t ares_sockaddr_addr_port_eq(const
> > struct sockaddr  *sa,
> > > +     sa_port =3D (CARES_INADDR_CAST(const struct sockaddr_in6 *, sa)=
)-
> > >sin6_port;
> > > +   }
> > > +
> > > +-  if (ntohs(sa_port) !=3D port) {
> > > ++  /* A port of 0 means the source port was not reported, so only th=
e
> address
> > > ++   * can be checked. */
> > > ++  if (sa_port !=3D 0 && ntohs(sa_port) !=3D port) {
> > > +     return ARES_FALSE;
> > > +   }
> > > +
> > > +diff --git a/src/lib/ares_socket.h b/src/lib/ares_socket.h
> > > +index f7128e3493..1ede6987ee 100644
> > > +--- a/src/lib/ares_socket.h
> > > ++++ b/src/lib/ares_socket.h
> > > +@@ -151,13 +151,15 @@ ares_bool_t     ares_sockaddr_addr_eq(const
> > struct sockaddr  *sa,
> > > +                                       const struct ares_addr *aa);
> > > +
> > > + /*! Compare the IP address and port of a socket address with an
> ares_addr
> > and
> > > +- *  port.
> > > ++ *  port.  A port of 0 in the socket address means the port is
> unknown, so it
> > > ++ *  matches any port.
> > > +  *
> > > +  *  \param[in] sa    Socket address (AF_INET or AF_INET6)
> > > +  *  \param[in] aa    Address to compare against
> > > +  *  \param[in] port  Port to compare against, in host byte order
> > > +- *  \return ARES_TRUE if the address families, IP addresses and
> ports are
> > > +- *          equal, ARES_FALSE otherwise
> > > ++ *  \return ARES_TRUE if the address families and IP addresses are
> equal
> > and
> > > ++ *          the ports are equal or the socket address port is 0,
> ARES_FALSE
> > > ++ *          otherwise
> > > +  */
> > > + ares_bool_t     ares_sockaddr_addr_port_eq(const struct sockaddr
> *sa,
> > > +                                            const struct ares_addr
> *aa,
> > > +diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc
> > > +index 058dc93001..cc5e6482f2 100644
> > > +--- a/test/ares-test-mock.cc
> > > ++++ b/test/ares-test-mock.cc
> > > +@@ -3364,6 +3364,7 @@ struct FakeSockData {
> > > +   size_t             query_len;
> > > +   struct sockaddr_in peer;
> > > +   unsigned short     recv_port; /* network order; 0 reports the
> peer's port */
> > > ++  bool               recv_no_port; /* report the peer's address wit=
h
> port 0 */
> > > +   size_t             recv_calls;
> > > +   size_t             bad_fd_calls;
> > > +   size_t             sock_state_bad;
> > > +@@ -3472,7 +3473,9 @@ static ares_ssize_t
> > FakeSockRecvfrom(ares_socket_t sock, void *buffer,
> > > +   if (address !=3D NULL && address_len !=3D NULL &&
> > > +       *address_len >=3D (ares_socklen_t)sizeof(d->peer)) {
> > > +     memcpy(address, &d->peer, sizeof(d->peer));
> > > +-    if (d->recv_port !=3D 0) {
> > > ++    if (d->recv_no_port) {
> > > ++      reinterpret_cast<struct sockaddr_in *>(address)->sin_port =3D=
 0;
> > > ++    } else if (d->recv_port !=3D 0) {
> > > +       reinterpret_cast<struct sockaddr_in *>(address)->sin_port =3D
> d->recv_port;
> > > +     }
> > > +     *address_len =3D sizeof(d->peer);
> > > +@@ -3750,6 +3753,33 @@ TEST_F(LibraryTest,
> > UDPAnswerFromWrongPortDropped) {
> > > +   ares_destroy(chan);
> > > + }
> > > +
> > > ++// Socket functions written before the port check may fill in the
> source
> > > ++// address but leave the port 0.  The address is still checked, but
> the answer
> > > ++// must not be dropped for its port.
> > > ++TEST_F(LibraryTest, UDPAnswerWithoutPortAccepted)
> > > ++{
> > > ++  ares_channel_t *chan =3D nullptr;
> > > ++  FakeSockData    data;
> > > ++
> > > ++  memset(&data, 0, sizeof(data));
> > > ++  FakeSockInit(&chan, &data, 0,
> > ARES_SOCKFUNC_FLAG_NONBLOCKING);
> > > ++
> > > ++  ares_query_dnsrec(chan, "www.google.com", ARES_CLASS_IN,
> > ARES_REC_TYPE_A,
> > > ++                    FakeSockQueryCallback, &data, NULL);
> > > ++  ASSERT_NE((size_t)0, data.query_len);
> > > ++  ASSERT_EQ(htons(53055), data.peer.sin_port);
> > > ++
> > > ++  data.recv_no_port =3D true;
> > > ++  data.recv_answer  =3D true;
> > > ++  ares_process_fd(chan, 100, ARES_SOCKET_BAD);
> > > ++  EXPECT_FALSE(data.recv_answer);
> > > ++  EXPECT_TRUE(data.done);
> > > ++  // The fake answer carries no records.
> > > ++  EXPECT_EQ(ARES_ENODATA, data.status);
> > > ++  EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));
> > > ++  ares_destroy(chan);
> > > ++}
> > > ++
> > > + // The close function is application code too.  With no socket-stat=
e
> callback
> > > + // to carry the descriptor, it runs inline while
> ares_check_cleanup_conns()
> > > + // walks the server list and each server's connections, closing idl=
e
> ones.
> > > diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
> b/meta-oe/recipes-
> > support/c-ares/c-ares_1.34.8.bb
> > > index 058f3666e7..1d0f3eb343 100644
> > > --- a/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
> > > +++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
> > > @@ -6,6 +6,14 @@ LICENSE =3D "MIT"
> > >  LIC_FILES_CHKSUM =3D
> > "file://LICENSE.md;md5=3Dd3e72a10e08191f2ca1be3f3228d78f3"
> > >
> > >  SRC_URI =3D "https://github.com/c-ares/c-
> > ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
> > > +           file://0001-ares_cancel-ares_destroy-detach-queries-befor=
e-
> > callbacks.patch \
> > > +
>  file://0002-Deliver-deferred-socket-server-state-notifications.patch \
> > > +
>  file://0003-ares_qcache-hand-callbacks-their-own-copy.patch \
> > > +
>  file://0004-Handle-connections-torn-down-by-application.patch \
> > > +
>  file://0005-ares_process-only-accept-an-answer-on-the-right-
> > connection.patch \
> > > +
>  file://0006-ares_save_options-read-channel-config-under-lock.patch \
> > > +           file://0007-ares_inet_pton-reject-a-prefix-length.patch \
> > > +
>  file://0008-ares_conn_read-dont-drop-UDP-answers-from-server-
> > port.patch \
> > >             file://run-ptest"
> > >  SRC_URI[sha256sum] =3D
> > "c222b6d681096f9444d2c4863d2c1174019e27cacca0a4a5c114d36dd7d7bf78"
> > >
> > > --
> > > 2.43.0
> > >
> > >
> > >
> > >
>

--000000000000d69b12065ed076a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think the change in question is really very minor.=
=C2=A0 I suspect that taking the upgrade to 1.34..9 as presented in master =
would make support long term easier.=C2=A0 But I will leave it for branch m=
aintainers to decide what&#39;s acceptable.</div><div><br></div><div>Jason<=
/div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Oct 27, 2026 at 4:25=E2=80=AFAM Marko, P=
eter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">Peter.Marko@siemens.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Can we rather do the upgrade instead? I was planning to send it for Wrynose=
 branch eventually.<br>
Is there anything in &quot;Changes&quot; section of <a href=3D"https://gith=
ub.com/c-ares/c-ares/releases/tag/v1.34.9" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/c-ares/c-ares/releases/tag/v1.34.9</a> which would =
prevent it?<br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;openembedd=
ed-<br>
&gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_blank">deve=
l@lists.openembedded.org</a>&gt; On Behalf Of Ankur Tyagi via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Tuesday, October 27, 2026 8:04 AM<br>
&gt; To: <a href=3D"mailto:schonm@gmail.com" target=3D"_blank">schonm@gmail=
.com</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Subject: Re: [oe] [meta-oe][blacksail][PATCH] c-ares: backport securit=
y fixes from<br>
&gt; 1.34.9<br>
&gt; <br>
&gt; Hi Jason,<br>
&gt; <br>
&gt; Thanks for submitting the patch.<br>
&gt; <br>
&gt; Though the patches LGTM, I am seeing increased ptest failures.<br>
&gt; <br>
&gt; Existing recipe ptest status:<br>
&gt; [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] 1093 tests from 41 test suites ran.<b=
r>
&gt; [=C2=A0 PASSED=C2=A0 ] 1092 tests.<br>
&gt; [=C2=A0 FAILED=C2=A0 ] 1 test, listed below:<br>
&gt; [=C2=A0 FAILED=C2=A0 ] DefaultChannelTest.TimeoutValue<br>
&gt; <br>
&gt; ptest status after applying your patch:<br>
&gt; [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] 1174 tests from 47 test suites ran.<b=
r>
&gt; [=C2=A0 PASSED=C2=A0 ] 1170 tests.<br>
&gt; [=C2=A0 FAILED=C2=A0 ] 4 tests, listed below:<br>
&gt; [=C2=A0 FAILED=C2=A0 ] DefaultChannelTest.TimeoutValue<br>
&gt; [=C2=A0 FAILED=C2=A0 ] SockStateDeliveryTest.CancelReportsSocketClose<=
br>
&gt; [=C2=A0 FAILED=C2=A0 ] SockStateDeliveryTest.SetServersReportsSocketCl=
ose<br>
&gt; [=C2=A0 FAILED=C2=A0 ] SockStateDeliveryTest.DestroyReportsSocketClose=
<br>
&gt; <br>
&gt; Perhaps some other commits also need backporting?<br>
&gt; Can please look into this?<br>
&gt; <br>
&gt; cheers<br>
&gt; Ankur<br>
&gt; <br>
&gt; On Tue, Oct 27, 2026 at 2:22=E2=80=AFPM J. S. via <a href=3D"http://li=
sts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedd=
ed.org</a><br>
&gt; &lt;schonm=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" targe=
t=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Add the eight unique upstream commits that fix the security advis=
ories<br>
&gt; addressed in c-ares 1.34.9.<br>
&gt; &gt; Several advisories share commits, so patches are ordered by commi=
t rather<br>
&gt; than duplicated per advisory; each patch lists the GHSA IDs it resolve=
s.<br>
&gt; &gt;<br>
&gt; &gt; Assisted-by: opencode (big-pickle)<br>
&gt; &gt; Signed-off-by: Jason Schonberg &lt;<a href=3D"mailto:schonm@gmail=
.com" target=3D"_blank">schonm@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...troy-detach-queries-before-callbacks.patch | 2603 ++++++=
+++++++++++<br>
&gt; &gt;=C2=A0 ...ed-socket-server-state-notifications.patch |=C2=A0 393 +=
++<br>
&gt; &gt;=C2=A0 ...qcache-hand-callbacks-their-own-copy.patch | 1054 ++++++=
+<br>
&gt; &gt;=C2=A0 ...connections-torn-down-by-application.patch | 1107 ++++++=
+<br>
&gt; &gt;=C2=A0 ...pt-an-answer-on-the-right-connection.patch |=C2=A0 575 +=
+++<br>
&gt; &gt;=C2=A0 ...tions-read-channel-config-under-lock.patch |=C2=A0 243 +=
+<br>
&gt; &gt;=C2=A0 ...res_inet_pton-reject-a-prefix-length.patch |=C2=A0 364 +=
++<br>
&gt; &gt;=C2=A0 ...nt-drop-UDP-answers-from-server-port.patch |=C2=A0 178 +=
+<br>
&gt; &gt;=C2=A0 .../recipes-support/c-ares/<a href=3D"http://c-ares_1.34.8.=
bb" rel=3D"noreferrer" target=3D"_blank">c-ares_1.34.8.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A0 8 +<br>
&gt; &gt;=C2=A0 9 files changed, 6525 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/00=
01-ares_cancel-<br>
&gt; ares_destroy-detach-queries-before-callbacks.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/00=
02-Deliver-<br>
&gt; deferred-socket-server-state-notifications.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/00=
03-<br>
&gt; ares_qcache-hand-callbacks-their-own-copy.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/00=
04-Handle-<br>
&gt; connections-torn-down-by-application.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/00=
05-<br>
&gt; ares_process-only-accept-an-answer-on-the-right-connection.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/00=
06-<br>
&gt; ares_save_options-read-channel-config-under-lock.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/00=
07-<br>
&gt; ares_inet_pton-reject-a-prefix-length.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/00=
08-<br>
&gt; ares_conn_read-dont-drop-UDP-answers-from-server-port.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-ares_canc=
el-<br>
&gt; ares_destroy-detach-queries-before-callbacks.patch b/meta-oe/recipes-<=
br>
&gt; support/c-ares/c-ares/0001-ares_cancel-ares_destroy-detach-queries-bef=
ore-<br>
&gt; callbacks.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..385760f5bc<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-support/c-ares/c-ares/0001-ares_cancel-ares=
_destroy-<br>
&gt; detach-queries-before-callbacks.patch<br>
&gt; &gt; @@ -0,0 +1,2603 @@<br>
&gt; &gt; +From 7f408deb128fbdcce78122322734ffaa01cad9ae Mon Sep 17 00:00:0=
0<br>
&gt; 2001<br>
&gt; &gt; +From: Brad House &lt;<a href=3D"mailto:brad@brad-house.com" targ=
et=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Date: Sun, 18 Oct 2026 18:15:41 -0400<br>
&gt; &gt; +Subject: [PATCH] ares_cancel/ares_destroy: detach queries before=
 running<br>
&gt; user<br>
&gt; &gt; + callbacks<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +Backport of dd62bdfca52ba5c37e88a1469c0a4c5e4a568ccb to v1.34.=
=C2=A0 See<br>
&gt; that<br>
&gt; &gt; +commit for the full description; it hardens reentrant teardown f=
rom<br>
&gt; &gt; +callbacks (ares_cancel(), ares_destroy(), server reconfiguration=
, and<br>
&gt; &gt; +socket/server state notifications).<br>
&gt; &gt; +<br>
&gt; &gt; +Conflicts were whitespace/alignment only (v1.34 predates the cla=
ng-format<br>
&gt; &gt; +reformat in #1238) and were reformatted to v1.34&#39;s style.<br=
>
&gt; &gt; +<br>
&gt; &gt; +Also carries the test portion of #1334 that applies to the tests=
 this<br>
&gt; &gt; +introduces: dead-server tests use <a href=3D"http://127.0.0.1:53=
055/53056" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:53055/53056</a> i=
nstead of<br>
&gt; &gt; +<a href=3D"http://127.0.0.55/56" rel=3D"noreferrer" target=3D"_b=
lank">127.0.0.55/56</a>, which only routes on Linux.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Brad House &lt;<a href=3D"mailto:brad@brad-house.=
com" target=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/c-ares/=
c-" rel=3D"noreferrer" target=3D"_blank">https://github.com/c-ares/c-</a><b=
r>
&gt; ares/commit/7f408deb128fbdcce78122322734ffaa01cad9ae]<br>
&gt; &gt; +GHSA: GHSA-wpr3-8q3r-4q8c, GHSA-97vq-4mxv-7vhm, GHSA-mw23-pfg6-<=
br>
&gt; 2x9r, GHSA-rf6g-ww74-97qh, GHSA-v33j-65h4-4ch8, GHSA-pj7p-v3cw-hq66<br=
>
&gt; &gt; +---<br>
&gt; &gt; + docs/ares_cancel.3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A017 +<br>
&gt; &gt; + docs/ares_destroy.3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 7 +<br>
&gt; &gt; + docs/ares_init_options.3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A015 +<br>
&gt; &gt; + docs/ares_set_server_state_callback.3 |=C2=A0 =C2=A031 +-<br>
&gt; &gt; + docs/ares_set_servers_csv.3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A017 +<br>
&gt; &gt; + src/lib/ares_cancel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A025 +-<br>
&gt; &gt; + src/lib/ares_close_sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A082 +-<br>
&gt; &gt; + src/lib/ares_conn.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 217 ++++-<br>
&gt; &gt; + src/lib/ares_conn.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A037 +-<br>
&gt; &gt; + src/lib/ares_destroy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A085 +-<br>
&gt; &gt; + src/lib/ares_private.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 110 ++-<br>
&gt; &gt; + src/lib/ares_process.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 235 +++++-<br>
&gt; &gt; + src/lib/ares_send.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A035 +<br>
&gt; &gt; + src/lib/ares_update_servers.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A042 +-<br>
&gt; &gt; + test/ares-test-mock.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 1068 +++++++++++++++++++++++++<br>
&gt; &gt; + 15 files changed, 1959 insertions(+), 64 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/docs/ares_cancel.3 b/docs/ares_cancel.3<br>
&gt; &gt; +index 967a946b49..069f226c10 100644<br>
&gt; &gt; +--- a/docs/ares_cancel.3<br>
&gt; &gt; ++++ b/docs/ares_cancel.3<br>
&gt; &gt; +@@ -21,6 +21,23 @@ These calls give the callbacks a chance to cl=
ean up<br>
&gt; any state which might have<br>
&gt; &gt; + been stored in their arguments. If such a callback invocation a=
dds a new<br>
&gt; &gt; + request to the channel, that request will \fInot\fP be cancelle=
d by the<br>
&gt; &gt; + current invocation of \fBares_cancel(3)\fP.<br>
&gt; &gt; ++.SH REENTRANCY<br>
&gt; &gt; ++A callback invoked by<br>
&gt; &gt; ++.BR ares_cancel (3)<br>
&gt; &gt; ++may call c-ares functions on the same channel. The channel lock=
 is recursive,<br>
&gt; &gt; ++and each query is unlinked from the library&#39;s internal stru=
ctures before its<br>
&gt; &gt; ++callback runs, so a reentrant call cannot encounter a query tha=
t is part-way<br>
&gt; &gt; ++through being torn down.<br>
&gt; &gt; ++<br>
&gt; &gt; ++This includes starting new lookups, as described above, and rec=
onfiguring<br>
&gt; the<br>
&gt; &gt; ++server list with<br>
&gt; &gt; ++.BR ares_set_servers_csv (3)<br>
&gt; &gt; ++and related functions.<br>
&gt; &gt; ++<br>
&gt; &gt; ++.SH AVAILABILITY<br>
&gt; &gt; ++The reentrancy guarantee described above applies as of c-ares v=
ersion<br>
&gt; 1.35.0,<br>
&gt; &gt; ++and c-ares version 1.34.9 on the 1.34 branch.<br>
&gt; &gt; ++<br>
&gt; &gt; + .SH SEE ALSO<br>
&gt; &gt; + .BR ares_init (3)<br>
&gt; &gt; + .BR ares_destroy (3)<br>
&gt; &gt; +diff --git a/docs/ares_destroy.3 b/docs/ares_destroy.3<br>
&gt; &gt; +index d1984b7cc9..0b6380e609 100644<br>
&gt; &gt; +--- a/docs/ares_destroy.3<br>
&gt; &gt; ++++ b/docs/ares_destroy.3<br>
&gt; &gt; +@@ -20,6 +20,13 @@ by the channel.<br>
&gt; &gt; + channel, passing a status of \fIARES_EDESTRUCTION\fP. These cal=
ls give<br>
&gt; the<br>
&gt; &gt; + callbacks a chance to clean up any state which might have been =
stored in<br>
&gt; their<br>
&gt; &gt; + arguments. A callback must not add new requests to a channel be=
ing<br>
&gt; destroyed.<br>
&gt; &gt; ++Such a request is refused: the request is not started, and its =
callback is<br>
&gt; &gt; ++invoked with a status of \fIARES_EDESTRUCTION\fP so that any st=
ate<br>
&gt; attached to<br>
&gt; &gt; ++its argument can be released. A request made from within that n=
otification is<br>
&gt; &gt; ++refused without a further notification, so that a callback whic=
h responds to<br>
&gt; &gt; ++failure by retrying cannot recurse without bound; its argument =
is not handed<br>
&gt; &gt; ++back. This applies as of c-ares version 1.35.0, and c-ares vers=
ion 1.34.9 on<br>
&gt; &gt; ++the 1.34 branch.<br>
&gt; &gt; +<br>
&gt; &gt; + There is no ability to make this function thread-safe.=C2=A0 No=
 additional calls<br>
&gt; &gt; + using this channel may be made once this function is called.<br=
>
&gt; &gt; +diff --git a/docs/ares_init_options.3 b/docs/ares_init_options.3=
<br>
&gt; &gt; +index 9b3b481535..e6f6ee8ba6 100644<br>
&gt; &gt; +--- a/docs/ares_init_options.3<br>
&gt; &gt; ++++ b/docs/ares_init_options.3<br>
&gt; &gt; +@@ -231,6 +231,21 @@ will be passed the socket whose state has c=
hanged;<br>
&gt; &gt; + will be set to true if the socket should listen for read events=
, and<br>
&gt; &gt; + .I writable<br>
&gt; &gt; + will be set to true if the socket should listen for write event=
s.<br>
&gt; &gt; ++<br>
&gt; &gt; ++This callback may call c-ares functions on the same channel, in=
cluding<br>
&gt; &gt; ++.BR ares_cancel (3)<br>
&gt; &gt; ++and the server configuration functions. Notifications are deliv=
ered once the<br>
&gt; &gt; ++library has finished the work that produced them rather than pa=
rt-way through<br>
&gt; &gt; ++it, so a reentrant call cannot close a socket the library is st=
ill using. They<br>
&gt; &gt; ++arrive in the order the state changes occurred, and always befo=
re the<br>
&gt; &gt; ++outermost c-ares call returns. A call made from within a callba=
ck is not the<br>
&gt; &gt; ++outermost one, so notifications it produces arrive after it has=
 returned.<br>
&gt; &gt; ++.BR ares_destroy (3)<br>
&gt; &gt; ++is no exception: the closure of every socket the channel still =
holds is<br>
&gt; &gt; ++reported before it returns, and the callback is never invoked a=
fterwards.<br>
&gt; &gt; ++This applies as of c-ares version 1.35.0, and c-ares version 1.=
34.9 on the<br>
&gt; &gt; ++1.34 branch.<br>
&gt; &gt; ++<br>
&gt; &gt; + The value of<br>
&gt; &gt; + .I sock_state_cb_data<br>
&gt; &gt; + will be passed as the<br>
&gt; &gt; +diff --git a/docs/ares_set_server_state_callback.3<br>
&gt; b/docs/ares_set_server_state_callback.3<br>
&gt; &gt; +index 04fbde4c7a..e95db327ce 100644<br>
&gt; &gt; +--- a/docs/ares_set_server_state_callback.3<br>
&gt; &gt; ++++ b/docs/ares_set_server_state_callback.3<br>
&gt; &gt; +@@ -47,6 +47,31 @@ the DNS servers used by an ares channel. For<=
br>
&gt; example, it can be used to track<br>
&gt; &gt; + metrics about the numbers and types of queries sent to each ser=
ver or to<br>
&gt; &gt; + detect when a server is uncontactable or unhealthy.<br>
&gt; &gt; +<br>
&gt; &gt; ++.SH REENTRANCY<br>
&gt; &gt; ++The server state callback may call c-ares functions on the same=
 channel,<br>
&gt; &gt; ++including<br>
&gt; &gt; ++.BR ares_cancel (3)<br>
&gt; &gt; ++and the server configuration functions. The channel lock is rec=
ursive and the<br>
&gt; &gt; ++library holds no query, connection or server state across the c=
allback.<br>
&gt; &gt; ++<br>
&gt; &gt; ++Notifications are queued and delivered once the library has fin=
ished the work<br>
&gt; &gt; ++that produced them, rather than part-way through it. A notifica=
tion is<br>
&gt; &gt; ++therefore observed after the processing pass that generated it,=
 not during.<br>
&gt; &gt; ++<br>
&gt; &gt; ++The callback and its<br>
&gt; &gt; ++.I user_data<br>
&gt; &gt; ++are read when the notification is delivered, not when it is que=
ued. An<br>
&gt; &gt; ++application that replaces its callback between those two points=
 will see the<br>
&gt; &gt; ++notification delivered to the new one; unregistering by passing=
 a<br>
&gt; &gt; ++.B NULL<br>
&gt; &gt; ++callback discards any notification still queued.<br>
&gt; &gt; ++<br>
&gt; &gt; ++This applies to a replacement made from within a c-ares callbac=
k, where the<br>
&gt; &gt; ++channel lock is held.<br>
&gt; &gt; ++.BR ares_set_server_state_callback (3)<br>
&gt; &gt; ++does not take the channel lock, so replacing the callback from =
another thread<br>
&gt; &gt; ++while the channel is processing is not synchronized against del=
ivery.<br>
&gt; &gt; ++<br>
&gt; &gt; + .SH FLAGS<br>
&gt; &gt; + .TP 5<br>
&gt; &gt; + .B ARES_SERV_STATE_UDP<br>
&gt; &gt; +@@ -58,5 +83,9 @@ Indicates that the query was tried over TCP.<b=
r>
&gt; &gt; + .SH AVAILABILITY<br>
&gt; &gt; + This function was first introduced in c-ares version 1.29.0.<br=
>
&gt; &gt; +<br>
&gt; &gt; ++The reentrancy guarantee described above applies as of c-ares v=
ersion<br>
&gt; 1.35.0,<br>
&gt; &gt; ++and c-ares version 1.34.9 on the 1.34 branch.<br>
&gt; &gt; ++<br>
&gt; &gt; + .SH SEE ALSO<br>
&gt; &gt; +-.BR ares_get_servers_csv (3)<br>
&gt; &gt; ++.BR ares_get_servers_csv (3),<br>
&gt; &gt; ++.BR ares_cancel (3)<br>
&gt; &gt; +diff --git a/docs/ares_set_servers_csv.3 b/docs/ares_set_servers=
_csv.3<br>
&gt; &gt; +index f1435143f5..f9f5b82e28 100644<br>
&gt; &gt; +--- a/docs/ares_set_servers_csv.3<br>
&gt; &gt; ++++ b/docs/ares_set_servers_csv.3<br>
&gt; &gt; +@@ -126,6 +126,23 @@ are identical.=C2=A0 Prior versions would s=
imply omit ports<br>
&gt; in \fBares_set_servers_cs<br>
&gt; &gt; + but due to the addition of link local interface support, this d=
ifference was<br>
&gt; &gt; + removed.<br>
&gt; &gt; +<br>
&gt; &gt; ++.SH REENTRANCY<br>
&gt; &gt; ++These functions may be called from within a c-ares callback. Re=
moving a<br>
&gt; server<br>
&gt; &gt; ++closes its connections, which ends the lookups that were using =
it and invokes<br>
&gt; &gt; ++their callbacks, so a reconfiguration can be requested from ins=
ide one.<br>
&gt; &gt; ++<br>
&gt; &gt; ++A nested call reconciles the whole server list, and the outer c=
all leaves that<br>
&gt; &gt; ++result in place rather than deleting the servers the nested cal=
l installed.<br>
&gt; &gt; ++The consequence is that the outer call&#39;s own list does not =
survive, even<br>
&gt; &gt; ++though it returns<br>
&gt; &gt; ++.B ARES_SUCCESS:<br>
&gt; &gt; ++the last configuration applied is the one the channel keeps. An=
 application<br>
&gt; &gt; ++that reconfigures from a callback should therefore not assume t=
he list it<br>
&gt; &gt; ++passed to the outer call is in effect when that call returns.<b=
r>
&gt; &gt; ++<br>
&gt; &gt; ++This applies as of c-ares version 1.35.0, and c-ares version 1.=
34.9 on the<br>
&gt; &gt; ++1.34 branch.<br>
&gt; &gt; ++<br>
&gt; &gt; + .SH EXAMPLE<br>
&gt; &gt; + .nf<br>
&gt; &gt; + 192.168.1.100,[fe80::1]:53%eth0,dns://<a href=3D"http://192.168=
.1.1?tcpport=3D1153" rel=3D"noreferrer" target=3D"_blank">192.168.1.1?tcppo=
rt=3D1153</a><br>
&gt; &gt; +diff --git a/src/lib/ares_cancel.c b/src/lib/ares_cancel.c<br>
&gt; &gt; +index 75600dea6b..aa167e4486 100644<br>
&gt; &gt; +--- a/src/lib/ares_cancel.c<br>
&gt; &gt; ++++ b/src/lib/ares_cancel.c<br>
&gt; &gt; +@@ -38,10 +38,10 @@ void ares_cancel(ares_channel_t *channel)<br=
>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_lock(channel);<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0if (ares_llist_len(channel-&gt;all_queries) &gt; 0)=
 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ares_llist_node_t *node =3D NULL;<br>
&gt; &gt; +-=C2=A0 =C2=A0 ares_llist_node_t *next =3D NULL;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Swap list heads, so that only those queri=
es which were present on entry<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * into this function are cancelled. New que=
ries added by callbacks of<br>
&gt; &gt; +@@ -57,21 +57,29 @@ void ares_cancel(ares_channel_t *channel)<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* LCOV_EXCL_LINE:=
 OutOfMemory */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 node =3D ares_llist_node_first(list_copy);<br>
&gt; &gt; +-=C2=A0 =C2=A0 while (node !=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Re-read the head each iteration rather than ca=
ching the next node: a<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* callback below may cause other queries in=
 this same list to be ended<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* and their nodes destroyed. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 while ((node =3D ares_llist_node_first(list_copy)=
) !=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ares_query_t *query;<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 /* Cache next since this node is being del=
eted */<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 next =3D ares_llist_node_next(node);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 query =3D ares_llist_node_claim(node);<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 query=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ares_llist_node_claim(node);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* Must come first: node_claim() already d=
estroyed this node, so<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* ares_detach_query() would otherwis=
e destroy it a second time. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0query-&gt;node_all_queries =3D NULL;<=
br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* Detach from queries_by_qid, the connect=
ion and the timeout list<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* before running user code.=C2=A0 Ot=
herwise a reentrant teardown from<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* within the callback -- ares_set_se=
rvers_csv(), or a new query<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* hitting a connection error -- stil=
l finds this query, ends it a<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* second time and frees it, and the =
ares_free_query() below then<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* double-frees. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ares_detach_query(query);<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* NOTE: its possible this may enqueu=
e new queries */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0query-&gt;callback(query-&gt;arg, ARE=
S_ECANCELLED, 0, NULL);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ares_free_query(query);<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 node =3D next;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ares_llist_destroy(list_copy);<br>
&gt; &gt; +@@ -83,5 +91,6 @@ void ares_cancel(ares_channel_t *channel)<br>
&gt; &gt; +=C2=A0 =C2=A0ares_queue_notify_empty(channel);<br>
&gt; &gt; +<br>
&gt; &gt; + done:<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_unlock(channel);<br>
&gt; &gt; + }<br>
&gt; &gt; +diff --git a/src/lib/ares_close_sockets.c b/src/lib/ares_close_s=
ockets.c<br>
&gt; &gt; +index 7bb72c31ec..6be662fdd3 100644<br>
&gt; &gt; +--- a/src/lib/ares_close_sockets.c<br>
&gt; &gt; ++++ b/src/lib/ares_close_sockets.c<br>
&gt; &gt; +@@ -41,12 +41,47 @@ static void ares_requeue_queries(ares_conn_t=
<br>
&gt; *conn,<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++/*! Release a connection&#39;s memory.=C2=A0 Split from the unl=
ink below so that the<br>
&gt; &gt; ++ *=C2=A0 two can happen at different times: a caller further up=
 the stack may still<br>
&gt; &gt; ++ *=C2=A0 hold this pointer, and reading a detached connection i=
s safe where<br>
&gt; reading<br>
&gt; &gt; ++ *=C2=A0 a freed one is not. */<br>
&gt; &gt; ++void ares_conn_reap(ares_conn_t *conn)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 if (conn =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return; /* LCOV_EXCL_LINE: DefensiveCoding */<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_buf_destroy(conn-&gt;in_buf);<br>
&gt; &gt; ++=C2=A0 ares_buf_destroy(conn-&gt;out_buf);<br>
&gt; &gt; ++=C2=A0 ares_llist_destroy(conn-&gt;queries_to_conn);<br>
&gt; &gt; ++=C2=A0 ares_free(conn);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + void ares_close_connection(ares_conn_t *conn, ares_status_t<br>
&gt; requeue_status)<br>
&gt; &gt; + {<br>
&gt; &gt; +-=C2=A0 ares_server_t=C2=A0 *server=C2=A0 =3D conn-&gt;server;<b=
r>
&gt; &gt; +-=C2=A0 ares_channel_t *channel =3D server-&gt;channel;<br>
&gt; &gt; ++=C2=A0 ares_server_t=C2=A0 *server;<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (conn =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return; /* LCOV_EXCL_LINE: DefensiveCoding */<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Already torn down and awaiting reclamation.=C2=A0 Rea=
ching here twice is<br>
&gt; &gt; ++=C2=A0 =C2=A0* ordinary once a connection can outlive its teard=
own: a caller holding it<br>
&gt; &gt; ++=C2=A0 =C2=A0* from before -- handle_conn_error() after a faile=
d write, say -- closes it<br>
&gt; &gt; ++=C2=A0 =C2=A0* again without knowing.=C2=A0 Doing the work twic=
e would requeue queries that<br>
&gt; &gt; ++=C2=A0 =C2=A0* have already moved and would put this connection=
 on the pending list a<br>
&gt; &gt; ++=C2=A0 =C2=A0* second time, which is a double free. */<br>
&gt; &gt; ++=C2=A0 if (conn-&gt;flags &amp; ARES_CONN_FLAG_DEAD) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 /* Unlink */<br>
&gt; &gt; ++=C2=A0 server=C2=A0 =3D conn-&gt;server;<br>
&gt; &gt; ++=C2=A0 channel =3D server-&gt;channel;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Unlink from everything that can find this connection.=
=C2=A0 After this it is<br>
&gt; &gt; ++=C2=A0 =C2=A0* unreachable by lookup, which is what stops anyth=
ing new from picking it<br>
&gt; &gt; ++=C2=A0 =C2=A0* up; anything that already holds it is handled by=
 the deferral below. */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_llist_node_claim(<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ares_htable_asvp_get_direct(channel-&gt;conn=
node_by_socket, conn-&gt;fd));<br>
&gt; &gt; +=C2=A0 =C2=A0ares_htable_asvp_remove(channel-&gt;connnode_by_soc=
ket, conn-&gt;fd);<br>
&gt; &gt; +@@ -55,19 +90,40 @@ void ares_close_connection(ares_conn_t *conn=
,<br>
&gt; ares_status_t requeue_status)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0server-&gt;tcp_conn =3D NULL;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 ares_buf_destroy(conn-&gt;in_buf);<br>
&gt; &gt; +-=C2=A0 ares_buf_destroy(conn-&gt;out_buf);<br>
&gt; &gt; ++=C2=A0 /* Marked dead as soon as it is unlinked, before anythin=
g below can run<br>
&gt; &gt; ++=C2=A0 =C2=A0* application code.=C2=A0 ares_requeue_queries() e=
nds queries terminally once<br>
&gt; &gt; ++=C2=A0 =C2=A0* their retries are exhausted, which invokes the a=
pplication&#39;s callback; if<br>
&gt; &gt; ++=C2=A0 =C2=A0* the flag were set after that, a second ares_clos=
e_connection() reaching<br>
&gt; &gt; ++=C2=A0 =C2=A0* this connection in the meantime would run the bo=
dy again -- closing the<br>
&gt; &gt; ++=C2=A0 =C2=A0* descriptor twice and listing the connection for =
reclamation twice, which<br>
&gt; &gt; ++=C2=A0 =C2=A0* is a double free.=C2=A0 It also gives ares_close=
_sockets() its termination<br>
&gt; &gt; ++=C2=A0 =C2=A0* condition: dead implies unlinked, so its re-read=
-the-head loop cannot see<br>
&gt; &gt; ++=C2=A0 =C2=A0* a dead connection and spin. */<br>
&gt; &gt; ++=C2=A0 conn-&gt;flags |=3D ARES_CONN_FLAG_DEAD;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* Requeue queries to other connections */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_requeue_queries(conn, requeue_status);<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 ares_llist_destroy(conn-&gt;queries_to_conn);<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0 ares_conn_sock_state_cb_update(conn, ARES_CONN_STATE_NON=
E);<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0 ares_socket_close(channel, conn-&gt;fd);<br>
&gt; &gt; ++=C2=A0 /* Hands the descriptor to the queued notification when =
one is due, so the<br>
&gt; &gt; ++=C2=A0 =C2=A0* application is told to stop watching it before i=
t is closed.=C2=A0 Otherwise<br>
&gt; &gt; ++=C2=A0 =C2=A0* nothing will carry it and we close it here. */<b=
r>
&gt; &gt; ++=C2=A0 if (!ares_conn_sock_state_cb_close(conn)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_socket_close(channel, conn-&gt;fd);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 conn-&gt;fd =3D ARES_SOCKET_BAD;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* If a library call is in progress it may be holding th=
is connection --<br>
&gt; &gt; ++=C2=A0 =C2=A0* read_answers() and ares_send_query_int() both do=
, across code that can<br>
&gt; &gt; ++=C2=A0 =C2=A0* reach here.=C2=A0 Keep it readable until that ca=
ll unwinds.=C2=A0 The buffers and<br>
&gt; &gt; ++=C2=A0 =C2=A0* the query list are freed by ares_conn_reap(), so=
 a stale holder sees an<br>
&gt; &gt; ++=C2=A0 =C2=A0* emptied connection rather than freed memory. */<=
br>
&gt; &gt; ++=C2=A0 if (channel-&gt;deferred_cb_depth &gt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 conn-&gt;next_pending=C2=A0 =C2=A0 =C2=A0=3D chan=
nel-&gt;pending_conns;<br>
&gt; &gt; ++=C2=A0 =C2=A0 channel-&gt;pending_conns =3D conn;<br>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 ares_free(conn);<br>
&gt; &gt; ++=C2=A0 ares_conn_reap(conn);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; + void ares_close_sockets(ares_server_t *server)<br>
&gt; &gt; +@@ -76,6 +132,10 @@ void ares_close_sockets(ares_server_t *serve=
r)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0while ((node =3D ares_llist_node_first(server-&gt;c=
onnections)) !=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ares_conn_t *conn =3D ares_llist_node_val(no=
de);<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* This loop re-reads the head each time and reli=
es on the close below<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* unlinking it.=C2=A0 A dead connection ret=
urns early without unlinking, so<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* one on this list would spin forever holdi=
ng the channel lock. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 assert(!(conn-&gt;flags &amp; ARES_CONN_FLAG_DEAD=
));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ares_close_connection(conn, ARES_SUCCESS);<b=
r>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; + }<br>
&gt; &gt; +diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c<br>
&gt; &gt; +index 6b315b0548..78f57e7d10 100644<br>
&gt; &gt; +--- a/src/lib/ares_conn.c<br>
&gt; &gt; ++++ b/src/lib/ares_conn.c<br>
&gt; &gt; +@@ -26,19 +26,210 @@<br>
&gt; &gt; +=C2=A0 */<br>
&gt; &gt; + #include &quot;ares_private.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +-void ares_conn_sock_state_cb_update(ares_conn_t=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *conn,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_conn_st=
ate_flags_t flags)<br>
&gt; &gt; ++/*! A queued socket-state notification.=C2=A0 Holds the descrip=
tor and the state,<br>
&gt; &gt; ++ *=C2=A0 never the connection, so a queued entry cannot outlive=
 what it refers to.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 When \c owns_fd is set, this message carries the only =
remaining reference<br>
&gt; to<br>
&gt; &gt; ++ *=C2=A0 the descriptor: the connection is gone and the descrip=
tor is deliberately<br>
&gt; &gt; ++ *=C2=A0 left open until after the application has been told to=
 stop watching it.<br>
&gt; &gt; ++ *=C2=A0 Closing first would let the number be reused -- by app=
lication code running<br>
&gt; &gt; ++ *=C2=A0 from a deferred query callback, for instance -- before=
 the notification<br>
&gt; &gt; ++ *=C2=A0 naming it is delivered. */<br>
&gt; &gt; ++typedef struct {<br>
&gt; &gt; ++=C2=A0 ares_socket_t fd;<br>
&gt; &gt; ++=C2=A0 ares_bool_t=C2=A0 =C2=A0readable;<br>
&gt; &gt; ++=C2=A0 ares_bool_t=C2=A0 =C2=A0writable;<br>
&gt; &gt; ++=C2=A0 ares_bool_t=C2=A0 =C2=A0owns_fd;<br>
&gt; &gt; ++} ares_sock_state_msg_t;<br>
&gt; &gt; ++<br>
&gt; &gt; ++static ares_bool_t ares_sock_state_queue(ares_channel_t=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *channel,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const ares_sock_state_msg_t *msg)<br>
&gt; &gt; + {<br>
&gt; &gt; +-=C2=A0 ares_channel_t *channel =3D conn-&gt;server-&gt;channel;=
<br>
&gt; &gt; ++=C2=A0 if (channel-&gt;sock_state_queue =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 channel-&gt;sock_state_queue =3D ares_array_creat=
e(sizeof(*msg), NULL);<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (channel-&gt;sock_state_queue =3D=3D NULL) {<b=
r>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 return ARES_FALSE; /* LCOV_EXCL_LINE: OutO=
fMemory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (ares_array_insertdata_last(channel-&gt;sock_state_qu=
eue, msg) !=3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_FALSE; /* LCOV_EXCL_LINE: OutOfMemory=
 */<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 return ARES_TRUE;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++/*! Deliver every socket-state notification the channel has que=
ued.=C2=A0 Loops<br>
&gt; &gt; ++ *=C2=A0 rather than snapshotting: a callback is allowed to re-=
enter the library and<br>
&gt; &gt; ++ *=C2=A0 queue more, and those belong to this same delivery poi=
nt. */<br>
&gt; &gt; ++static void ares_sock_state_dispatch(ares_channel_t *channel)<b=
r>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 while (ares_array_len(channel-&gt;sock_state_queue) &gt;=
 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_sock_state_msg_t msg;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (ares_array_claim_at(&amp;msg, sizeof(msg), ch=
annel-&gt;sock_state_queue,<br>
&gt; 0) !=3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 break; /* LCOV_EXCL_LINE: DefensiveCoding =
*/<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 if ((conn-&gt;state_flags &amp; ARES_CONN_STATE_CBFLAGS)=
 !=3D flags &amp;&amp;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 channel-&gt;sock_state_cb) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 channel-&gt;sock_state_cb(channel-&gt;sock_state_=
cb_data, conn-&gt;fd,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags &amp; ARES_CONN_STATE_READ ? 1 : 0,=
<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags &amp; ARES_CONN_STATE_WRITE ? 1 : 0=
);<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (channel-&gt;sock_state_cb !=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* The public callback takes ints. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 channel-&gt;sock_state_cb(channel-&gt;sock=
_state_cb_data, msg.fd,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.readable ? 1 : 0, msg.writable=
 ? 1 : 0);<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Told first, closed second -- the ordering the =
application depends on to<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* keep its descriptor set honest. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (msg.owns_fd) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ares_socket_close(channel, msg.fd);<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_array_destroy(channel-&gt;sock_state_queue);<br>
&gt; &gt; ++=C2=A0 channel-&gt;sock_state_queue =3D NULL;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void ares_deferred_cb_flush(ares_channel_t *channel)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 /* Only the outermost frame delivers: anything above us =
on the stack may<br>
&gt; &gt; ++=C2=A0 =C2=A0* still be holding the connection a reentrant call=
 from one of these<br>
&gt; &gt; ++=C2=A0 =C2=A0* callbacks could free.<br>
&gt; &gt; ++=C2=A0 =C2=A0*<br>
&gt; &gt; ++=C2=A0 =C2=A0* The dispatch below counts as a nesting level of =
its own.=C2=A0 Without that, a<br>
&gt; &gt; ++=C2=A0 =C2=A0* callback that calls back into the library re-ent=
ers here through the<br>
&gt; &gt; ++=C2=A0 =C2=A0* enter/leave pair on that call, drains the rest o=
f the queue and destroys<br>
&gt; &gt; ++=C2=A0 =C2=A0* it underneath the loop -- and hands the next not=
ification to the<br>
&gt; &gt; ++=C2=A0 =C2=A0* application from inside the current one.=C2=A0 W=
ith the counter held, the<br>
&gt; &gt; ++=C2=A0 =C2=A0* nested leave returns immediately and whatever it=
 queued is picked up by<br>
&gt; &gt; ++=C2=A0 =C2=A0* the loop that is already running. */<br>
&gt; &gt; ++=C2=A0 if (channel-&gt;deferred_cb_depth &gt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 channel-&gt;deferred_cb_depth++;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Both kinds of deferred notification share this one de=
livery point.=C2=A0 Loop<br>
&gt; &gt; ++=C2=A0 =C2=A0* rather than calling each once: a socket-state ca=
llback may put the library<br>
&gt; &gt; ++=C2=A0 =C2=A0* on a path that queues a server-state notificatio=
n, and the reverse, and<br>
&gt; &gt; ++=C2=A0 =C2=A0* both belong to this delivery point rather than t=
he next one. */<br>
&gt; &gt; ++=C2=A0 while (ares_array_len(channel-&gt;sock_state_queue) &gt;=
 0 ||<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_array_len(channel-&gt;se=
rver_state_queue) &gt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_sock_state_dispatch(channel);<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_server_state_dispatch(channel);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* The outermost call is unwinding and the callbacks abo=
ve have run, so<br>
&gt; &gt; ++=C2=A0 =C2=A0* nothing can still be holding a server or connect=
ion that was unlinked<br>
&gt; &gt; ++=C2=A0 =C2=A0* during it.=C2=A0 Now they can be freed. */<br>
&gt; &gt; ++=C2=A0 ares_deferred_reclaim(channel);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 channel-&gt;deferred_cb_depth--;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++void ares_deferred_reclaim(ares_channel_t *channel)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 /* Connections first: a pending server&#39;s connection =
list is already empty,<br>
&gt; &gt; ++=C2=A0 =C2=A0* but this keeps the ordering obvious rather than =
incidental. */<br>
&gt; &gt; ++=C2=A0 while (channel-&gt;pending_conns !=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_conn_t *conn=C2=A0 =C2=A0 =C2=A0 =3D channel=
-&gt;pending_conns;<br>
&gt; &gt; ++=C2=A0 =C2=A0 channel-&gt;pending_conns =3D conn-&gt;next_pendi=
ng;<br>
&gt; &gt; ++=C2=A0 =C2=A0 conn-&gt;next_pending=C2=A0 =C2=A0 =C2=A0=3D NULL=
;<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_conn_reap(conn);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 while (channel-&gt;pending_servers !=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_server_t *server=C2=A0 =C2=A0 =3D channel-&g=
t;pending_servers;<br>
&gt; &gt; ++=C2=A0 =C2=A0 channel-&gt;pending_servers =3D server-&gt;next_p=
ending;<br>
&gt; &gt; ++=C2=A0 =C2=A0 server-&gt;next_pending=C2=A0 =C2=A0 =C2=A0=3D NU=
LL;<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_server_reap(server);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++void ares_deferred_cb_enter(ares_channel_t *channel)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 channel-&gt;deferred_cb_depth++;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++void ares_deferred_cb_leave(ares_channel_t *channel)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 if (channel-&gt;deferred_cb_depth &gt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 channel-&gt;deferred_cb_depth--;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_flush(channel);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++ares_bool_t ares_conn_sock_state_cb_close(ares_conn_t *conn)<br=
>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0*channel =3D co=
nn-&gt;server-&gt;channel;<br>
&gt; &gt; ++=C2=A0 ares_sock_state_msg_t msg;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* No callback to run, so nothing will ever carry this d=
escriptor: the<br>
&gt; &gt; ++=C2=A0 =C2=A0* caller closes it itself, exactly as before. */<b=
r>
&gt; &gt; ++=C2=A0 if (channel-&gt;sock_state_cb =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_FALSE;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Already reported as unwatched, so no notification is =
due and no message<br>
&gt; &gt; ++=C2=A0 =C2=A0* will be queued to hold the descriptor. */<br>
&gt; &gt; ++=C2=A0 if ((conn-&gt;state_flags &amp; ARES_CONN_STATE_CBFLAGS)=
 =3D=3D<br>
&gt; ARES_CONN_STATE_NONE) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_FALSE;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 msg.fd=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D conn-&gt;fd;<br>
&gt; &gt; ++=C2=A0 msg.readable =3D ARES_FALSE;<br>
&gt; &gt; ++=C2=A0 msg.writable =3D ARES_FALSE;<br>
&gt; &gt; ++=C2=A0 msg.owns_fd=C2=A0 =3D ARES_TRUE;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (!ares_sock_state_queue(channel, &amp;msg)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_FALSE; /* LCOV_EXCL_LINE: OutOfMemory=
 */<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0conn-&gt;state_flags &amp;=3D ~((unsigned int)ARES_=
CONN_STATE_CBFLAGS);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 return ARES_TRUE;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++void ares_conn_sock_state_cb_update(ares_conn_t=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *conn,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_conn_st=
ate_flags_t flags)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0*channel =3D co=
nn-&gt;server-&gt;channel;<br>
&gt; &gt; ++=C2=A0 ares_sock_state_msg_t msg;<br>
&gt; &gt; ++=C2=A0 ares_bool_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chan=
ged =3D ARES_FALSE;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if ((conn-&gt;state_flags &amp; ARES_CONN_STATE_CBFLAGS)=
 !=3D flags) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 changed =3D ARES_TRUE;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 msg.fd=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D conn-&gt;fd;<br>
&gt; &gt; ++=C2=A0 msg.readable =3D flags &amp; ARES_CONN_STATE_READ ? ARES=
_TRUE :<br>
&gt; ARES_FALSE;<br>
&gt; &gt; ++=C2=A0 msg.writable =3D flags &amp; ARES_CONN_STATE_WRITE ? ARE=
S_TRUE :<br>
&gt; ARES_FALSE;<br>
&gt; &gt; ++=C2=A0 msg.owns_fd=C2=A0 =3D ARES_FALSE; /* the connection stil=
l owns it */<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (!changed || channel-&gt;sock_state_cb =3D=3D NULL) {=
<br>
&gt; &gt; ++=C2=A0 =C2=A0 conn-&gt;state_flags &amp;=3D ~((unsigned int)ARE=
S_CONN_STATE_CBFLAGS);<br>
&gt; &gt; ++=C2=A0 =C2=A0 conn-&gt;state_flags |=3D flags;<br>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Queue rather than dispatch.=C2=A0 This runs in the mi=
ddle of opening, writing<br>
&gt; &gt; ++=C2=A0 =C2=A0* to or closing a connection, and every caller kee=
ps using that connection<br>
&gt; &gt; ++=C2=A0 =C2=A0* afterwards.=C2=A0 The callback is application co=
de that may reentrantly call<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_cancel() or ares_set_servers_csv(), either =
of which frees the<br>
&gt; &gt; ++=C2=A0 =C2=A0* connection -- the first through the idle-connect=
ion sweep, the second by<br>
&gt; &gt; ++=C2=A0 =C2=A0* destroying the server that owns it.=C2=A0 Delive=
r once no frame still holds<br>
&gt; &gt; ++=C2=A0 =C2=A0* it.<br>
&gt; &gt; ++=C2=A0 =C2=A0*<br>
&gt; &gt; ++=C2=A0 =C2=A0* Only the descriptor and the state are captured, =
never the connection, and<br>
&gt; &gt; ++=C2=A0 =C2=A0* insertion order is preserved so the application =
observes the same<br>
&gt; &gt; ++=C2=A0 =C2=A0* sequence it would have seen inline. */<br>
&gt; &gt; ++=C2=A0 if (!ares_sock_state_queue(channel, &amp;msg)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return; /* LCOV_EXCL_LINE: OutOfMemory */<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Recorded as reported only now: on either failure abov=
e the connection<br>
&gt; &gt; ++=C2=A0 =C2=A0* stays eligible to notify again, rather than reme=
mbering a state the<br>
&gt; &gt; ++=C2=A0 =C2=A0* application was never told about. */<br>
&gt; &gt; ++=C2=A0 conn-&gt;state_flags &amp;=3D ~((unsigned int)ARES_CONN_=
STATE_CBFLAGS);<br>
&gt; &gt; +=C2=A0 =C2=A0conn-&gt;state_flags |=3D flags;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -435,6 +626,16 @@ ares_status_t ares_open_connection(ares_con=
n_t<br>
&gt; **conn_out,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0conn-&gt;flags |=3D ARES_CONN_FLAG_TFO_INITI=
AL;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* The socket-configure and socket-create callbacks abov=
e are application<br>
&gt; &gt; ++=C2=A0 =C2=A0* code, and either may reconfigure the servers -- =
which destroys the ones<br>
&gt; &gt; ++=C2=A0 =C2=A0* the new configuration omits, including possibly =
this one.=C2=A0 Everything<br>
&gt; &gt; ++=C2=A0 =C2=A0* below dereferences it, starting with conn-&gt;se=
rver in<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_conn_set_self_ip(). */<br>
&gt; &gt; ++=C2=A0 if (!ares_server_in_channel(channel, server)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 status =3D ARES_ECONNREFUSED;<br>
&gt; &gt; ++=C2=A0 =C2=A0 goto done;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0/* Need to store our own ip for DNS cookie support =
*/<br>
&gt; &gt; +=C2=A0 =C2=A0status =3D ares_conn_set_self_ip(conn, ARES_TRUE);<=
br>
&gt; &gt; +=C2=A0 =C2=A0if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; +diff --git a/src/lib/ares_conn.h b/src/lib/ares_conn.h<br>
&gt; &gt; +index c332de14b1..fc177b84f6 100644<br>
&gt; &gt; +--- a/src/lib/ares_conn.h<br>
&gt; &gt; ++++ b/src/lib/ares_conn.h<br>
&gt; &gt; +@@ -49,7 +49,14 @@ typedef enum {<br>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 it).=C2=A0 Its in-flight queries continue =
to drain and it is cleaned up once<br>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 idle.=C2=A0 This is a per-connection signa=
l so that a transient failure does<br>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 not evict otherwise-healthy connections to=
 the same server. */<br>
&gt; &gt; +-=C2=A0 ARES_CONN_FLAG_NONEW =3D 1 &lt;&lt; 3<br>
&gt; &gt; ++=C2=A0 ARES_CONN_FLAG_NONEW =3D 1 &lt;&lt; 3,<br>
&gt; &gt; ++=C2=A0 /*! Connection has been torn down: unlinked from every l=
ookup structure, its<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 descriptor closed or handed to a pending n=
otification, and its queries<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 requeued.=C2=A0 It survives only so that a=
 caller further up the stack which<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 captured it before the teardown can still =
read it; see<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 ares_deferred_reclaim().=C2=A0 Teardown is=
 idempotent -- a second<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 ares_close_connection() on a dead connecti=
on does nothing. */<br>
&gt; &gt; ++=C2=A0 ARES_CONN_FLAG_DEAD =3D 1 &lt;&lt; 4<br>
&gt; &gt; + } ares_conn_flags_t;<br>
&gt; &gt; +<br>
&gt; &gt; + typedef enum {<br>
&gt; &gt; +@@ -84,6 +91,10 @@ struct ares_conn {<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* list of outstanding queries to this connection *=
/<br>
&gt; &gt; +=C2=A0 =C2=A0ares_llist_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*queries_to_conn;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /*! Next connection awaiting reclamation.=C2=A0 Set only=
 while this connection is<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 on channel-&gt;pending_conns; see ares_def=
erred_reclaim(). */<br>
&gt; &gt; ++=C2=A0 ares_conn_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ne=
xt_pending;<br>
&gt; &gt; + };<br>
&gt; &gt; +<br>
&gt; &gt; + /*! Various buckets for grouping history */<br>
&gt; &gt; +@@ -168,6 +179,10 @@ struct ares_server {<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* Link back to owning channel */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0*channel;<=
br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /*! Next server awaiting reclamation.=C2=A0 Set only whi=
le this server is on<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 channel-&gt;pending_servers; see ares_defe=
rred_reclaim(). */<br>
&gt; &gt; ++=C2=A0 ares_server_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 *next_pending;<=
br>
&gt; &gt; + };<br>
&gt; &gt; +<br>
&gt; &gt; + void ares_close_connection(ares_conn_t *conn, ares_status_t<br>
&gt; requeue_status);<br>
&gt; &gt; +@@ -185,8 +200,24 @@ ares_status_t=C2=A0 =C2=A0ares_conn_flush(a=
res_conn_t<br>
&gt; *conn);<br>
&gt; &gt; + ares_conn_err_t ares_conn_read(ares_conn_t *conn, void *data, s=
ize_t len,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t *read_bytes);<br>
&gt; &gt; + ares_conn_t *ares_conn_from_fd(const ares_channel_t *channel,<b=
r>
&gt; ares_socket_t fd);<br>
&gt; &gt; +-void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_conn_sock_state_cb_u=
pdate(ares_conn_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *conn,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ares_conn_state_flags_t flags);<br>
&gt; &gt; ++<br>
&gt; &gt; ++/*! Queue the &quot;stop watching this descriptor&quot; notific=
ation for a connection<br>
&gt; &gt; ++ *=C2=A0 being torn down, handing the descriptor to that queued=
 message.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 The application must be told to stop watching a descri=
ptor while it is<br>
&gt; &gt; ++ *=C2=A0 still open -- close first and the number can be handed=
 to something else,<br>
&gt; &gt; ++ *=C2=A0 including by application code running from a deferred =
query callback,<br>
&gt; &gt; ++ *=C2=A0 before the notification naming it is delivered.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in] conn=C2=A0 Connection being closed.<br>
&gt; &gt; ++ *=C2=A0 \return ARES_TRUE if the queued notification took the =
descriptor, in which<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case the caller must not c=
lose it; ARES_FALSE if no notification is<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 due, and the caller closes=
 the descriptor itself.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++ares_bool_t=C2=A0 =C2=A0 =C2=A0ares_conn_sock_state_cb_close(ar=
es_conn_t *conn);<br>
&gt; &gt; ++<br>
&gt; &gt; ++void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_conn_sock_st=
ate_cb_update(ares_conn_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *conn,<b=
r>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_conn_state_flags_t flags);<br>
&gt; &gt; + ares_conn_err_t ares_socket_recv(ares_channel_t *channel, ares_=
socket_t<br>
&gt; s,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_bool_t is_tcp,=
 void *data,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t data_len, si=
ze_t *read_bytes);<br>
&gt; &gt; +diff --git a/src/lib/ares_destroy.c b/src/lib/ares_destroy.c<br>
&gt; &gt; +index 1e5706e0e0..e0534c800d 100644<br>
&gt; &gt; +--- a/src/lib/ares_destroy.c<br>
&gt; &gt; ++++ b/src/lib/ares_destroy.c<br>
&gt; &gt; +@@ -69,17 +69,31 @@ void ares_destroy(ares_channel_t *channel)<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 * callbacks need to hold a channel lock. */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_lock(channel);<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 /* Destroy all queries */<br>
&gt; &gt; +-=C2=A0 node =3D ares_llist_node_first(channel-&gt;all_queries);=
<br>
&gt; &gt; +-=C2=A0 while (node !=3D NULL) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 ares_llist_node_t *next=C2=A0 =3D ares_llist_node=
_next(node);<br>
&gt; &gt; +-=C2=A0 =C2=A0 ares_query_t=C2=A0 =C2=A0 =C2=A0 *query =3D ares_=
llist_node_claim(node);<br>
&gt; &gt; +-<br>
&gt; &gt; ++=C2=A0 /* Destroy all queries.<br>
&gt; &gt; ++=C2=A0 =C2=A0*<br>
&gt; &gt; ++=C2=A0 =C2=A0* The queries are detached before their callbacks =
run.=C2=A0 Claiming the node<br>
&gt; &gt; ++=C2=A0 =C2=A0* only unlinks a query from all_queries; it stays =
in queries_by_qid, on<br>
&gt; &gt; ++=C2=A0 =C2=A0* conn-&gt;queries_to_conn and in queries_by_timeo=
ut.=C2=A0 A reentrant teardown<br>
&gt; &gt; ++=C2=A0 =C2=A0* from inside the callback -- ares_set_servers_csv=
(), or a new query<br>
&gt; &gt; ++=C2=A0 =C2=A0* hitting a connection error -- would otherwise st=
ill find the query, end<br>
&gt; &gt; ++=C2=A0 =C2=A0* it a second time (invoking the application callb=
ack twice for one<br>
&gt; &gt; ++=C2=A0 =C2=A0* lookup) and free it, and the ares_free_query() b=
elow would double-free.<br>
&gt; &gt; ++=C2=A0 =C2=A0*<br>
&gt; &gt; ++=C2=A0 =C2=A0* The loop re-reads the first node each iteration =
rather than caching the<br>
&gt; &gt; ++=C2=A0 =C2=A0* next one, since a callback can cause other queri=
es in this same list to<br>
&gt; &gt; ++=C2=A0 =C2=A0* be ended and their nodes destroyed.=C2=A0 No lis=
t swap is needed: sys_up is<br>
&gt; &gt; ++=C2=A0 =C2=A0* already cleared above, so ares_send_nolock() ref=
uses new queries and<br>
&gt; &gt; ++=C2=A0 =C2=A0* nothing can be added while we drain. */<br>
&gt; &gt; ++=C2=A0 while ((node =3D ares_llist_node_first(channel-&gt;all_q=
ueries)) !=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_query_t *query =3D ares_llist_node_claim(nod=
e);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Must come first: node_claim() already destroye=
d this node, so<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* ares_detach_query() would otherwise destr=
oy it a second time. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0query-&gt;node_all_queries =3D NULL;<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_detach_query(query);<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0query-&gt;callback(query-&gt;arg, ARES_EDEST=
RUCTION, 0, NULL);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ares_free_query(query);<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0 =C2=A0 node =3D next;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_queue_notify_empty(channel);<br>
&gt; &gt; +@@ -93,7 +107,28 @@ void ares_destroy(ares_channel_t *channel)<b=
r>
&gt; &gt; +=C2=A0 =C2=A0assert(ares_slist_len(channel-&gt;queries_by_timeou=
t) =3D=3D 0);<br>
&gt; &gt; + #endif<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* Tearing down the servers closes every remaining conne=
ction.<br>
&gt; Applications<br>
&gt; &gt; ++=C2=A0 =C2=A0* rely on being told about those closures so they =
can drop the descriptors<br>
&gt; &gt; ++=C2=A0 =C2=A0* from their own event loop, so the notifications =
are still delivered here<br>
&gt; &gt; ++=C2=A0 =C2=A0* rather than discarded -- just after the teardown=
 instead of during it. */<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_destroy_servers_state(channel);<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* The leave above delivered and destroyed both queues a=
nd reclaimed<br>
&gt; &gt; ++=C2=A0 =C2=A0* everything the teardown unlinked, so these are n=
ormally no-ops.=C2=A0 They<br>
&gt; are<br>
&gt; &gt; ++=C2=A0 =C2=A0* not redundant: if the first insert into a freshl=
y created queue fails,<br>
&gt; &gt; ++=C2=A0 =C2=A0* the array is left allocated and empty, the flush=
 loop never runs because<br>
&gt; &gt; ++=C2=A0 =C2=A0* both queues are empty, and nothing else would ev=
er free it. */<br>
&gt; &gt; ++=C2=A0 ares_array_destroy(channel-&gt;sock_state_queue);<br>
&gt; &gt; ++=C2=A0 channel-&gt;sock_state_queue =3D NULL;<br>
&gt; &gt; ++=C2=A0 ares_array_destroy(channel-&gt;server_state_queue);<br>
&gt; &gt; ++=C2=A0 channel-&gt;server_state_queue =3D NULL;<br>
&gt; &gt; ++<br>
&gt; &gt; ++#ifndef NDEBUG<br>
&gt; &gt; ++=C2=A0 assert(channel-&gt;pending_servers =3D=3D NULL);<br>
&gt; &gt; ++=C2=A0 assert(channel-&gt;pending_conns =3D=3D NULL);<br>
&gt; &gt; ++#endif<br>
&gt; &gt; +<br>
&gt; &gt; + #ifndef NDEBUG<br>
&gt; &gt; +=C2=A0 =C2=A0assert(ares_htable_asvp_num_keys(channel-&gt;connno=
de_by_socket) =3D=3D 0);<br>
&gt; &gt; +@@ -134,17 +169,47 @@ void ares_destroy(ares_channel_t *channel)=
<br>
&gt; &gt; +=C2=A0 =C2=A0ares_free(channel);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +-void ares_destroy_server(ares_server_t *server)<br>
&gt; &gt; ++/*! Release a server&#39;s memory.=C2=A0 Split from ares_destro=
y_server() for the same<br>
&gt; &gt; ++ *=C2=A0 reason ares_conn_reap() is split out: a caller further=
 up the stack may<br>
&gt; &gt; ++ *=C2=A0 still hold this pointer. */<br>
&gt; &gt; ++void ares_server_reap(ares_server_t *server)<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0if (server =3D=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return; /* LCOV_EXCL_LINE: DefensiveCoding *=
/<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 ares_close_sockets(server);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_llist_destroy(server-&gt;connections);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_free(server);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++void ares_destroy_server(ares_server_t *server)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (server =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return; /* LCOV_EXCL_LINE: DefensiveCoding */<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 channel =3D server-&gt;channel;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Closes and unlinks every connection; each is deferred=
 or reaped by<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_close_connection() on the same rule applied=
 below. */<br>
&gt; &gt; ++=C2=A0 ares_close_sockets(server);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* The caller has already unlinked this server from chan=
nel-&gt;servers, so it<br>
&gt; &gt; ++=C2=A0 =C2=A0* can no longer be found -- ares_server_in_channel=
() and<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_slist_node_find() both report it gone, whic=
h is what callers check<br>
&gt; &gt; ++=C2=A0 =C2=A0* before acting on one.=C2=A0 But a library call i=
n progress may still be<br>
&gt; &gt; ++=C2=A0 =C2=A0* holding the pointer, so keep it readable until t=
hat call unwinds. */<br>
&gt; &gt; ++=C2=A0 if (channel !=3D NULL &amp;&amp; channel-&gt;deferred_cb=
_depth &gt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 server-&gt;next_pending=C2=A0 =C2=A0 =C2=A0=3D ch=
annel-&gt;pending_servers;<br>
&gt; &gt; ++=C2=A0 =C2=A0 channel-&gt;pending_servers =3D server;<br>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_server_reap(server);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + void ares_destroy_servers_state(ares_channel_t *channel)<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_slist_node_t *node;<br>
&gt; &gt; +diff --git a/src/lib/ares_private.h b/src/lib/ares_private.h<br>
&gt; &gt; +index 04d4576ed2..0a1029e0f8 100644<br>
&gt; &gt; +--- a/src/lib/ares_private.h<br>
&gt; &gt; ++++ b/src/lib/ares_private.h<br>
&gt; &gt; +@@ -147,7 +147,10 @@ typedef struct ares_query ares_query_t;<br>
&gt; &gt; + struct ares_query {<br>
&gt; &gt; +=C2=A0 =C2=A0/* Query ID from qbuf, for faster lookup, and curre=
nt timeout */<br>
&gt; &gt; +=C2=A0 =C2=A0unsigned short=C2=A0 =C2=A0 =C2=A0 =C2=A0qid; /* ho=
st byte order */<br>
&gt; &gt; +-=C2=A0 ares_timeval_t=C2=A0 =C2=A0 =C2=A0 =C2=A0ts;=C2=A0 /*!&l=
t; Timestamp query was sent */<br>
&gt; &gt; ++=C2=A0 /*! Distinguishes this query from any later one handed t=
he same qid.<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 Query ids are 16-bit and recycled; this co=
unter is not. */<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0serial;<br>
&gt; &gt; ++=C2=A0 ares_timeval_t=C2=A0 =C2=A0 =C2=A0 =C2=A0ts; /*!&lt; Tim=
estamp query was sent */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_timeval_t=C2=A0 =C2=A0 =C2=A0 =C2=A0timeout;<b=
r>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_t=C2=A0 =C2=A0 =C2=A0 *channel;<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -227,6 +230,9 @@ struct ares_channeldata {<br>
&gt; &gt; +=C2=A0 =C2=A0/* Server addresses and communications state. Sorte=
d by least consecutive<br>
&gt; &gt; +=C2=A0 =C2=A0 * failures, followed by the configuration order if=
 failures are equal. */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_slist_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 *servers;<b=
r>
&gt; &gt; ++=C2=A0 /*! Bumped by each ares_servers_update().=C2=A0 Lets the=
 stale-server removal<br>
&gt; loop<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 tell that a nested reconfiguration reconci=
led the list underneath it. */<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0servers_generation;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* random state to use when generating new ids and =
generating retry<br>
&gt; penalties<br>
&gt; &gt; +=C2=A0 =C2=A0 */<br>
&gt; &gt; +@@ -237,6 +243,10 @@ struct ares_channeldata {<br>
&gt; &gt; +=C2=A0 =C2=A0/* Queries bucketed by qid, for quickly dispatching=
 DNS responses: */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_htable_szvp_t=C2=A0 *queries_by_qid;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /*! Monotonic source for ares_query_t.serial.=C2=A0 Neve=
r reused for the life of<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 the channel, so a recycled query id cannot=
 impersonate an older query. */<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0query_serial;<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0/* Queries bucketed by timeout, for quickly handlin=
g timeouts: */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_slist_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 *queries_by=
_timeout;<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -248,6 +258,29 @@ struct ares_channeldata {<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_sock_state_cb=C2=A0 =C2=A0sock_state_cb;<br>
&gt; &gt; +=C2=A0 =C2=A0void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *sock_state_cb_data;<br>
&gt; &gt; ++=C2=A0 /*! Socket-state notifications queued during processing,=
 delivered once the<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 library is no longer holding a connection =
a reentrant call could free.<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 Insertion order is preserved, so an applic=
ation observes the same<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 sequence of state changes it would have se=
en inline. */<br>
&gt; &gt; ++=C2=A0 ares_array_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 *sock_state_queu=
e;<br>
&gt; &gt; ++=C2=A0 /*! Depth of nested library entry points that may produc=
e a deferred<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 application notification.=C2=A0 Queues are=
 delivered as this returns to<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 zero.=C2=A0 Shared by every deferred callb=
ack kind rather than one counter<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 per kind, so the delivery rule exists in e=
xactly one place. */<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0deferred_cb_depth;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /*! Servers and connections that have been unlinked from=
 every lookup<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 structure but not yet freed, because a lib=
rary call was in progress and<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 may still hold a pointer to them.=C2=A0 Dr=
ained by the same flush that<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 delivers deferred notifications, once no f=
rame can still be holding one.<br>
&gt; &gt; ++=C2=A0 =C2=A0*<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 This is what makes a stale ares_server_t o=
r ares_conn_t readable rather<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 than freed for the remainder of the call t=
hat captured it.=C2=A0 Callers<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 still revalidate before *acting* on one --=
 ares_server_in_channel() and<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 friends -- but a missed check is now &quot=
;used a server that was removed&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 rather than a use-after-free. */<br>
&gt; &gt; ++=C2=A0 ares_server_t=C2=A0 =C2=A0 =C2=A0 =C2=A0*pending_servers=
;<br>
&gt; &gt; ++=C2=A0 ares_conn_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*pending_co=
nns;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_sock_create_callback=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sock_create_cb;<br>
&gt; &gt; +=C2=A0 =C2=A0void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*sock_cre=
ate_cb_data;<br>
&gt; &gt; +@@ -295,6 +328,10 @@ struct ares_channeldata {<br>
&gt; &gt; +=C2=A0 =C2=A0/* Callback triggered when a server has a successfu=
l or failed response */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_server_state_callback=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 server_state_cb;<br>
&gt; &gt; +=C2=A0 =C2=A0void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*server_s=
tate_cb_data;<br>
&gt; &gt; ++=C2=A0 /*! Server-state notifications queued during processing,=
 dispatched once the<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 library is no longer holding pointers a re=
entrant callback could free.<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 See ares_deferred_cb_leave(). */<br>
&gt; &gt; ++=C2=A0 ares_array_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*server_state_queue;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* TRUE if a reinit is pending.=C2=A0 Reinit spawns=
 a thread to read the system<br>
&gt; &gt; +=C2=A0 =C2=A0 * configuration and then apply the configuration s=
ince configuration<br>
&gt; &gt; +@@ -308,6 +345,11 @@ struct ares_channeldata {<br>
&gt; &gt; +=C2=A0 =C2=A0 * system config changes might get triggered and we=
 need a flag to make<br>
&gt; &gt; +=C2=A0 =C2=A0 * sure we don&#39;t take action. */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_bool_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys_up;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /*! Set while ares_send_nolock() is running the refusal =
notification for a<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 channel being destroyed.=C2=A0 Bounds the =
recursion at one frame when the<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 application&#39;s callback responds by sta=
rting another lookup. */<br>
&gt; &gt; ++=C2=A0 ares_bool_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in_shutdown_refusal;<br>
&gt; &gt; + };<br>
&gt; &gt; +<br>
&gt; &gt; + /* Does the domain end in &quot;.onion&quot; or &quot;.onion.&q=
uot;? Case-insensitive. */<br>
&gt; &gt; +@@ -351,6 +393,16 @@ void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ares=
_dnsrec_convert_arg(ares_callback<br>
&gt; callback, void *arg);<br>
&gt; &gt; + void ares_dnsrec_convert_cb(void *arg, ares_status_t status, si=
ze_t timeouts,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const ares_dns_record_t *dnsrec);<=
br>
&gt; &gt; +<br>
&gt; &gt; ++/*! Unlink a query from every list and table that tracks it.<br=
>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 Must be called before running application code that co=
uld reach the query<br>
&gt; &gt; ++ *=C2=A0 again, so a reentrant teardown cannot find it and end =
it a second time.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in] query=C2=A0 Query to detach.=C2=A0 Safe to =
call more than once on the<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 same query.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++void ares_detach_query(ares_query_t *query);<br>
&gt; &gt; ++<br>
&gt; &gt; + void ares_free_query(ares_query_t *query);<br>
&gt; &gt; +<br>
&gt; &gt; + unsigned short ares_generate_new_id(ares_rand_state *state);<br=
>
&gt; &gt; +@@ -390,7 +442,6 @@ ares_status_t<br>
&gt; ares_sysconfig_set_options(ares_sysconfig_t *sysconfig,<br>
&gt; &gt; +<br>
&gt; &gt; + ares_status_t ares_init_by_environment(ares_sysconfig_t *syscon=
fig);<br>
&gt; &gt; +<br>
&gt; &gt; +-<br>
&gt; &gt; + typedef ares_status_t (*ares_sysconfig_line_cb_t)(const ares_ch=
annel_t<br>
&gt; *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_sysconfig_t=C2=A0 =C2=A0 =
=C2=A0*sysconfig,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_buf_t=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0*line);<br>
&gt; &gt; +@@ -589,6 +640,60 @@ ares_status_t ares_dns_name_write(ares_buf_=
t<br>
&gt; *buf, ares_llist_t **list,<br>
&gt; &gt; +=C2=A0 */<br>
&gt; &gt; + void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_queue_notify_empty(=
ares_channel_t *channel);<br>
&gt; &gt; +<br>
&gt; &gt; ++/*! Is this server still installed on the channel?<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 Application callbacks may reconfigure the servers, whi=
ch destroys any that<br>
&gt; &gt; ++ *=C2=A0 the new configuration omits.=C2=A0 A raw ares_server_t=
 captured before such a<br>
&gt; &gt; ++ *=C2=A0 callback must be revalidated before it is used again.<=
br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in] channel=C2=A0 Initialized ares channel.<br>
&gt; &gt; ++ *=C2=A0 \param[in] server=C2=A0 =C2=A0Server pointer captured =
earlier.<br>
&gt; &gt; ++ *=C2=A0 \return ARES_TRUE if still present.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++ares_bool_t=C2=A0 =C2=A0ares_server_in_channel(const ares_chann=
el_t *channel,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const =
ares_server_t=C2=A0 *server);<br>
&gt; &gt; ++<br>
&gt; &gt; ++/*! Free everything awaiting reclamation on the channel.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 Called only from the deferred-callback flush, at the p=
oint where the<br>
&gt; &gt; ++ *=C2=A0 outermost library call is unwinding and no frame can s=
till hold a pointer<br>
&gt; &gt; ++ *=C2=A0 to an unlinked server or connection.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in] channel=C2=A0 Initialized ares channel.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_deferred_reclaim(ar=
es_channel_t *channel);<br>
&gt; &gt; ++<br>
&gt; &gt; ++/*! Free one connection&#39;s memory.=C2=A0 Only for the deferr=
ed-reclaim path and the<br>
&gt; &gt; ++ *=C2=A0 immediate path in ares_close_connection(). */<br>
&gt; &gt; ++void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_conn_reap(ares_conn=
_t *conn);<br>
&gt; &gt; ++<br>
&gt; &gt; ++/*! Free one server&#39;s memory.=C2=A0 Only for the deferred-r=
eclaim path and the<br>
&gt; &gt; ++ *=C2=A0 immediate path in ares_destroy_server(). */<br>
&gt; &gt; ++void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_server_reap(ares_se=
rver_t *server);<br>
&gt; &gt; ++<br>
&gt; &gt; ++/*! Enter a region that may produce application notifications t=
he library is<br>
&gt; &gt; ++ *=C2=A0 not in a position to deliver yet -- socket-state and s=
erver-state changes.<br>
&gt; &gt; ++ *=C2=A0 Nesting is counted; queued notifications are delivered=
 by the outermost<br>
&gt; &gt; ++ *=C2=A0 leave.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in] channel=C2=A0 Initialized ares channel.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_deferred_cb_enter(a=
res_channel_t *channel);<br>
&gt; &gt; ++<br>
&gt; &gt; ++/*! Leave such a region.=C2=A0 The outermost leave delivers the=
 queues, at which<br>
&gt; &gt; ++ *=C2=A0 point the library holds no connection a reentrant call=
 could free.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in] channel=C2=A0 Initialized ares channel.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_deferred_cb_leave(a=
res_channel_t *channel);<br>
&gt; &gt; ++<br>
&gt; &gt; ++/*! Deliver every server-state notification the channel has que=
ued.=C2=A0 Called<br>
&gt; &gt; ++ *=C2=A0 only from the shared deferred-callback flush.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in] channel=C2=A0 Initialized ares channel.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_server_state_dispat=
ch(ares_channel_t *channel);<br>
&gt; &gt; ++<br>
&gt; &gt; + #define ARES_CONFIG_CHECK(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; +=C2=A0 =C2=A0(x &amp;&amp; x-&gt;lookups &amp;&amp; ares_slist_l=
en(x-&gt;servers) &gt; 0 &amp;&amp; x-&gt;timeout &gt; 0 &amp;&amp; \<br>
&gt; &gt; +=C2=A0 =C2=A0 x-&gt;tries &gt; 0)<br>
&gt; &gt; +@@ -636,7 +741,6 @@ typedef struct ares_event_thread<br>
&gt; ares_event_thread_t;<br>
&gt; &gt; + void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_event_thread_destro=
y(ares_channel_t *channel);<br>
&gt; &gt; + ares_status_t ares_event_thread_init(ares_channel_t *channel);<=
br>
&gt; &gt; +<br>
&gt; &gt; +-<br>
&gt; &gt; + #ifdef _WIN32<br>
&gt; &gt; + #=C2=A0 define HOSTENT_ADDRTYPE_TYPE short<br>
&gt; &gt; + #=C2=A0 define HOSTENT_LENGTH_TYPE=C2=A0 =C2=A0short<br>
&gt; &gt; +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c<br>
&gt; &gt; +index b2316c4b33..82f53610fb 100644<br>
&gt; &gt; +--- a/src/lib/ares_process.c<br>
&gt; &gt; ++++ b/src/lib/ares_process.c<br>
&gt; &gt; +@@ -69,7 +69,6 @@ static ares_status_t ares_send_query_int(ares_=
server_t<br>
&gt; *requested_server,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ares_query_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*query,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const ares_timeval_t *now,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ares_array_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 **requeue);<br>
&gt; &gt; +-static void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_detach_query=
(ares_query_t *query);<br>
&gt; &gt; +<br>
&gt; &gt; + static void=C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_remove_from_c=
onn(ares_query_t *query)<br>
&gt; &gt; + {<br>
&gt; &gt; +@@ -81,14 +80,32 @@ static void<br>
&gt; ares_query_remove_from_conn(ares_query_t *query)<br>
&gt; &gt; +=C2=A0 =C2=A0query-&gt;conn=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D NULL;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++/*! A queued server-state notification.=C2=A0 Holds the formatt=
ed address rather<br>
&gt; &gt; ++ *=C2=A0 than the server, so it stays valid however the server =
list changes. */<br>
&gt; &gt; ++typedef struct {<br>
&gt; &gt; ++=C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0*server_string;<br>
&gt; &gt; ++=C2=A0 ares_bool_t success;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags;<br>
&gt; &gt; ++} ares_server_state_msg_t;<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void ares_server_state_msg_free(void *arg)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ares_server_state_msg_t *msg =3D arg;<br>
&gt; &gt; ++=C2=A0 if (msg =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return; /* LCOV_EXCL_LINE: DefensiveCoding */<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 ares_free(msg-&gt;server_string);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + /* Invoke the server state callback after a success or failure =
*/<br>
&gt; &gt; + static void invoke_server_state_cb(const ares_server_t *server,=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_bool_t =
success, int flags)<br>
&gt; &gt; + {<br>
&gt; &gt; +-=C2=A0 const ares_channel_t *channel =3D server-&gt;channel;<br=
>
&gt; &gt; +-=C2=A0 ares_buf_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*buf;=
<br>
&gt; &gt; +-=C2=A0 ares_status_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status;<b=
r>
&gt; &gt; +-=C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*server_string;<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*channel=
 =3D server-&gt;channel;<br>
&gt; &gt; ++=C2=A0 ares_buf_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*buf;<br>
&gt; &gt; ++=C2=A0 ares_status_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
atus;<br>
&gt; &gt; ++=C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*server_string;<br>
&gt; &gt; ++=C2=A0 ares_server_state_msg_t msg;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0if (channel-&gt;server_state_cb =3D=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; +@@ -111,9 +128,57 @@ static void invoke_server_state_cb(const<br=
>
&gt; ares_server_t *server,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return; /* LCOV_EXCL_LINE: OutOfMemory */<br=
>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 channel-&gt;server_state_cb(server_string, success, flag=
s,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channel-&gt;server_state_cb_data);<br>
&gt; &gt; +-=C2=A0 ares_free(server_string);<br>
&gt; &gt; ++=C2=A0 /* Queue rather than dispatch.=C2=A0 This runs in the mi=
ddle of processing, and<br>
&gt; &gt; ++=C2=A0 =C2=A0* every caller keeps using its query / connection =
/ server afterwards.=C2=A0 The<br>
&gt; &gt; ++=C2=A0 =C2=A0* callback is application code that may reentrantl=
y call ares_cancel(),<br>
&gt; &gt; ++=C2=A0 =C2=A0* which frees those objects -- so dispatch once th=
e library is no longer<br>
&gt; &gt; ++=C2=A0 =C2=A0* holding them.=C2=A0 Same philosophy as the defer=
red query-callback dispatch.<br>
&gt; &gt; ++=C2=A0 =C2=A0*<br>
&gt; &gt; ++=C2=A0 =C2=A0* Only the formatted address is captured, never th=
e ares_server_t, so a<br>
&gt; &gt; ++=C2=A0 =C2=A0* queued entry cannot outlive anything it points a=
t. */<br>
&gt; &gt; ++=C2=A0 if (channel-&gt;server_state_queue =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 channel-&gt;server_state_queue =3D ares_array_cre=
ate(<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 sizeof(ares_server_state_msg_t), ares_serv=
er_state_msg_free);<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (channel-&gt;server_state_queue =3D=3D NULL) {=
<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* LCOV_EXCL_START: OutOfMemory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ares_free(server_string);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* LCOV_EXCL_STOP */<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 msg.server_string =3D server_string;<br>
&gt; &gt; ++=C2=A0 msg.success=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D success;<br>
&gt; &gt; ++=C2=A0 msg.flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D flags;<br=
>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (ares_array_insertdata_last(channel-&gt;server_state_=
queue, &amp;msg) !=3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_free(server_string); /* LCOV_EXCL_LINE: OutO=
fMemory */<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++/*! Deliver every server-state notification the channel has que=
ued.=C2=A0 Loops<br>
&gt; &gt; ++ *=C2=A0 rather than snapshotting: a callback is allowed to re-=
enter the library and<br>
&gt; &gt; ++ *=C2=A0 queue more, and those belong to this same delivery poi=
nt. */<br>
&gt; &gt; ++void ares_server_state_dispatch(ares_channel_t *channel)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 while (ares_array_len(channel-&gt;server_state_queue) &g=
t; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_server_state_msg_t msg;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (ares_array_claim_at(&amp;msg, sizeof(msg), ch=
annel-&gt;server_state_queue,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0) !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 break; /* LCOV_EXCL_LINE: DefensiveCoding =
*/<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (channel-&gt;server_state_cb !=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 channel-&gt;server_state_cb(msg.server_str=
ing, msg.success, msg.flags,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0channel-&gt;server_state_cb=
_data);<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_free(msg.server_string);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_array_destroy(channel-&gt;server_state_queue);<br>
&gt; &gt; ++=C2=A0 channel-&gt;server_state_queue =3D NULL;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; + static void server_increment_failures(ares_server_t *server,<br=
>
&gt; &gt; +@@ -204,6 +269,8 @@ static ares_status_t<br>
&gt; ares_process_fds_nolock(ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*channel,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ARES_EFORMERR; /* LCOV_EXCL_LINE: Def=
ensiveCoding */<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0ares_tvnow(&amp;now);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* Process write events */<br>
&gt; &gt; +@@ -244,6 +311,8 @@ static ares_status_t<br>
&gt; ares_process_fds_nolock(ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*channel,<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; + done:<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0if (status =3D=3D ARES_ENOMEM) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ARES_ENOMEM;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +@@ -553,6 +622,8 @@ typedef enum {<br>
&gt; &gt; + typedef struct {<br>
&gt; &gt; +=C2=A0 =C2=A0requeue_type_t=C2=A0 =C2=A0 =C2=A0type;=C2=A0 =C2=
=A0/* type of entry, requeue or endquery */<br>
&gt; &gt; +=C2=A0 =C2=A0unsigned short=C2=A0 =C2=A0 =C2=A0qid;=C2=A0 =C2=A0=
 /* query id */<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0se=
rial; /* identifies the query the qid meant when<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * this entry was appended */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_server_t=C2=A0 =C2=A0 =C2=A0*server; /* requeu=
e only: optional */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_status_t=C2=A0 =C2=A0 =C2=A0 status; /* endque=
ry only */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_dns_record_t *dnsrec; /* endquery only: option=
al */<br>
&gt; &gt; +@@ -578,6 +649,7 @@ static ares_status_t<br>
&gt; ares_append_requeue_int(ares_array_t=C2=A0 =C2=A0 =C2=A0**requeue,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0entry.type=C2=A0 =C2=A0=3D type;<br>
&gt; &gt; +=C2=A0 =C2=A0entry.qid=C2=A0 =C2=A0 =3D query-&gt;qid;<br>
&gt; &gt; ++=C2=A0 entry.serial =3D query-&gt;serial;<br>
&gt; &gt; +=C2=A0 =C2=A0entry.server =3D server;<br>
&gt; &gt; +=C2=A0 =C2=A0entry.status =3D status;<br>
&gt; &gt; +=C2=A0 =C2=A0entry.dnsrec =3D dnsrec;<br>
&gt; &gt; +@@ -601,6 +673,53 @@ static ares_status_t<br>
&gt; ares_append_endqueue(ares_array_t=C2=A0 =C2=A0 =C2=A0**requeue,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0dnsrec);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++/*! Is the query the caller captured still the one holding \a q=
id?<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 A query id is a 16-bit wire value reissued as soon as =
the query holding it<br>
&gt; &gt; ++ *=C2=A0 is detached, so it names a slot rather than a query, a=
nd comparing the<br>
&gt; &gt; ++ *=C2=A0 pointer as well does not help: the replacement is ofte=
n allocated at the<br>
&gt; &gt; ++ *=C2=A0 address the freed one had.=C2=A0 The serial is a chann=
el-wide counter that is<br>
&gt; &gt; ++ *=C2=A0 never reused. */<br>
&gt; &gt; ++static ares_bool_t ares_query_is_live(const ares_channel_t *cha=
nnel,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsig=
ned short qid, size_t serial)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 const ares_query_t *query =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_htable_szvp_get_direct(channel-&gt;queries_b=
y_qid, qid);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (query =3D=3D NULL || query-&gt;serial !=3D serial) {=
<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_FALSE;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 return ARES_TRUE;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++/*! Is this exact server object still in the channel&#39;s serv=
er list?<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 Compares pointers only and never dereferences \a serve=
r.=C2=A0 Deferred<br>
&gt; &gt; ++ *=C2=A0 reclamation keeps an unlinked server readable for the =
rest of the call<br>
&gt; &gt; ++ *=C2=A0 that captured it, so reading through it is no longer a=
 use-after-free --<br>
&gt; &gt; ++ *=C2=A0 but it has been removed from the configuration and mus=
t not be acted on,<br>
&gt; &gt; ++ *=C2=A0 which is what this reports.=C2=A0 A channel has a hand=
ful of servers, so the<br>
&gt; &gt; ++ *=C2=A0 linear scan does not matter. */<br>
&gt; &gt; ++ares_bool_t ares_server_in_channel(const ares_channel_t *channe=
l,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const ares_se=
rver_t=C2=A0 *server)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ares_slist_node_t *node;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (server =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_FALSE;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 for (node =3D ares_slist_node_first(channel-&gt;servers)=
; node !=3D NULL;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0node =3D ares_slist_node_next(node))=
 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (ares_slist_node_val(node) =3D=3D server) {<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 return ARES_TRUE;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 return ARES_FALSE;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + /* Drain the deferred requeue/endqueue list iteratively.=C2=A0 =
All flush sites<br>
&gt; &gt; +=C2=A0 * (read_answers(), process_timeouts(), and ares_send_quer=
y()) funnel<br>
&gt; through<br>
&gt; &gt; +=C2=A0 * here so that:<br>
&gt; &gt; +@@ -636,11 +755,35 @@ static ares_status_t<br>
&gt; ares_flush_requeue(ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0*channel,<=
br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0query =3D ares_htable_szvp_get_direct(channe=
l-&gt;queries_by_qid, entry.qid);<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* A query id is a 16-bit wire value and generate=
_unique_qid() only avoids<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* ids that are live when it runs.=C2=A0 Wit=
hin a single drain, a callback can<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* cancel a query whose entry is still in th=
is array -- releasing its id --<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* and start a new lookup that is handed the=
 same id.=C2=A0 The lookup above<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* would then resolve this entry to a comple=
tely different query: an<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* endquery entry would deliver one lookup&#=
39;s answer to another and free it,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* a requeue entry would put an in-flight qu=
ery on the wire twice.=C2=A0 The<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* serial is a channel-wide counter that is =
never reused, so it tells the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* two apart. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (query !=3D NULL &amp;&amp; query-&gt;serial !=
=3D entry.serial) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 query =3D NULL;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (entry.type =3D=3D REQUEUE_REQUEUE) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Query disappeared (e.g. a prior ca=
llback in this drain cancelled it) */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (query =3D=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* entry.server is a raw pointer captured =
before any callback in this<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* drain ran.=C2=A0 A callback may le=
gally re-enter the public API -- the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* channel lock is recursive -- and a=
res_set_servers*() destroys servers<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* that are absent from the new confi=
guration, so it may already be<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* freed.=C2=A0 The query above is re=
validated by qid for exactly this<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* reason; do the same for the server=
, falling back to ordinary<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* selection when it has gone. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (!ares_server_in_channel(channel, entry=
.server)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 entry.server =3D NULL;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Re-dispatch via the internal entry=
point so any further requeues are<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * appended back onto this same list =
and drained by the loop above,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * rather than recursing. */<br>
&gt; &gt; +@@ -1377,6 +1520,7 @@ ares_status_t ares_send_query(ares_server_=
t<br>
&gt; *requested_server,<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_t *channel =3D query-&gt;channel;<br>
&gt; &gt; +=C2=A0 =C2=A0ares_array_t=C2=A0 =C2=A0*requeue =3D NULL;<br>
&gt; &gt; +=C2=A0 =C2=A0unsigned short=C2=A0 qid=C2=A0 =C2=A0 =C2=A0=3D que=
ry-&gt;qid;<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial=C2=A0 =
=3D query-&gt;serial;<br>
&gt; &gt; +=C2=A0 =C2=A0ares_status_t=C2=A0 =C2=A0status;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0status =3D ares_send_query_int(requested_server, qu=
ery, now, &amp;requeue);<br>
&gt; &gt; +@@ -1393,8 +1537,7 @@ ares_status_t ares_send_query(ares_server_=
t<br>
&gt; *requested_server,<br>
&gt; &gt; +=C2=A0 =C2=A0 * been freed.=C2=A0 Do not dereference &#39;query&=
#39; here.=C2=A0 If it is no longer tracked<br>
&gt; &gt; +=C2=A0 =C2=A0 * it ended, so don&#39;t report success to the cal=
ler (which would, e.g., cause<br>
&gt; &gt; +=C2=A0 =C2=A0 * ares_send_nolock() to write to a now-freed *qid)=
. */<br>
&gt; &gt; +-=C2=A0 if (status =3D=3D ARES_SUCCESS &amp;&amp;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ares_htable_szvp_get_direct(channel-&gt;qu=
eries_by_qid, qid) =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 if (status =3D=3D ARES_SUCCESS &amp;&amp; !ares_query_is=
_live(channel, qid, serial))<br>
&gt; {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0status =3D ARES_ETIMEOUT;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -1412,6 +1555,9 @@ static ares_status_t<br>
&gt; ares_send_query_int(ares_server_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 *requeste=
d_server,<br>
&gt; &gt; +=C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timeplus;<=
br>
&gt; &gt; +=C2=A0 =C2=A0ares_status_t=C2=A0 =C2=A0status;<br>
&gt; &gt; +=C2=A0 =C2=A0ares_bool_t=C2=A0 =C2=A0 =C2=A0probe_downed_server =
=3D ARES_TRUE;<br>
&gt; &gt; ++=C2=A0 /* Captured before any application callback below, which=
 may free the query<br>
&gt; */<br>
&gt; &gt; ++=C2=A0 unsigned short=C2=A0 qid=C2=A0 =C2=A0 =3D query-&gt;qid;=
<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial =3D quer=
y-&gt;serial;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* Choose the server to send the query to */<br>
&gt; &gt; +=C2=A0 =C2=A0if (requested_server !=3D NULL) {<br>
&gt; &gt; +@@ -1443,6 +1589,32 @@ static ares_status_t<br>
&gt; ares_send_query_int(ares_server_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 *requeste=
d_server,<br>
&gt; &gt; +=C2=A0 =C2=A0conn =3D ares_fetch_connection(channel, server, que=
ry);<br>
&gt; &gt; +=C2=A0 =C2=A0if (conn =3D=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0status =3D ares_open_connection(&amp;conn, c=
hannel, server, query-&gt;using_tcp);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Opening a connection runs application code -- =
the socket-open function<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* from ares_set_socket_functions_ex(), and =
the<br>
&gt; ares_set_socket_callback()<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* and ares_set_socket_configure_callback() =
callbacks -- any of which may<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* reentrantly call ares_cancel() and free t=
his query.=C2=A0 Re-check liveness<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* by the qid captured at entry rather than =
dereferencing a possibly-freed<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* query. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (!ares_query_is_live(channel, qid, serial)) {<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 return ARES_ECANCELLED;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Those same callbacks may have reconfigured the=
 servers, which frees<br>
&gt; the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* ones the new configuration omits.=C2=A0 &=
#39;server&#39; was captured before the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* open; everything below reads it, includin=
g server_increment_failures()<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* on the failure paths of the switch.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0*<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* Requeue rather than return: every exit fr=
om this function must either<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* enqueue the query or end it, and the quer=
y is still live here -- it has<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* not been written, is not attached to a co=
nnection, and on a first send<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* has no timeout node, so returning would s=
trand it forever.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* query-&gt;conn is NULL, so this does not =
read through the freed server. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (!ares_server_in_channel(channel, server)) {<b=
r>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 return ares_requeue_query(query, now, ARES=
_ECONNREFUSED,<br>
&gt; ARES_TRUE, NULL,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 requeue);<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0switch (status) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Good result, continue on */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case ARES_SUCCESS:<br>
&gt; &gt; +@@ -1464,6 +1636,14 @@ static ares_status_t<br>
&gt; ares_send_query_int(ares_server_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 *requeste=
d_server,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* Write the query */<br>
&gt; &gt; +=C2=A0 =C2=A0status =3D ares_conn_query_write(conn, query, now);=
<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Writing runs application code too: ares_conn_query_wr=
ite() reaches the<br>
&gt; &gt; ++=C2=A0 =C2=A0* send function installed by ares_set_socket_funct=
ions_ex(), which may<br>
&gt; &gt; ++=C2=A0 =C2=A0* reentrantly call ares_cancel() with the same haz=
ard as above. */<br>
&gt; &gt; ++=C2=A0 if (!ares_query_is_live(channel, qid, serial)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_ECANCELLED;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0switch (status) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Good result, continue on */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case ARES_SUCCESS:<br>
&gt; &gt; +@@ -1479,6 +1659,17 @@ static ares_status_t<br>
&gt; ares_send_query_int(ares_server_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 *requeste=
d_server,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case ARES_ECONNREFUSED:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case ARES_EBADFAMILY:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0handle_conn_error(conn, ARES_TRUE, st=
atus);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* handle_conn_error() -&gt; ares_close_co=
nnection() -&gt;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* ares_requeue_queries() walks conn-=
&gt;queries_to_conn and may<br>
&gt; terminally<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* end other queries on this connecti=
on.=C2=A0 If one of their callbacks<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* reentrantly calls ares_cancel(), t=
his query is freed too -- it is still<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* linked in all_queries, since it on=
ly joins conn-&gt;queries_to_conn on the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* success path below.=C2=A0 Re-check=
 liveness by the qid captured at entry<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* rather than dereferencing a possib=
ly-freed query.=C2=A0 Mirrors the guard in<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* ares_send_query(). */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (!ares_query_is_live(channel, qid, seri=
al)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ARES_ECONNREFUSED;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D ares_requeue_query(query, =
now, status, ARES_TRUE, NULL,<br>
&gt; requeue);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (status =3D=3D ARES_ETIMEOUT) {<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D ARES_ECONNREFUSED;<=
br>
&gt; &gt; +@@ -1597,11 +1788,18 @@ static ares_bool_t same_questions(const<=
br>
&gt; ares_query_t=C2=A0 =C2=A0 =C2=A0 *query,<br>
&gt; &gt; +=C2=A0 =C2=A0return rv;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +-static void ares_detach_query(ares_query_t *query)<br>
&gt; &gt; ++void ares_detach_query(ares_query_t *query)<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0/* Remove the query from all the lists in which it =
is linked */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_query_remove_from_conn(query);<br>
&gt; &gt; +-=C2=A0 ares_htable_szvp_remove(query-&gt;channel-&gt;queries_by=
_qid, query-&gt;qid);<br>
&gt; &gt; ++=C2=A0 /* Only release the qid slot if it is still ours.=C2=A0 =
A query detached before<br>
&gt; &gt; ++=C2=A0 =C2=A0* its callback can have its qid reissued to a look=
up started from within<br>
&gt; &gt; ++=C2=A0 =C2=A0* that callback, and the ares_free_query() that fo=
llows detaches a second<br>
&gt; &gt; ++=C2=A0 =C2=A0* time -- which would otherwise evict the new look=
up instead. */<br>
&gt; &gt; ++=C2=A0 if (ares_htable_szvp_get_direct(query-&gt;channel-&gt;qu=
eries_by_qid, query-<br>
&gt; &gt;qid) =3D=3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 query) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_htable_szvp_remove(query-&gt;channel-&gt;que=
ries_by_qid, query-&gt;qid);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0ares_llist_node_destroy(query-&gt;node_all_queries)=
;<br>
&gt; &gt; +=C2=A0 =C2=A0query-&gt;node_all_queries =3D NULL;<br>
&gt; &gt; + }<br>
&gt; &gt; +@@ -1624,6 +1822,16 @@ static void end_query(ares_channel_t *cha=
nnel,<br>
&gt; ares_server_t *server,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* Detach from all lookup lists before the callback, oth=
erwise a reentrant<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_cancel() from within it would find this que=
ry still linked, free it,<br>
&gt; &gt; ++=C2=A0 =C2=A0* and the ares_free_query() below would double-fre=
e.=C2=A0 Mirrors<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_flush_requeue() for every synchronous path =
that reaches here with a<br>
&gt; &gt; ++=C2=A0 =C2=A0* NULL requeue: connection teardown via handle_con=
n_error(), and server<br>
&gt; &gt; ++=C2=A0 =C2=A0* removal via ares_servers_update() and ares_destr=
oy_servers_state(),<br>
&gt; both<br>
&gt; &gt; ++=C2=A0 =C2=A0* of which reach ares_close_sockets().<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_detach_query() may safely run twice on the =
same query. */<br>
&gt; &gt; ++=C2=A0 ares_detach_query(query);<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0/* Invoke the callback. */<br>
&gt; &gt; +=C2=A0 =C2=A0query-&gt;callback(query-&gt;arg, status, query-&gt=
;timeouts, dnsrec);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_free_query(query);<br>
&gt; &gt; +@@ -1631,7 +1839,8 @@ static void end_query(ares_channel_t *chan=
nel,<br>
&gt; ares_server_t *server,<br>
&gt; &gt; +=C2=A0 =C2=A0/* Check and notify if no other queries are enqueue=
d on the channel.=C2=A0 This<br>
&gt; &gt; +=C2=A0 =C2=A0 * must come after the callback and freeing the que=
ry for 2 reasons.<br>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 1) The callback itself may enqueue a new q=
uery<br>
&gt; &gt; +-=C2=A0 =C2=A0*=C2=A0 2) Technically the current query isn&#39;t=
 detached until it is free()&#39;d.<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 2) The current query is detached above, be=
fore the callback, so by this<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0point it is no longer tracked=
.<br>
&gt; &gt; +=C2=A0 =C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_queue_notify_empty(channel);<br>
&gt; &gt; + }<br>
&gt; &gt; +diff --git a/src/lib/ares_send.c b/src/lib/ares_send.c<br>
&gt; &gt; +index 6efa9580b2..2e0482bf19 100644<br>
&gt; &gt; +--- a/src/lib/ares_send.c<br>
&gt; &gt; ++++ b/src/lib/ares_send.c<br>
&gt; &gt; +@@ -117,6 +117,27 @@ ares_status_t ares_send_nolock(ares_channel=
_t<br>
&gt; *channel, ares_server_t *server,<br>
&gt; &gt; +=C2=A0 =C2=A0unsigned short=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0id=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D generate_unique_qid(channel)=
;<br>
&gt; &gt; +=C2=A0 =C2=A0const ares_dns_record_t *dnsrec_resp =3D NULL;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* A channel being destroyed accepts no new queries.=C2=
=A0 ares_destroy(3)<br>
&gt; &gt; ++=C2=A0 =C2=A0* documents that a callback must not add new reque=
sts to a channel being<br>
&gt; &gt; ++=C2=A0 =C2=A0* destroyed.=C2=A0 Refuse it, but still notify: AR=
ES_EDESTRUCTION is<br>
&gt; documented<br>
&gt; &gt; ++=C2=A0 =C2=A0* in ares_query(3), ares_send(3), ares_search(3) a=
nd ares_getaddrinfo(3)<br>
&gt; as<br>
&gt; &gt; ++=C2=A0 =C2=A0* a status delivered to the callback, and every ca=
ller frees its own<br>
&gt; &gt; ++=C2=A0 =C2=A0* context from there.<br>
&gt; &gt; ++=C2=A0 =C2=A0*<br>
&gt; &gt; ++=C2=A0 =C2=A0* Not notified if we are already inside such a not=
ification: an application<br>
&gt; &gt; ++=C2=A0 =C2=A0* whose callback starts a replacement lookup on ev=
ery invocation would<br>
&gt; &gt; ++=C2=A0 =C2=A0* otherwise re-enter here from within the callback=
 without bound and<br>
&gt; &gt; ++=C2=A0 =C2=A0* exhaust the stack.=C2=A0 At that depth it is alr=
eady past the contract<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_destroy(3) documents. */<br>
&gt; &gt; ++=C2=A0 if (!channel-&gt;sys_up) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (!channel-&gt;in_shutdown_refusal) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 channel-&gt;in_shutdown_refusal =3D ARES_T=
RUE;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 callback(arg, ARES_EDESTRUCTION, 0, NULL);=
<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 channel-&gt;in_shutdown_refusal =3D ARES_F=
ALSE;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_EDESTRUCTION;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0ares_tvnow(&amp;now);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0if (ares_slist_len(channel-&gt;servers) =3D=3D 0) {=
<br>
&gt; &gt; +@@ -145,6 +166,7 @@ ares_status_t ares_send_nolock(ares_channel_=
t<br>
&gt; *channel, ares_server_t *server,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0query-&gt;channel=C2=A0 =C2=A0 =C2=A0 =3D channel;<=
br>
&gt; &gt; +=C2=A0 =C2=A0query-&gt;qid=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 id;<br>
&gt; &gt; ++=C2=A0 query-&gt;serial=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ++channel=
-&gt;query_serial;<br>
&gt; &gt; +=C2=A0 =C2=A0query-&gt;timeout.sec=C2=A0 =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0query-&gt;timeout.usec =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0query-&gt;using_tcp =3D<br>
&gt; &gt; +@@ -209,6 +231,12 @@ ares_status_t ares_send_nolock(ares_channel=
_t<br>
&gt; *channel, ares_server_t *server,<br>
&gt; &gt; +=C2=A0 =C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0if (!ares_htable_szvp_insert(channel-&gt;queries_by=
_qid, query-&gt;qid, query)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* LCOV_EXCL_START: OutOfMemory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* The query is already chained into all_queries,=
 so a reentrant<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* ares_cancel() from the callback below wou=
ld find it, run the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* application callback a second time for on=
e lookup, and free it -- and<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* the ares_free_query() here would then dou=
ble-free.=C2=A0 Same ordering as<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* ares_cancel() and ares_destroy(): unlink =
first, notify second. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_detach_query(query);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0callback(arg, ARES_ENOMEM, 0, NULL);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ares_free_query(query);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ARES_ENOMEM;<br>
&gt; &gt; +@@ -217,10 +245,17 @@ ares_status_t ares_send_nolock(ares_channe=
l_t<br>
&gt; *channel, ares_server_t *server,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* Perform the first query action. */<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* Sending opens and writes to connections and can mark =
a server down,<br>
&gt; both<br>
&gt; &gt; ++=C2=A0 =C2=A0* of which notify.=C2=A0 Deliver those once we are=
 done with the connection and<br>
&gt; &gt; ++=C2=A0 =C2=A0* the server, not part-way through. */<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0status =3D ares_send_query(server, query, &amp;now)=
;<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0if (status =3D=3D ARES_SUCCESS &amp;&amp; qid) {<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0*qid =3D id;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0return status;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/lib/ares_update_servers.c b/src/lib/ares_update=
_servers.c<br>
&gt; &gt; +index f8d441accf..50a9c27925 100644<br>
&gt; &gt; +--- a/src/lib/ares_update_servers.c<br>
&gt; &gt; ++++ b/src/lib/ares_update_servers.c<br>
&gt; &gt; +@@ -740,17 +740,36 @@ static ares_bool_t<br>
&gt; ares_servers_remove_stale(ares_channel_t *channel,<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_bool_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 stale_remove=
d =3D ARES_FALSE;<br>
&gt; &gt; +=C2=A0 =C2=A0ares_slist_node_t *snode=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D ares_slist_node_first(channel-&gt;servers);<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ge=
neration=C2=A0 =C2=A0 =3D channel-&gt;servers_generation;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* Re-read from the head each pass rather than caching t=
he next node.<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_slist_node_destroy() below reaches applicat=
ion callbacks, by way of<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_destroy_server() -&gt; ares_close_sockets()=
 -&gt;<br>
&gt; ares_requeue_queries(),<br>
&gt; &gt; ++=C2=A0 =C2=A0* and a nested reconfiguration from one of those d=
estroys the remaining<br>
&gt; &gt; ++=C2=A0 =C2=A0* stale servers -- including whichever one a cache=
d pointer referred to. */<br>
&gt; &gt; +=C2=A0 =C2=A0while (snode !=3D NULL) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 ares_slist_node_t=C2=A0 =C2=A0*snext=C2=A0 =3D ar=
es_slist_node_next(snode);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0const ares_server_t *server =3D ares_slist_n=
ode_val(snode);<br>
&gt; &gt; +-=C2=A0 =C2=A0 if (!ares_server_in_newconfig(server, srvlist)) {=
<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 /* This will clean up all server state via=
 the destruction callback and<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0* move any queries to new servers */=
<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 ares_slist_node_destroy(snode);<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 stale_removed =3D ARES_TRUE;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (ares_server_in_newconfig(server, srvlist)) {<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 snode =3D ares_slist_node_next(snode);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +-=C2=A0 =C2=A0 snode =3D snext;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* This will clean up all server state via the de=
struction callback and<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* move any queries to new servers */<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_slist_node_destroy(snode);<br>
&gt; &gt; ++=C2=A0 =C2=A0 stale_removed =3D ARES_TRUE;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* A callback reached from the destroy above may =
have reconfigured the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* server list against a newer configuration=
.=C2=A0 That call has already<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* reconciled the whole list, so whatever re=
mains belongs to it and not to<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* srvlist -- stop rather than deleting its =
servers. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (channel-&gt;servers_generation !=3D generatio=
n) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* The callbacks above may have removed further s=
ervers, so restart. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 snode =3D ares_slist_node_first(channel-&gt;serve=
rs);<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0return stale_removed;<br>
&gt; &gt; + }<br>
&gt; &gt; +@@ -775,6 +794,14 @@ ares_status_t ares_servers_update(ares_chan=
nel_t<br>
&gt; *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ARES_EFORMERR; /* LCOV_EXCL_LINE: Def=
ensiveCoding */<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* Removing servers closes their connections, which noti=
fies.=C2=A0 Deliver<br>
&gt; &gt; ++=C2=A0 =C2=A0* once this call is done rather than from inside t=
he teardown. */<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Bumped before anything below can reach an application=
 callback, so a<br>
&gt; &gt; ++=C2=A0 =C2=A0* nested reconfiguration is distinguishable from o=
ur own work. */<br>
&gt; &gt; ++=C2=A0 channel-&gt;servers_generation++;<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0/* NOTE: a NULL or zero entry server list is consid=
ered valid due to<br>
&gt; &gt; +=C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0real-world people need=
ing support for this for their test harnesses<br>
&gt; &gt; +=C2=A0 =C2=A0 */<br>
&gt; &gt; +@@ -843,6 +870,7 @@ ares_status_t ares_servers_update(ares_chann=
el_t<br>
&gt; *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0status =3D ARES_SUCCESS;<br>
&gt; &gt; +<br>
&gt; &gt; + done:<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0return status;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc<br>
&gt; &gt; +index c0c0279abb..2158c5a913 100644<br>
&gt; &gt; +--- a/test/ares-test-mock.cc<br>
&gt; &gt; ++++ b/test/ares-test-mock.cc<br>
&gt; &gt; +@@ -31,6 +31,11 @@<br>
&gt; &gt; + #include &lt;sys/stat.h&gt;<br>
&gt; &gt; + #endif<br>
&gt; &gt; +<br>
&gt; &gt; ++#ifndef _WIN32<br>
&gt; &gt; ++#=C2=A0 include &lt;errno.h&gt;<br>
&gt; &gt; ++#=C2=A0 include &lt;fcntl.h&gt;<br>
&gt; &gt; ++#endif<br>
&gt; &gt; ++<br>
&gt; &gt; + #include &lt;sstream&gt;<br>
&gt; &gt; + #include &lt;vector&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -1914,6 +1919,7 @@ TEST_P(MockRetryDepthChannelTest,<br>
&gt; HighRetryNoStackOverflow) {<br>
&gt; &gt; + struct CancelInCbData {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_t *channel;<br>
&gt; &gt; +=C2=A0 =C2=A0bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done;=
<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cbs;<br>
&gt; &gt; + };<br>
&gt; &gt; +<br>
&gt; &gt; + static void CancelChannelCallback(void *arg, ares_status_t stat=
us,<br>
&gt; &gt; +@@ -1925,10 +1931,1071 @@ static void CancelChannelCallback(void=
 *arg,<br>
&gt; ares_status_t status,<br>
&gt; &gt; +=C2=A0 =C2=A0(void)timeouts;<br>
&gt; &gt; +=C2=A0 =C2=A0(void)dnsrec;<br>
&gt; &gt; +=C2=A0 =C2=A0data-&gt;done =3D true;<br>
&gt; &gt; ++=C2=A0 data-&gt;cbs++;<br>
&gt; &gt; +=C2=A0 =C2=A0/* Reentrant cancel from within the callback.=C2=A0=
 Must not double-free. */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_cancel(data-&gt;channel);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++// ares_destroy() notifies each still-running query that the ch=
annel is going<br>
&gt; &gt; ++// away, and holds a pointer to the next one in its list while =
doing so.=C2=A0 A<br>
&gt; &gt; ++// reentrant ares_cancel() from one of those callbacks frees ev=
ery remaining<br>
&gt; &gt; ++// query -- including that cached next, which ares_destroy() th=
en follows.<br>
&gt; &gt; ++//<br>
&gt; &gt; ++// ares_cancel() is immune to the same pattern because it swaps=
 the list head<br>
&gt; &gt; ++// before walking it; ares_destroy() did not.=C2=A0 Two queries=
 are required: with<br>
&gt; &gt; ++// only one in flight there is no next to cache and nothing goe=
s wrong.<br>
&gt; &gt; ++// tries=3D1 so a teardown ends the query outright instead of r=
etrying it, which<br>
&gt; &gt; ++// is the precondition this family of bugs shares.<br>
&gt; &gt; ++class MockUDPSingleTryTest : public MockChannelOptsTest,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0public ::testing::WithParamInterfa=
ce&lt;int&gt; {<br>
&gt; &gt; ++public:<br>
&gt; &gt; ++=C2=A0 MockUDPSingleTryTest()<br>
&gt; &gt; ++=C2=A0 =C2=A0 : MockChannelOptsTest(1, GetParam(), false, false=
, FillOptions(&amp;opts_),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_OPT_TRIES)<br>
&gt; &gt; ++=C2=A0 {<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 static struct ares_options *FillOptions(struct ares_opti=
ons *opts)<br>
&gt; &gt; ++=C2=A0 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 memset(opts, 0, sizeof(struct ares_options));<br>
&gt; &gt; ++=C2=A0 =C2=A0 opts-&gt;tries =3D 1;<br>
&gt; &gt; ++=C2=A0 =C2=A0 return opts;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++private:<br>
&gt; &gt; ++=C2=A0 struct ares_options opts_;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++// ares_cancel() and ares_destroy() free a query themselves rat=
her than<br>
&gt; going<br>
&gt; &gt; ++// through end_query().=C2=A0 Both used to invoke the applicati=
on callback while<br>
&gt; the<br>
&gt; &gt; ++// query was still in queries_by_qid, on conn-&gt;queries_to_co=
nn and in<br>
&gt; &gt; ++// queries_by_timeout -- only all_queries was unlinked first.=
=C2=A0 A reentrant<br>
&gt; &gt; ++// teardown from within that callback therefore still found the=
 query, ended it<br>
&gt; &gt; ++// a second time, and freed it; the ares_free_query() that foll=
owed then<br>
&gt; &gt; ++// double-freed.=C2=A0 One query in flight is enough.<br>
&gt; &gt; ++static void ReconfigureServersCallback(void *arg, ares_status_t=
 status,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0const ares_dns_record_t *dnsrec) {<br>
&gt; &gt; ++=C2=A0 CancelInCbData *data =3D static_cast&lt;CancelInCbData *=
&gt;(arg);<br>
&gt; &gt; ++=C2=A0 (void)status;<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 data-&gt;done =3D true;<br>
&gt; &gt; ++=C2=A0 data-&gt;cbs++;<br>
&gt; &gt; ++=C2=A0 /* Frees every server absent from the new configuration,=
 closing their<br>
&gt; &gt; ++=C2=A0 =C2=A0* connections -- which still hold the queries bein=
g torn down. */<br>
&gt; &gt; ++=C2=A0 ares_set_servers_csv(data-&gt;channel, &quot;<a href=3D"=
http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:5305=
5</a>&quot;);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Reconfiguring the server list from a cancellation callback.<=
br>
&gt; &gt; ++TEST_P(MockUDPSingleTryTest,<br>
&gt; ReconfigureInCancelCallbackNoDoubleFree) {<br>
&gt; &gt; ++=C2=A0 CancelInCbData data;<br>
&gt; &gt; ++=C2=A0 data.channel =3D channel_;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.cbs=C2=A0 =C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 QueryResult result;<br>
&gt; &gt; ++=C2=A0 /* Left unanswered, so both stay attached to the connect=
ion. */<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel_, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" target=3D=
"_blank">www.google.com</a>&quot;, ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, ReconfigureServe=
rsCallback,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;data, NULL));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel_, &quot;<a href=3D"http://www.example.com" rel=3D"noreferrer" target=
=3D"_blank">www.example.com</a>&quot;,<br>
&gt; ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, QueryCallback, &=
amp;result, NULL));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_cancel(channel_);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(result.done_);<br>
&gt; &gt; ++=C2=A0 /* Each lookup must be notified exactly once, not twice.=
 */<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, data.cbs);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++/* The replacement lookup&#39;s result outlives the callback th=
at starts it. */<br>
&gt; &gt; ++static QueryResult g_replacement_result;<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void NewQueryOnFailingWriteCallback(void *arg, ares_stat=
us_t status,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const ares_dns_record_t *dnsrec) {<br>
&gt; &gt; ++=C2=A0 /* ares_set_socket_functions() stores the pointer rather=
 than copying it, so<br>
&gt; &gt; ++=C2=A0 =C2=A0* this must outlive the call. */<br>
&gt; &gt; ++=C2=A0 static ares_socket_functions sock_funcs;<br>
&gt; &gt; ++=C2=A0 CancelInCbData=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 *data =3D static_cast&lt;CancelInCbData *&gt;(arg);<br>
&gt; &gt; ++=C2=A0 (void)status;<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data-&gt;cbs++;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Only the first cancellation callback starts a replace=
ment lookup. */<br>
&gt; &gt; ++=C2=A0 if (data-&gt;done) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 data-&gt;done =3D true;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;sock_funcs, 0, sizeof(sock_funcs));<br>
&gt; &gt; ++=C2=A0 sock_funcs.asendv =3D LibraryTest::ares_sendv_fail;<br>
&gt; &gt; ++=C2=A0 ares_set_socket_functions(data-&gt;channel, &amp;sock_fu=
ncs, NULL);<br>
&gt; &gt; ++=C2=A0 LibraryTest::SetFailSend();<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(data-&gt;channel, &quot;<a href=3D"htt=
p://www.probe.com" rel=3D"noreferrer" target=3D"_blank">www.probe.com</a>&q=
uot;, ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ARES_REC_TYPE_A, QueryCallback, &amp;g_replacement_result,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 NULL);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// No reconfiguration at all: the cancellation callback simply =
starts a<br>
&gt; &gt; ++// replacement lookup -- an ordinary retry pattern -- and that =
lookup&#39;s write<br>
&gt; &gt; ++// fails.=C2=A0 ares_close_connection() then walks conn-&gt;que=
ries_to_conn, which<br>
&gt; &gt; ++// still holds the queries ares_cancel() is in the middle of.=
=C2=A0 Wider than the<br>
&gt; &gt; ++// case above: it needs nothing more than a connection error.<b=
r>
&gt; &gt; ++TEST_P(MockUDPSingleTryTest,<br>
&gt; NewQueryInCancelCallbackConnErrorNoDoubleFree) {<br>
&gt; &gt; ++=C2=A0 CancelInCbData data;<br>
&gt; &gt; ++=C2=A0 data.channel =3D channel_;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.cbs=C2=A0 =C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 g_replacement_result.done_ =3D false;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 QueryResult result;<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel_, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" target=3D=
"_blank">www.google.com</a>&quot;, ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, NewQueryOnFailin=
gWriteCallback,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;data, NULL));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel_, &quot;<a href=3D"http://www.example.com" rel=3D"noreferrer" target=
=3D"_blank">www.example.com</a>&quot;,<br>
&gt; ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, QueryCallback, &=
amp;result, NULL));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_cancel(channel_);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(result.done_);<br>
&gt; &gt; ++=C2=A0 /* Each lookup must be notified exactly once, not twice.=
 */<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, data.cbs);<br>
&gt; &gt; ++=C2=A0 /* Pins that the replacement lookup ran and its write fa=
iled, which is what<br>
&gt; &gt; ++=C2=A0 =C2=A0* drives the connection teardown this test is abou=
t. */<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(g_replacement_result.done_);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The same shape through ares_destroy() rather than ares_cance=
l().<br>
&gt; Swapping<br>
&gt; &gt; ++// the all_queries head does not help here: the reentrant teard=
own reaches<br>
&gt; the<br>
&gt; &gt; ++// query through the connection, not through all_queries.<br>
&gt; &gt; ++TEST_P(MockUDPSingleTryTest,<br>
&gt; ReconfigureInDestroyCallbackNoDoubleFree) {<br>
&gt; &gt; ++=C2=A0 CancelInCbData data;<br>
&gt; &gt; ++=C2=A0 data.channel =3D channel_;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.cbs=C2=A0 =C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 QueryResult result;<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel_, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" target=3D=
"_blank">www.google.com</a>&quot;, ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, ReconfigureServe=
rsCallback,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;data, NULL));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel_, &quot;<a href=3D"http://www.example.com" rel=3D"noreferrer" target=
=3D"_blank">www.example.com</a>&quot;,<br>
&gt; ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, QueryCallback, &=
amp;result, NULL));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_destroy(channel_);<br>
&gt; &gt; ++=C2=A0 channel_ =3D nullptr; /* destroyed here, don&#39;t let t=
he fixture repeat it */<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(result.done_);<br>
&gt; &gt; ++=C2=A0 /* Each lookup must be notified exactly once, not twice.=
 */<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, data.cbs);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Once ares_destroy() has begun, a lookup started from a destr=
uction<br>
&gt; callback<br>
&gt; &gt; ++// is refused rather than allocated into a channel being torn d=
own -- and the<br>
&gt; &gt; ++// refusal still runs the caller&#39;s callback with ARES_EDEST=
RUCTION, so<br>
&gt; context<br>
&gt; &gt; ++// attached to `arg` can be reclaimed.=C2=A0 ares_cancel() leav=
es sys_up true, so a<br>
&gt; &gt; ++// destruction callback is the only way to reach this.<br>
&gt; &gt; ++struct DestroyReentryData {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outer_cbs;<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacement_cbs=
;<br>
&gt; &gt; ++=C2=A0 ares_status_t=C2=A0 =C2=A0replacement_status;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void DestroyReplacementCallback(void *arg, ares_status_t=
 status,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0const ares_dns_record_t *dnsrec) {<br>
&gt; &gt; ++=C2=A0 DestroyReentryData *data =3D static_cast&lt;DestroyReent=
ryData *&gt;(arg);<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 data-&gt;replacement_cbs++;<br>
&gt; &gt; ++=C2=A0 data-&gt;replacement_status =3D status;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void DestroyReentryCallback(void *arg, ares_status_t sta=
tus,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const ares_dn=
s_record_t *dnsrec) {<br>
&gt; &gt; ++=C2=A0 DestroyReentryData *data =3D static_cast&lt;DestroyReent=
ryData *&gt;(arg);<br>
&gt; &gt; ++=C2=A0 (void)status;<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 data-&gt;outer_cbs++;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(data-&gt;channel, &quot;<a href=3D"htt=
p://www.example.com" rel=3D"noreferrer" target=3D"_blank">www.example.com</=
a>&quot;,<br>
&gt; ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ARES_REC_TYPE_A, DestroyReplacementCallback, data,<br>
&gt; NULL);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, NewQueryInDestroyCallbackIsRefusedAndNotifi=
ed) {<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0*channel =3D nullptr;<=
br>
&gt; &gt; ++=C2=A0 struct ares_options opts;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0optmask =3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 opts.tries=C2=A0 =3D 1;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 |=3D ARES_OPT_TRIES;<br>
&gt; &gt; ++=C2=A0 opts.flags=C2=A0 =3D ARES_FLAG_NOSEARCH;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 |=3D ARES_OPT_FLAGS;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_init_options(&amp;channel, =
&amp;opts,<br>
&gt; optmask));<br>
&gt; &gt; ++=C2=A0 // Nothing listens here; no traffic is needed.<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel,<br=
>
&gt; &quot;<a href=3D"http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53055</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 DestroyReentryData data;<br>
&gt; &gt; ++=C2=A0 data.channel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D channel;<br>
&gt; &gt; ++=C2=A0 data.outer_cbs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0;<=
br>
&gt; &gt; ++=C2=A0 data.replacement_cbs=C2=A0 =C2=A0 =3D 0;<br>
&gt; &gt; ++=C2=A0 data.replacement_status =3D ARES_SUCCESS;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" target=3D"=
_blank">www.google.com</a>&quot;, ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, DestroyReentryCa=
llback, &amp;data,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_destroy(channel);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, data.outer_cbs);<br>
&gt; &gt; ++=C2=A0 // Refused -- but notified, so the caller can release wh=
atever it attached.<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, data.replacement_cbs);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_EDESTRUCTION, data.replacement_status);<b=
r>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++INSTANTIATE_TEST_SUITE_P(AddressFamilies, MockUDPSingleTryTest,=
<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0::testing::ValuesIn(ares::test::families),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0PrintFamily);<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_P(MockUDPChannelTest, CancelInDestroyCallbackNoUseAfterFre=
e) {<br>
&gt; &gt; ++=C2=A0 CancelInCbData data;<br>
&gt; &gt; ++=C2=A0 data.channel =3D channel_;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.cbs=C2=A0 =C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Left unanswered, so both are still pending when the c=
hannel goes down.<br>
&gt; */<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel_, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" target=3D=
"_blank">www.google.com</a>&quot;, ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, CancelChannelCal=
lback, &amp;data,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel_, &quot;<a href=3D"http://www.example.com" rel=3D"noreferrer" target=
=3D"_blank">www.example.com</a>&quot;,<br>
&gt; ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, CancelChannelCal=
lback, &amp;data,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL));<br>
&gt; &gt; ++=C2=A0 /* Without this the test can pass vacuously if a query f=
ailed to start. */<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(2, ares_queue_active_queries(channel_));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_destroy(channel_);<br>
&gt; &gt; ++=C2=A0 channel_ =3D nullptr; /* destroyed here, don&#39;t let t=
he fixture repeat it */<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 /* Every query must be notified exactly once. */<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)2, data.cbs);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Fixture with tries=3D1 so the first failure ends the query o=
utright instead of<br>
&gt; &gt; ++// retrying it -- that is what drives execution into end_query(=
)&#39;s synchronous<br>
&gt; &gt; ++// (requeue=3D=3DNULL) branch.<br>
&gt; &gt; ++// The tests below use the MockUDPSingleTryTest fixture defined=
 above:<br>
&gt; tries=3D1,<br>
&gt; &gt; ++// so the first failure ends the query outright instead of retr=
ying it, which<br>
&gt; &gt; ++// is what drives execution into end_query()&#39;s synchronous =
(requeue=3D=3DNULL)<br>
&gt; &gt; ++// branch.<br>
&gt; &gt; ++//<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Connection-teardown route into the synchronous branch.=C2=A0=
 A malformed<br>
&gt; reply<br>
&gt; &gt; ++// makes process_answer() return EBADRESP, so handle_conn_error=
() tears<br>
&gt; the<br>
&gt; &gt; ++// connection down and ares_close_connection() requeues its que=
ries with a<br>
&gt; NULL<br>
&gt; &gt; ++// requeue; with tries=3D1 the query is ended right there.=C2=
=A0 CVE-2026-33630<br>
&gt; fixed<br>
&gt; &gt; ++// the deferred flush path only, so this one still double-freed=
.<br>
&gt; &gt; ++TEST_P(MockUDPSingleTryTest,<br>
&gt; CancelInCallbackConnTeardownNoDoubleFree) {<br>
&gt; &gt; ++=C2=A0 /* Too short to be a DNS header, so it fails to parse. *=
/<br>
&gt; &gt; ++=C2=A0 std::vector&lt;byte&gt; malformed =3D {0x00, 0x00, 0x00,=
 0x00};<br>
&gt; &gt; ++=C2=A0 ON_CALL(server_, OnRequest(&quot;<a href=3D"http://www.g=
oogle.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, T=
_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillByDefault(SetReplyData(&amp;server_, malform=
ed));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CancelInCbData data;<br>
&gt; &gt; ++=C2=A0 data.channel =3D channel_;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.cbs=C2=A0 =C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, =
ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 CancelChannelCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Server-removal route into the same synchronous branch, which=
 the<br>
&gt; &gt; ++// connection-teardown test above does not cover.=C2=A0 Reconfi=
guring the server<br>
&gt; list<br>
&gt; &gt; ++// destroys the servers that are gone, and ares_close_sockets()=
 closes their<br>
&gt; &gt; ++// connections with a NULL requeue -- a second way to reach end=
_query()<br>
&gt; with the<br>
&gt; &gt; ++// query still linked.=C2=A0 No Process() call is needed: the q=
uery is attached to a<br>
&gt; &gt; ++// connection by ares_query_dnsrec() itself, and nothing has re=
plied to it.<br>
&gt; &gt; ++TEST_P(MockUDPSingleTryTest,<br>
&gt; CancelInCallbackServerRemovalNoDoubleFree) {<br>
&gt; &gt; ++=C2=A0 CancelInCbData data;<br>
&gt; &gt; ++=C2=A0 data.channel =3D channel_;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.cbs=C2=A0 =C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, =
ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 CancelChannelCallback, &amp;data, NULL);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Drops the server the in-flight query is attached to. =
*/<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel_,<b=
r>
&gt; &quot;<a href=3D"http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53055</a>&quot;));<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// ares_send_query_int() calls handle_conn_error() on a retryab=
le write<br>
&gt; failure<br>
&gt; &gt; ++// and then keeps using its own query.=C2=A0 That teardown requ=
eues the *other*<br>
&gt; &gt; ++// queries on the connection, and with tries=3D1 they are ended=
 outright; if one<br>
&gt; &gt; ++// of their callbacks reentrantly cancels the channel, this que=
ry is freed too<br>
&gt; &gt; ++// -- it is still linked in all_queries, having only joined<br>
&gt; &gt; ++// conn-&gt;queries_to_conn on the success path further down.=
=C2=A0 Using it<br>
&gt; afterwards<br>
&gt; &gt; ++// is a use-after-free.<br>
&gt; &gt; ++//<br>
&gt; &gt; ++// The first query is left unanswered so it stays on the connec=
tion, then the<br>
&gt; &gt; ++// next write is made to fail with ECONNREFUSED so the second q=
uery takes<br>
&gt; the<br>
&gt; &gt; ++// error path while the first is still attached.<br>
&gt; &gt; ++//<br>
&gt; &gt; ++// Note this is masked on code that has not fixed the end_query=
() double-free:<br>
&gt; &gt; ++// that aborts inside handle_conn_error() before control return=
s here.<br>
&gt; &gt; ++TEST_P(MockUDPSingleTryTest,<br>
&gt; CancelInSiblingCallbackConnErrorNoUseAfterFree) {<br>
&gt; &gt; ++=C2=A0 CancelInCbData data;<br>
&gt; &gt; ++=C2=A0 data.channel =3D channel_;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.cbs=C2=A0 =C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* No reply configured for this one, so it stays attache=
d to the connection. */<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, =
ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 CancelChannelCallback, &amp;data, NULL);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_socket_functions sock_funcs;<br>
&gt; &gt; ++=C2=A0 memset(&amp;sock_funcs, 0, sizeof(sock_funcs));<br>
&gt; &gt; ++=C2=A0 sock_funcs.asendv =3D ares_sendv_fail;<br>
&gt; &gt; ++=C2=A0 ares_set_socket_functions(channel_, &amp;sock_funcs, NUL=
L);<br>
&gt; &gt; ++=C2=A0 LibraryTest::SetFailSend();<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 QueryResult result;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
example.com" rel=3D"noreferrer" target=3D"_blank">www.example.com</a>&quot;=
, ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QueryCallback, &amp;result, NULL);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* The write failure above tears the connection down, wh=
ich ends the first<br>
&gt; &gt; ++=C2=A0 =C2=A0* query, whose callback cancels the channel and fr=
ees this one. */<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 /* The sibling is cancelled from the first query&#39;s c=
allback rather than<br>
&gt; &gt; ++=C2=A0 =C2=A0* requeued; pin that rather than leaving it unstat=
ed. */<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(result.done_);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_ECANCELLED, result.status_);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The socket-state callback -- registered with ARES_OPT_SOCK_S=
TATE_CB,<br>
&gt; the<br>
&gt; &gt; ++// usual way c-ares is driven from an event loop -- used to be =
dispatched from<br>
&gt; &gt; ++// the middle of opening a connection, and ares_open_connection=
() keeps<br>
&gt; using<br>
&gt; &gt; ++// that connection afterwards.=C2=A0 A reentrant ares_cancel() =
from the callback<br>
&gt; &gt; ++// frees both the connection (through the idle sweep) and the i=
n-flight query,<br>
&gt; &gt; ++// leaving the library using either.<br>
&gt; &gt; ++struct SockStateCancelData {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 calls;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void SockStateCancelCallback(void *data, ares_socket_t s=
ocket_fd,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int readable=
, int writable)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 SockStateCancelData *d =3D static_cast&lt;SockStateCance=
lData *&gt;(data);<br>
&gt; &gt; ++=C2=A0 (void)socket_fd;<br>
&gt; &gt; ++=C2=A0 (void)readable;<br>
&gt; &gt; ++=C2=A0 (void)writable;<br>
&gt; &gt; ++=C2=A0 d-&gt;calls++;<br>
&gt; &gt; ++=C2=A0 // Reentrant cancel from the socket-state notification.<=
br>
&gt; &gt; ++=C2=A0 if (d-&gt;channel !=3D nullptr) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_cancel(d-&gt;channel);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, CancelInSockStateCallbackNoUseAfterFree) {<=
br>
&gt; &gt; ++=C2=A0 SockStateCancelData data;<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0*chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 struct ares_options opts;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0optmask =3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.channel =3D nullptr;<br>
&gt; &gt; ++=C2=A0 data.calls=C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 opts.sock_state_cb=C2=A0 =C2=A0 =C2=A0 =3D SockStateCanc=
elCallback;<br>
&gt; &gt; ++=C2=A0 opts.sock_state_cb_data =3D &amp;data;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D ARES_OPT_SOCK_STATE_CB;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_init_options(&amp;chan, &am=
p;opts,<br>
&gt; optmask));<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,<br>
&gt; &quot;<a href=3D"http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53055</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Armed only now, so channel setup itself does not canc=
el. */<br>
&gt; &gt; ++=C2=A0 data.channel =3D chan;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 QueryResult result;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QueryCallback, &amp;result, NULL);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Opening the connection notifies, the notification can=
cels, and the<br>
&gt; &gt; ++=C2=A0 =C2=A0* library must still be able to finish -- and the =
lookup must actually be<br>
&gt; &gt; ++=C2=A0 =C2=A0* cancelled rather than the cancel quietly doing n=
othing. */<br>
&gt; &gt; ++=C2=A0 EXPECT_GT(data.calls, (size_t)0);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(result.done_);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_ECANCELLED, result.status_);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.channel =3D nullptr; /* don&#39;t cancel from teard=
own notifications */<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Deferring the notification must not reorder it past the clos=
e of the<br>
&gt; &gt; ++// descriptor it names.=C2=A0 An event loop is told &quot;stop =
watching fd N&quot;; if fd N is<br>
&gt; &gt; ++// already closed by then, the number can have been handed to s=
omething<br>
&gt; else --<br>
&gt; &gt; ++// including to application code running from a deferred query =
callback -- and<br>
&gt; &gt; ++// the application ends up setting and clearing interest in a d=
escriptor it now<br>
&gt; &gt; ++// owns for another purpose.<br>
&gt; &gt; ++//<br>
&gt; &gt; ++// The invariant is checked directly: while the callback naming=
 the descriptor<br>
&gt; &gt; ++// runs, that descriptor must still be open.<br>
&gt; &gt; ++#ifndef _WIN32<br>
&gt; &gt; ++struct SockStateCloseOrderData {<br>
&gt; &gt; ++=C2=A0 size_t closes_seen;<br>
&gt; &gt; ++=C2=A0 size_t closed_while_already_shut;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void SockStateCloseOrderCallback(void *data, ares_socket=
_t<br>
&gt; socket_fd,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int readable, int writable)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 SockStateCloseOrderData *d =3D static_cast&lt;SockStateC=
loseOrderData<br>
&gt; *&gt;(data);<br>
&gt; &gt; ++=C2=A0 if (readable || writable) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 d-&gt;closes_seen++;<br>
&gt; &gt; ++=C2=A0 // F_GETFD on a closed descriptor fails with EBADF.=C2=
=A0 c-ares must not have<br>
&gt; &gt; ++=C2=A0 // closed it yet at this point.<br>
&gt; &gt; ++=C2=A0 if (fcntl(static_cast&lt;int&gt;(socket_fd), F_GETFD) =
=3D=3D -1 &amp;&amp; errno =3D=3D EBADF) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;closed_while_already_shut++;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, SockStateCloseIsReportedBeforeDescriptorClo=
ses) {<br>
&gt; &gt; ++=C2=A0 SockStateCloseOrderData data;<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*chan =
=3D nullptr;<br>
&gt; &gt; ++=C2=A0 struct ares_options=C2=A0 =C2=A0 =C2=A0opts;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.closes_seen=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; ++=C2=A0 data.closed_while_already_shut =3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 opts.sock_state_cb=C2=A0 =C2=A0 =C2=A0 =3D SockStateClos=
eOrderCallback;<br>
&gt; &gt; ++=C2=A0 opts.sock_state_cb_data =3D &amp;data;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_init_options(&am=
p;chan, &amp;opts, ARES_OPT_SOCK_STATE_CB));<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,<br>
&gt; &quot;<a href=3D"http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53055</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 QueryResult result;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QueryCallback, &amp;result, NULL);<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_GT(data.closes_seen, (size_t)0);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, data.closed_while_already_shut)<br>
&gt; &gt; ++=C2=A0 =C2=A0 &lt;&lt; &quot;the application was told to stop w=
atching a descriptor c-ares had &quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;already closed&quot;;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++#endif<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Reconfiguring the servers from an I/O hook frees the server =
and its<br>
&gt; &gt; ++// connection while the library is still holding both.=C2=A0 De=
ferred reclamation is<br>
&gt; &gt; ++// what makes these safe: the objects are unlinked from every l=
ookup<br>
&gt; structure<br>
&gt; &gt; ++// immediately, so nothing can find them, but their memory surv=
ives until the<br>
&gt; &gt; ++// outermost call unwinds.=C2=A0 Without it these are heap-use-=
after-free in<br>
&gt; &gt; ++// ares_conn_connect() and handle_conn_error() respectively.<br=
>
&gt; &gt; ++//<br>
&gt; &gt; ++// This is the class behind CVE-2025-31498 and CVE-2025-62408 -=
- a<br>
&gt; connection<br>
&gt; &gt; ++// cleaned up while a caller further up the stack still held it=
.<br>
&gt; &gt; ++struct ReconfigureFromHookData {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0statu=
s;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static int ReconfigureConfigureCallback(ares_socket_t fd, int t=
ype, void<br>
&gt; *data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ReconfigureFromHookData *d =3D static_cast&lt;Reconfigur=
eFromHookData<br>
&gt; *&gt;(data);<br>
&gt; &gt; ++=C2=A0 (void)fd;<br>
&gt; &gt; ++=C2=A0 (void)type;<br>
&gt; &gt; ++=C2=A0 // Frees the server this connection is being opened for.=
<br>
&gt; &gt; ++=C2=A0 ares_set_servers_csv(d-&gt;channel, &quot;<a href=3D"htt=
p://127.0.0.1:53056" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:53056</=
a>&quot;);<br>
&gt; &gt; ++=C2=A0 return 0;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void ReconfigureFromHookCallback(void *arg, ares_status_=
t status,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const ares_dns_record_t *dnsrec)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ReconfigureFromHookData *d =3D static_cast&lt;Reconfigur=
eFromHookData<br>
&gt; *&gt;(arg);<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 d-&gt;done=C2=A0 =C2=A0=3D true;<br>
&gt; &gt; ++=C2=A0 d-&gt;status =3D static_cast&lt;int&gt;(status);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, ReconfigureInConfigureHookNoUseAfterFree) {=
<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*chan =
=3D nullptr;<br>
&gt; &gt; ++=C2=A0 struct ares_options=C2=A0 =C2=A0 =C2=A0opts;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0optmask =3D 0;<br>
&gt; &gt; ++=C2=A0 ReconfigureFromHookData data;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 opts.tries=C2=A0 =3D 1;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 |=3D ARES_OPT_TRIES;<br>
&gt; &gt; ++=C2=A0 opts.flags=C2=A0 =3D ARES_FLAG_NOSEARCH;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 |=3D ARES_OPT_FLAGS;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_init_options(&amp;chan, &am=
p;opts,<br>
&gt; optmask));<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,<br>
&gt; &quot;<a href=3D"http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53055</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.channel =3D chan;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.status=C2=A0 =3D ARES_SUCCESS;<br>
&gt; &gt; ++=C2=A0 ares_set_socket_configure_callback(chan, ReconfigureConf=
igureCallback,<br>
&gt; &amp;data);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ReconfigureFromHookCallback, &amp;data, NULL);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Must complete rather than be stranded -- every exit f=
rom the send path<br>
&gt; &gt; ++=C2=A0 // either enqueues the query or ends it.<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The second route to the same freed connection, and the one t=
hat drove the<br>
&gt; &gt; ++// change from suppressing the idle sweep to deferring the noti=
fication:<br>
&gt; &gt; ++// reconfiguring the servers from the socket-state callback des=
troys the server<br>
&gt; &gt; ++// and with it the connection ares_open_connection() is still u=
sing.=C2=A0 Nothing<br>
&gt; &gt; ++// covered this route, so a regression in it would have gone un=
noticed.<br>
&gt; &gt; ++struct SockStateReconfigureData {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 calls;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void SockStateReconfigureCallback(void *data, ares_socke=
t_t<br>
&gt; socket_fd,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int readable, int writable)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 SockStateReconfigureData *d =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 static_cast&lt;SockStateReconfigureData *&gt;(dat=
a);<br>
&gt; &gt; ++=C2=A0 (void)socket_fd;<br>
&gt; &gt; ++=C2=A0 (void)readable;<br>
&gt; &gt; ++=C2=A0 (void)writable;<br>
&gt; &gt; ++=C2=A0 d-&gt;calls++;<br>
&gt; &gt; ++=C2=A0 if (d-&gt;channel !=3D nullptr) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 // Destroys the server, and with it the connectio=
n being opened.<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_set_servers_csv(d-&gt;channel, &quot;<a href=
=3D"http://127.0.0.1:53056" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:=
53056</a>&quot;);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, ReconfigureInSockStateCallbackNoUseAfterFre=
e) {<br>
&gt; &gt; ++=C2=A0 SockStateReconfigureData data;<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *chan =
=3D nullptr;<br>
&gt; &gt; ++=C2=A0 struct ares_options=C2=A0 =C2=A0 =C2=A0 opts;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.channel =3D nullptr;<br>
&gt; &gt; ++=C2=A0 data.calls=C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 opts.sock_state_cb=C2=A0 =C2=A0 =C2=A0 =3D SockStateReco=
nfigureCallback;<br>
&gt; &gt; ++=C2=A0 opts.sock_state_cb_data =3D &amp;data;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_init_options(&am=
p;chan, &amp;opts, ARES_OPT_SOCK_STATE_CB));<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,<br>
&gt; &quot;<a href=3D"http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53055</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Armed only now, so channel setup itself does not reco=
nfigure. */<br>
&gt; &gt; ++=C2=A0 data.channel =3D chan;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 QueryResult result;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QueryCallback, &amp;result, NULL);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_GT(data.calls, (size_t)0);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.channel =3D nullptr; /* don&#39;t reconfigure from =
teardown notifications */<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Deferring the notifications must not lose them: every public=
 entry point<br>
&gt; &gt; ++// that closes a socket still has to tell the application about=
 it before it<br>
&gt; &gt; ++// returns, or an event loop is left polling a descriptor that =
c-ares closed.<br>
&gt; &gt; ++struct SockStateRecordData {<br>
&gt; &gt; ++=C2=A0 std::vector&lt;std::pair&lt;ares_socket_t, bool&gt;&gt; =
events; /* fd, still-armed */<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void SockStateRecordCallback(void *data, ares_socket_t s=
ocket_fd,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int readable=
, int writable)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 SockStateRecordData *d =3D static_cast&lt;SockStateRecor=
dData *&gt;(data);<br>
&gt; &gt; ++=C2=A0 d-&gt;events.push_back(std::make_pair(socket_fd, readabl=
e || writable));<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static bool SawClose(const SockStateRecordData &amp;d)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 for (size_t i =3D 0; i &lt; d.events.size(); i++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (!d.events[i].second) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 return false;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++class SockStateDeliveryTest : public LibraryTest {<br>
&gt; &gt; ++protected:<br>
&gt; &gt; ++=C2=A0 void OpenConnection(ares_channel_t **chan, SockStateReco=
rdData *data,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 QueryResult *result)<br>
&gt; &gt; ++=C2=A0 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 struct ares_options opts;<br>
&gt; &gt; ++=C2=A0 =C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 =C2=A0 opts.sock_state_cb=C2=A0 =C2=A0 =C2=A0 =3D SockSt=
ateRecordCallback;<br>
&gt; &gt; ++=C2=A0 =C2=A0 opts.sock_state_cb_data =3D data;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 ASSERT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_init_opti=
ons(chan, &amp;opts, ARES_OPT_SOCK_STATE_CB));<br>
&gt; &gt; ++=C2=A0 =C2=A0 ASSERT_NE(nullptr, *chan);<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* TEST-NET-1, guaranteed not to answer, so the s=
ocket is still open when<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* the call under test runs. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 ASSERT_EQ(ARES_SUCCESS, ares_set_servers_csv(*cha=
n,<br>
&gt; &quot;<a href=3D"http://192.0.2.1:53" rel=3D"noreferrer" target=3D"_bl=
ank">192.0.2.1:53</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_query_dnsrec(*chan, &quot;<a href=3D"http://=
www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quo=
t;, ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 QueryCallback, result, NULL);<br>
&gt; &gt; ++=C2=A0 =C2=A0 ASSERT_FALSE(result-&gt;done_);<br>
&gt; &gt; ++=C2=A0 =C2=A0 ASSERT_FALSE(data-&gt;events.empty());<br>
&gt; &gt; ++=C2=A0 =C2=A0 ASSERT_TRUE(data-&gt;events.back().second); /* op=
ened, armed for read */<br>
&gt; &gt; ++=C2=A0 =C2=A0 data-&gt;events.clear();<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(SockStateDeliveryTest, CancelReportsSocketClose) {<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0*chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 SockStateRecordData data;<br>
&gt; &gt; ++=C2=A0 QueryResult=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 OpenConnection(&amp;chan, &amp;data, &amp;result);<br>
&gt; &gt; ++=C2=A0 ares_cancel(chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(SawClose(data)) &lt;&lt; &quot;ares_cancel()=
 closed the socket<br>
&gt; without &quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;telling the ap=
plication&quot;;<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(SockStateDeliveryTest, SetServersReportsSocketClose) {<b=
r>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0*chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 SockStateRecordData data;<br>
&gt; &gt; ++=C2=A0 QueryResult=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 OpenConnection(&amp;chan, &amp;data, &amp;result);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,<br>
&gt; &quot;<a href=3D"http://198.51.100.1:53" rel=3D"noreferrer" target=3D"=
_blank">198.51.100.1:53</a>&quot;));<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(SawClose(data)) &lt;&lt; &quot;ares_set_serv=
ers_csv() closed the<br>
&gt; socket &quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;without tellin=
g the application&quot;;<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(SockStateDeliveryTest, DestroyReportsSocketClose) {<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0*chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 SockStateRecordData data;<br>
&gt; &gt; ++=C2=A0 QueryResult=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 OpenConnection(&amp;chan, &amp;data, &amp;result);<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(SawClose(data)) &lt;&lt; &quot;ares_destroy(=
) closed the socket<br>
&gt; without &quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;telling the ap=
plication&quot;;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The server-state callback is dispatched from the middle of p=
rocessing, and<br>
&gt; &gt; ++// every caller keeps using its query afterwards.=C2=A0 Nothing=
 documents the<br>
&gt; &gt; ++// callback as non-reentrant, and the channel lock is recursive=
 precisely so<br>
&gt; &gt; ++// API calls from callbacks are allowed -- so an application th=
at cancels from<br>
&gt; &gt; ++// it left the library using a freed query.<br>
&gt; &gt; ++//<br>
&gt; &gt; ++// No hostile input is needed: an ordinary timeout reaches the =
same place.=C2=A0 A<br>
&gt; &gt; ++// SERVFAIL is used here because it is deterministic in the har=
ness.<br>
&gt; &gt; ++struct ServerStateCancelData {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serve=
r_cb_calls;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 query_done=
;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void ServerStateCancelCallback(const char *server_string=
,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_=
bool_t success, int flags,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void =
*data) {<br>
&gt; &gt; ++=C2=A0 ServerStateCancelData *d =3D static_cast&lt;ServerStateC=
ancelData *&gt;(data);<br>
&gt; &gt; ++=C2=A0 (void)server_string;<br>
&gt; &gt; ++=C2=A0 (void)success;<br>
&gt; &gt; ++=C2=A0 (void)flags;<br>
&gt; &gt; ++=C2=A0 d-&gt;server_cb_calls++;<br>
&gt; &gt; ++=C2=A0 // Reentrant cancel from the notification.<br>
&gt; &gt; ++=C2=A0 ares_cancel(d-&gt;channel);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void ServerStateQueryCallback(void *arg, ares_status_t s=
tatus,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t=
 timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const =
ares_dns_record_t *dnsrec) {<br>
&gt; &gt; ++=C2=A0 ServerStateCancelData *d =3D static_cast&lt;ServerStateC=
ancelData *&gt;(arg);<br>
&gt; &gt; ++=C2=A0 (void)status;<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 d-&gt;query_done =3D true;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The advisory&#39;s headline claim is that no hostile input i=
s needed, because an<br>
&gt; &gt; ++// ordinary timeout reaches the same place.=C2=A0 The SERVFAIL =
test below does<br>
&gt; not<br>
&gt; &gt; ++// show that; this one does.<br>
&gt; &gt; ++class ServerStateTimeoutCancelTest<br>
&gt; &gt; ++=C2=A0 : public MockChannelOptsTest,<br>
&gt; &gt; ++=C2=A0 =C2=A0 public ::testing::WithParamInterface&lt;int&gt; {=
<br>
&gt; &gt; ++ public:<br>
&gt; &gt; ++=C2=A0 ServerStateTimeoutCancelTest()<br>
&gt; &gt; ++=C2=A0 =C2=A0 : MockChannelOptsTest(1, GetParam(), false, false=
, FillOptions(&amp;opts_),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_OPT_TIMEOUTMS | ARES_OPT_TRIES) {}<br>
&gt; &gt; ++=C2=A0 static struct ares_options *FillOptions(struct ares_opti=
ons *opts) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 memset(opts, 0, sizeof(struct ares_options));<br>
&gt; &gt; ++=C2=A0 =C2=A0 opts-&gt;timeout =3D 100;<br>
&gt; &gt; ++=C2=A0 =C2=A0 opts-&gt;tries=C2=A0 =C2=A0=3D 3;<br>
&gt; &gt; ++=C2=A0 =C2=A0 return opts;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++ private:<br>
&gt; &gt; ++=C2=A0 struct ares_options opts_;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_P(ServerStateTimeoutCancelTest,<br>
&gt; CancelInServerStateCallbackOnTimeout) {<br>
&gt; &gt; ++=C2=A0 ServerStateCancelData data;<br>
&gt; &gt; ++=C2=A0 data.channel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D channe=
l_;<br>
&gt; &gt; ++=C2=A0 data.server_cb_calls =3D 0;<br>
&gt; &gt; ++=C2=A0 data.query_done=C2=A0 =C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_set_server_state_callback(channel_, ServerStateCanc=
elCallback,<br>
&gt; &amp;data);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // No reply configured, so the query times out and the n=
otification comes<br>
&gt; &gt; ++=C2=A0 // from process_timeouts() rather than from a response.<=
br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel_, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" target=3D=
"_blank">www.google.com</a>&quot;, ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, ServerStateQuery=
Callback, &amp;data,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL));<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_GT(data.server_cb_calls, 0);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.query_done);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++INSTANTIATE_TEST_SUITE_P(AddressFamilies,<br>
&gt; ServerStateTimeoutCancelTest,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0::testing::ValuesIn(ares::test::families),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0PrintFamily);<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Unregistering with a NULL callback discards whatever is stil=
l queued -- the<br>
&gt; &gt; ++// documented behaviour of deferring delivery, and the only way=
 an<br>
&gt; application<br>
&gt; &gt; ++// can opt back out once notifications are in flight.<br>
&gt; &gt; ++struct ServerStateUnregisterData {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 server_cb_calls=
;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 query_done=
;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void ServerStateUnregisterCallback(const char *server_st=
ring,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ares_bool_t success,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int flags, void *user_data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ServerStateUnregisterData *d =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 static_cast&lt;ServerStateUnregisterData *&gt;(us=
er_data);<br>
&gt; &gt; ++=C2=A0 (void)server_string;<br>
&gt; &gt; ++=C2=A0 (void)success;<br>
&gt; &gt; ++=C2=A0 (void)flags;<br>
&gt; &gt; ++=C2=A0 d-&gt;server_cb_calls++;<br>
&gt; &gt; ++=C2=A0 // Clear ourselves from inside the first notification.=
=C2=A0 Any notification<br>
&gt; &gt; ++=C2=A0 // still queued behind this one must be dropped rather t=
han delivered.<br>
&gt; &gt; ++=C2=A0 ares_set_server_state_callback(d-&gt;channel, NULL, NULL=
);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void ServerStateUnregisterQueryCallback(void *arg, ares_=
status_t<br>
&gt; status,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const ares_dns_record_t *dnsrec)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ServerStateUnregisterData *d =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 static_cast&lt;ServerStateUnregisterData *&gt;(ar=
g);<br>
&gt; &gt; ++=C2=A0 (void)status;<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 d-&gt;query_done =3D true;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_P(ServerStateTimeoutCancelTest,<br>
&gt; UnregisterInCallbackDiscardsQueued) {<br>
&gt; &gt; ++=C2=A0 ServerStateUnregisterData data;<br>
&gt; &gt; ++=C2=A0 data.channel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D channe=
l_;<br>
&gt; &gt; ++=C2=A0 data.server_cb_calls =3D 0;<br>
&gt; &gt; ++=C2=A0 data.query_done=C2=A0 =C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_set_server_state_callback(channel_, ServerStateUnre=
gisterCallback,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;data);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // No reply configured: the query times out on every try=
, so more than one<br>
&gt; &gt; ++=C2=A0 // notification is queued before the flush point is reac=
hed.<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel_, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" target=3D=
"_blank">www.google.com</a>&quot;, ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ServerStateUnregisterQueryCallbac=
k, &amp;data, NULL));<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, data.server_cb_calls);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.query_done);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_P(MockUDPChannelTest,<br>
&gt; CancelInServerStateCallbackNoUseAfterFree) {<br>
&gt; &gt; ++=C2=A0 DNSPacket servfail;<br>
&gt; &gt; ++=C2=A0 servfail.set_response().set_aa().set_rcode(SERVFAIL)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a=
>&quot;, T_A));<br>
&gt; &gt; ++=C2=A0 ON_CALL(server_, OnRequest(&quot;<a href=3D"http://www.g=
oogle.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, T=
_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillByDefault(SetReply(&amp;server_, &amp;servfa=
il));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ServerStateCancelData data;<br>
&gt; &gt; ++=C2=A0 data.channel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D channe=
l_;<br>
&gt; &gt; ++=C2=A0 data.server_cb_calls =3D 0;<br>
&gt; &gt; ++=C2=A0 data.query_done=C2=A0 =C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_set_server_state_callback(channel_, ServerStateCanc=
elCallback,<br>
&gt; &amp;data);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, =
ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ServerStateQueryCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_GT(data.server_cb_calls, 0);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.query_done);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The deferred requeue list records the target server as a raw=
 pointer, and<br>
&gt; &gt; ++// the drain never revalidated it -- although it does revalidat=
e the query, by<br>
&gt; &gt; ++// qid, for exactly the same reason.=C2=A0 Application callback=
s run from inside that<br>
&gt; &gt; ++// drain, and a callback may legally reconfigure the servers, w=
hich frees the<br>
&gt; &gt; ++// ones no longer in the list.=C2=A0 A later entry in the same =
drain then dispatches<br>
&gt; &gt; ++// through a freed ares_server_t.<br>
&gt; &gt; ++//<br>
&gt; &gt; ++// Two replies must be read in one batch: an ordinary answer wh=
ose callback<br>
&gt; &gt; ++// reconfigures, and a FORMERR carrying no OPT record, which is=
 what<br>
&gt; makes<br>
&gt; &gt; ++// process_answer() queue a retry *to the same server* (the EDN=
S fallback --<br>
&gt; &gt; ++// the only site that records a server pointer at all).<br>
&gt; &gt; ++struct ReconfigureInCbData {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void ReconfigureChannelCallback(void *arg, ares_status_t=
 status,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0size_t timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0const ares_dns_record_t *dnsrec) {<br>
&gt; &gt; ++=C2=A0 ReconfigureInCbData *data =3D static_cast&lt;Reconfigure=
InCbData *&gt;(arg);<br>
&gt; &gt; ++=C2=A0 (void)status;<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 data-&gt;done =3D true;<br>
&gt; &gt; ++=C2=A0 /* Frees every server absent from the new configuration.=
 */<br>
&gt; &gt; ++=C2=A0 ares_set_servers_csv(data-&gt;channel, &quot;<a href=3D"=
http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:5305=
5</a>&quot;);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_P(MockUDPChannelTest,<br>
&gt; ReconfigureInCallbackStaleRequeueServer) {<br>
&gt; &gt; ++=C2=A0 DNSPacket okrsp;<br>
&gt; &gt; ++=C2=A0 okrsp.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a=
>&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;<a href=3D"http://ww=
w.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;=
, 100, {1, 2, 3, 4}));<br>
&gt; &gt; ++=C2=A0 ON_CALL(server_, OnRequest(&quot;<a href=3D"http://www.g=
oogle.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, T=
_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillByDefault(SetReply(&amp;server_, &amp;okrsp)=
);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* FORMERR with no OPT record: the server looks like it =
does not<br>
&gt; understand<br>
&gt; &gt; ++=C2=A0 =C2=A0* EDNS, so the query is queued for retry to this s=
ame server. */<br>
&gt; &gt; ++=C2=A0 DNSPacket formerr;<br>
&gt; &gt; ++=C2=A0 formerr.set_response().set_aa().set_rcode(FORMERR)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://www.example.com" rel=3D"noreferrer" target=3D"_blank">www.example.com<=
/a>&quot;, T_A));<br>
&gt; &gt; ++=C2=A0 ON_CALL(server_, OnRequest(&quot;<a href=3D"http://www.e=
xample.com" rel=3D"noreferrer" target=3D"_blank">www.example.com</a>&quot;,=
 T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillByDefault(SetReply(&amp;server_, &amp;former=
r));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ReconfigureInCbData data;<br>
&gt; &gt; ++=C2=A0 data.channel =3D channel_;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 QueryResult second;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, =
ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ReconfigureChannelCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
example.com" rel=3D"noreferrer" target=3D"_blank">www.example.com</a>&quot;=
, ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QueryCallback, &amp;second, NULL);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Both replies have to be consumed in a single pass so =
they share one<br>
&gt; &gt; ++=C2=A0 =C2=A0* deferred-requeue scope -- that is what puts the =
ENDQUERY entry whose<br>
&gt; &gt; ++=C2=A0 =C2=A0* callback reconfigures ahead of the REQUEUE entry=
 holding a server<br>
&gt; &gt; ++=C2=A0 =C2=A0* pointer.=C2=A0 The usual Process() loop lets c-a=
res read between the two, so<br>
&gt; &gt; ++=C2=A0 =C2=A0* they never share a batch; answer both first, the=
n read once. */<br>
&gt; &gt; ++=C2=A0 for (int i =3D 0; i &lt; 4; i++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 std::set&lt;ares_socket_t&gt; server_fds =3D fds(=
);<br>
&gt; &gt; ++=C2=A0 =C2=A0 fd_set=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 r;<br>
&gt; &gt; ++=C2=A0 =C2=A0 struct timeval=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
tv=C2=A0 =C2=A0=3D {0, 20000};<br>
&gt; &gt; ++=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nfds =3D 0;<br>
&gt; &gt; ++=C2=A0 =C2=A0 FD_ZERO(&amp;r);<br>
&gt; &gt; ++=C2=A0 =C2=A0 for (ares_socket_t fd : server_fds) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 FD_SET(fd, &amp;r);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if ((int)fd &gt;=3D nfds) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 nfds =3D (int)fd + 1;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (select(nfds, &amp;r, nullptr, nullptr, &amp;t=
v) &lt;=3D 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 for (ares_socket_t fd : server_fds) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (FD_ISSET(fd, &amp;r)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ProcessFD(fd);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 fd_set=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readers;<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 fd_set=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writers;<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 struct timeval tv =3D {0, 0};<br>
&gt; &gt; ++=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nfds=
;<br>
&gt; &gt; ++=C2=A0 =C2=A0 FD_ZERO(&amp;readers);<br>
&gt; &gt; ++=C2=A0 =C2=A0 FD_ZERO(&amp;writers);<br>
&gt; &gt; ++=C2=A0 =C2=A0 nfds =3D ares_fds(channel_, &amp;readers, &amp;wr=
iters);<br>
&gt; &gt; ++=C2=A0 =C2=A0 select(nfds, &amp;readers, &amp;writers, nullptr,=
 &amp;tv);<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_process(channel_, &amp;readers, &amp;writers=
);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* With the fix the FORMERR query is correctly re-dispat=
ched (to the newly<br>
&gt; &gt; ++=C2=A0 =C2=A0* configured, unreachable server) rather than goin=
g through a freed one, so<br>
&gt; &gt; ++=C2=A0 =C2=A0* it is still outstanding here.=C2=A0 Cancel it so=
 its callback runs while its<br>
&gt; &gt; ++=C2=A0 =C2=A0* result object is still in scope. */<br>
&gt; &gt; ++=C2=A0 ares_cancel(channel_);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(second.done_);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// ares_servers_remove_stale() destroys each stale server in tu=
rn, and that<br>
&gt; &gt; ++// reaches application callbacks (ares_destroy_server() -&gt;<b=
r>
&gt; ares_close_sockets()<br>
&gt; &gt; ++// -&gt; ares_requeue_queries() -&gt; end_query()).=C2=A0 A cal=
lback that reconfigures<br>
&gt; the<br>
&gt; &gt; ++// servers again destroys the servers the outer loop has not vi=
sited yet, so a<br>
&gt; &gt; ++// cached &quot;next&quot; node points at freed memory.<br>
&gt; &gt; ++struct NestedReconfigureData {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nested;<br=
>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void NestedReconfigureCallback(void *arg, ares_status_t =
status,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_=
t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeo=
uts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const=
 ares_dns_record_t *dnsrec) {<br>
&gt; &gt; ++=C2=A0 NestedReconfigureData *data =3D static_cast&lt;NestedRec=
onfigureData<br>
&gt; *&gt;(arg);<br>
&gt; &gt; ++=C2=A0 (void)status;<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 if (data-&gt;nested) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 data-&gt;nested =3D true;<br>
&gt; &gt; ++=C2=A0 // Destroys the stale servers the outer removal loop has=
 not reached yet.<br>
&gt; &gt; ++=C2=A0 ares_set_servers_csv(data-&gt;channel, &quot;&quot;);<br=
>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, NestedReconfigureInCallbackRemoveStale) {<b=
r>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0*channel =3D nullptr;<=
br>
&gt; &gt; ++=C2=A0 struct ares_options opts;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0optmask =3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 /* One try per server, so tearing them down exhausts the=
 query&#39;s retries and<br>
&gt; &gt; ++=C2=A0 =C2=A0* runs its callback from inside the removal loop. =
*/<br>
&gt; &gt; ++=C2=A0 opts.tries=C2=A0 =3D 1;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 |=3D ARES_OPT_TRIES;<br>
&gt; &gt; ++=C2=A0 opts.flags=C2=A0 =3D ARES_FLAG_NOSEARCH;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 |=3D ARES_OPT_FLAGS;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_init_options(&amp;channel, =
&amp;opts,<br>
&gt; optmask));<br>
&gt; &gt; ++=C2=A0 /* Three servers, so the loop still has entries after de=
stroying the first.<br>
&gt; &gt; ++=C2=A0 =C2=A0* Nothing listens on these ports; no traffic is ne=
eded. */<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_set_servers_csv(=
channel, &quot;<a href=3D"http://127.0.0.1:53101" rel=3D"noreferrer" target=
=3D"_blank">127.0.0.1:53101</a>,<a href=3D"http://127.0.0.1:53102" rel=3D"n=
oreferrer" target=3D"_blank">127.0.0.1:53102</a>,&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;<a href=3D"http://127.0.0.1:53103" rel=3D"noreferrer" targ=
et=3D"_blank">127.0.0.1:53103</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 NestedReconfigureData data;<br>
&gt; &gt; ++=C2=A0 data.channel =3D channel;<br>
&gt; &gt; ++=C2=A0 data.nested=C2=A0 =3D false;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel, &quot;<a href=3D"http://www.example.com" rel=3D"noreferrer" target=3D=
"_blank">www.example.com</a>&quot;, ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, NestedReconfigur=
eCallback,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;data, NULL));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel, &q=
uot;&quot;));<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.nested);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_destroy(channel);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The same nesting, but the nested reconfiguration *installs* =
a server rather<br>
&gt; &gt; ++// than clearing the list.=C2=A0 Restarting the removal walk fr=
om the head then<br>
&gt; &gt; ++// re-judges that server against the outer call&#39;s list, dec=
ides it is stale and<br>
&gt; &gt; ++// deletes it -- so ares_set_servers_csv() returns success and =
leaves the<br>
&gt; &gt; ++// channel with no servers at all.=C2=A0 Memory-safe and still =
wrong.<br>
&gt; &gt; ++static void NestedReplaceCallback(void *arg, ares_status_t stat=
us,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_dns_reco=
rd_t *dnsrec) {<br>
&gt; &gt; ++=C2=A0 NestedReconfigureData *data =3D static_cast&lt;NestedRec=
onfigureData<br>
&gt; *&gt;(arg);<br>
&gt; &gt; ++=C2=A0 (void)status;<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 if (data-&gt;nested) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 data-&gt;nested =3D true;<br>
&gt; &gt; ++=C2=A0 // Installs a server the outer loop has never seen.<br>
&gt; &gt; ++=C2=A0 ares_set_servers_csv(data-&gt;channel, &quot;<a href=3D"=
http://127.0.0.1:53201" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:5320=
1</a>&quot;);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, NestedReconfigureInCallbackKeepsNestedServe=
rs) {<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0*channel =3D nullptr;<=
br>
&gt; &gt; ++=C2=A0 struct ares_options opts;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0optmask =3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 opts.tries=C2=A0 =3D 1;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 |=3D ARES_OPT_TRIES;<br>
&gt; &gt; ++=C2=A0 opts.flags=C2=A0 =3D ARES_FLAG_NOSEARCH;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 |=3D ARES_OPT_FLAGS;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_init_options(&amp;channel, =
&amp;opts,<br>
&gt; optmask));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel,<br=
>
&gt; &quot;<a href=3D"http://127.0.0.1:53101" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53101</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 NestedReconfigureData data;<br>
&gt; &gt; ++=C2=A0 data.channel =3D channel;<br>
&gt; &gt; ++=C2=A0 data.nested=C2=A0 =3D false;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
nnel, &quot;<a href=3D"http://www.example.com" rel=3D"noreferrer" target=3D=
"_blank">www.example.com</a>&quot;, ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, NestedReplaceCal=
lback, &amp;data,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel,<br=
>
&gt; &quot;<a href=3D"http://127.0.0.1:53301" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53301</a>&quot;));<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.nested);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // The nested call reconciled the whole list; what it in=
stalled must survive.<br>
&gt; &gt; ++=C2=A0 char *csv =3D ares_get_servers_csv(channel);<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, csv);<br>
&gt; &gt; ++=C2=A0 EXPECT_STREQ(&quot;<a href=3D"http://127.0.0.1:53201" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:53201</a>&quot;, csv);<br>
&gt; &gt; ++=C2=A0 ares_free_string(csv);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_destroy(channel);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + TEST_P(MockUDPChannelTest, CancelInCallbackNoDoubleFree) {<br>
&gt; &gt; +=C2=A0 =C2=A0DNSPacket reply;<br>
&gt; &gt; +=C2=A0 =C2=A0reply.set_response().set_aa()<br>
&gt; &gt; +@@ -1940,6 +3007,7 @@ TEST_P(MockUDPChannelTest,<br>
&gt; CancelInCallbackNoDoubleFree) {<br>
&gt; &gt; +=C2=A0 =C2=A0CancelInCbData data;<br>
&gt; &gt; +=C2=A0 =C2=A0data.channel =3D channel_;<br>
&gt; &gt; +=C2=A0 =C2=A0data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.cbs=C2=A0 =C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0ares_query_dnsrec(channel_, &quot;<a href=3D"http:/=
/www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&qu=
ot;, ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0CancelChannelCallback, &amp;data, NULL);<br>
&gt; &gt; +=C2=A0 =C2=A0Process();<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/c-ares/c-ares/0002-Deliver-d=
eferred-socket-<br>
&gt; server-state-notifications.patch b/meta-oe/recipes-support/c-ares/c-ar=
es/0002-<br>
&gt; Deliver-deferred-socket-server-state-notifications.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..c34d3ab7c7<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-support/c-ares/c-ares/0002-Deliver-deferred=
-socket-<br>
&gt; server-state-notifications.patch<br>
&gt; &gt; @@ -0,0 +1,393 @@<br>
&gt; &gt; +From f944c4718fd672c9c0befd65a340abb2ccfc1a31 Mon Sep 17 00:00:0=
0<br>
&gt; 2001<br>
&gt; &gt; +From: Brad House &lt;<a href=3D"mailto:brad@brad-house.com" targ=
et=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Date: Sun, 18 Oct 2026 20:28:11 -0400<br>
&gt; &gt; +Subject: [PATCH] Deliver deferred socket/server-state notificati=
ons only from<br>
&gt; &gt; + the outermost public call (#1340)<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +Backport of f023a52a (#1340) to v1.34.<br>
&gt; &gt; +<br>
&gt; &gt; +The recent change that queues socket-state and server-state<br>
&gt; &gt; +notifications delivers them, and runs the deferred cleanup, only=
 from<br>
&gt; &gt; +the outermost `ares_deferred_cb_leave()`. `ares_send_nolock()` b=
rackets<br>
&gt; &gt; +`ares_send_query()` itself, but most public lookup functions nev=
er<br>
&gt; &gt; +opened a region of their own. When reached from `ares_getaddrinf=
o()`,<br>
&gt; &gt; +`ares_query_dnsrec()` and similar, the bracket inside<br>
&gt; &gt; +`ares_send_nolock()` was therefore the outermost one. Notificati=
ons were<br>
&gt; &gt; +then delivered from inside an internal call while the library wa=
s still<br>
&gt; &gt; +in the middle of the public call, and its callers were still usi=
ng their<br>
&gt; &gt; +lookup state (the host query, the query id out-pointer, ...). A<=
br>
&gt; &gt; +server-state callback that reconfigures the servers, which<br>
&gt; &gt; +`ares_set_server_state_callback(3)` documents as allowed, could =
end that<br>
&gt; &gt; +lookup before the caller was done with it.<br>
&gt; &gt; +<br>
&gt; &gt; +This is a regression in unreleased code. No released version is<=
br>
&gt; &gt; +affected.<br>
&gt; &gt; +<br>
&gt; &gt; +The outermost region is now opened by the public entry points<br=
>
&gt; &gt; +themselves, under the channel lock:<br>
&gt; &gt; +<br>
&gt; &gt; +- `ares_send_dnsrec()` (also used by `ares_send()`)<br>
&gt; &gt; +- `ares_query_dnsrec()` (also used by `ares_query()`)<br>
&gt; &gt; +- `ares_search()`, `ares_search_dnsrec()`<br>
&gt; &gt; +- `ares_getaddrinfo()` (also used by `ares_gethostbyname()`)<br>
&gt; &gt; +- `ares_gethostbyaddr()`, `ares_getnameinfo()`<br>
&gt; &gt; +- `ares_process_pending_write()`: a failed flush closes the conn=
ection<br>
&gt; &gt; +and fails its queries over, and this function had no bracket at =
all.<br>
&gt; &gt; +<br>
&gt; &gt; +`ares_process_fds()` (and through it<br>
&gt; &gt; +`ares_process()`/`ares_process_fd()`), `ares_cancel()`, `ares_de=
stroy()`<br>
&gt; &gt; +and the server configuration functions already had their own. Th=
e nested<br>
&gt; &gt; +bracket in `ares_send_nolock()` stays, because it keeps connecti=
ons and<br>
&gt; &gt; +servers unlinked during the send readable until the send returns=
.<br>
&gt; &gt; +Internal sends made from query callbacks (search next domain,<br=
>
&gt; &gt; +getaddrinfo next lookup, requeue, server probes) already run ins=
ide the<br>
&gt; &gt; +processing bracket.<br>
&gt; &gt; +<br>
&gt; &gt; +The comments on `ares_deferred_cb_enter()` and the flush now sta=
te the<br>
&gt; &gt; +rule: the outermost region belongs to the public entry point, ne=
ver to<br>
&gt; &gt; +an internal helper.<br>
&gt; &gt; +<br>
&gt; &gt; +The documented behaviour (notifications arrive before the outerm=
ost<br>
&gt; &gt; +c-ares call returns) does not change, so no man page changes.<br=
>
&gt; &gt; +<br>
&gt; &gt; +Two new `LibraryTest` cases in `test/ares-test-mock.cc`. The IPv=
6 server<br>
&gt; &gt; +cannot get a socket, so the first send fails over to the IPv4 se=
rver,<br>
&gt; &gt; +and a server-state callback then reconfigures the servers:<br>
&gt; &gt; +<br>
&gt; &gt; +- `ServerFailoverDuringGetAddrInfo`: the lookup completes cleanl=
y. It<br>
&gt; &gt; +fails under ASAN without this change.<br>
&gt; &gt; +- `ServerFailoverDuringQuery`: the query id from `ares_query_dns=
rec()`<br>
&gt; &gt; +is already reported by the time the query callback runs. It fail=
s<br>
&gt; &gt; +without this change.<br>
&gt; &gt; +<br>
&gt; &gt; +The full non-live suite passes under ASAN/UBSAN and with<br>
&gt; &gt; +`-DCARES_WERROR=3DON`.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Brad House &lt;<a href=3D"mailto:brad@brad-house.=
com" target=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/c-ares/=
c-" rel=3D"noreferrer" target=3D"_blank">https://github.com/c-ares/c-</a><b=
r>
&gt; ares/commit/f944c4718fd672c9c0befd65a340abb2ccfc1a31]<br>
&gt; &gt; +GHSA: GHSA-wpr3-8q3r-4q8c, GHSA-97vq-4mxv-7vhm, GHSA-mw23-pfg6-<=
br>
&gt; 2x9r, GHSA-rf6g-ww74-97qh, GHSA-v33j-65h4-4ch8, GHSA-pj7p-v3cw-hq66<br=
>
&gt; &gt; +---<br>
&gt; &gt; + src/lib/ares_conn.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +-<br>
&gt; &gt; + src/lib/ares_getaddrinfo.c=C2=A0 =C2=A0|=C2=A0 =C2=A05 ++<br>
&gt; &gt; + src/lib/ares_gethostbyaddr.c |=C2=A0 =C2=A05 ++<br>
&gt; &gt; + src/lib/ares_getnameinfo.c=C2=A0 =C2=A0|=C2=A0 =C2=A05 ++<br>
&gt; &gt; + src/lib/ares_private.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +++=
+<br>
&gt; &gt; + src/lib/ares_process.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
6 ++<br>
&gt; &gt; + src/lib/ares_query.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A05 ++<br>
&gt; &gt; + src/lib/ares_search.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +++=
+<br>
&gt; &gt; + src/lib/ares_send.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1=
3 ++++-<br>
&gt; &gt; + test/ares-test-mock.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0| 106 ++++++++=
+++++++++++++++++++++++++++<br>
&gt; &gt; + 10 files changed, 166 insertions(+), 3 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c<br>
&gt; &gt; +index 78f57e7d10..4cc0d1871d 100644<br>
&gt; &gt; +--- a/src/lib/ares_conn.c<br>
&gt; &gt; ++++ b/src/lib/ares_conn.c<br>
&gt; &gt; +@@ -94,7 +94,9 @@ static void ares_deferred_cb_flush(ares_channe=
l_t<br>
&gt; *channel)<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0/* Only the outermost frame delivers: anything abov=
e us on the stack may<br>
&gt; &gt; +=C2=A0 =C2=A0 * still be holding the connection a reentrant call=
 from one of these<br>
&gt; &gt; +-=C2=A0 =C2=A0* callbacks could free.<br>
&gt; &gt; ++=C2=A0 =C2=A0* callbacks could free, or lookup state of its own=
 that a callback could<br>
&gt; &gt; ++=C2=A0 =C2=A0* end.=C2=A0 That is why the outermost frame belon=
gs to the public entry point<br>
&gt; &gt; ++=C2=A0 =C2=A0* and never to an internal helper; see ares_deferr=
ed_cb_enter().<br>
&gt; &gt; +=C2=A0 =C2=A0 *<br>
&gt; &gt; +=C2=A0 =C2=A0 * The dispatch below counts as a nesting level of =
its own.=C2=A0 Without that, a<br>
&gt; &gt; +=C2=A0 =C2=A0 * callback that calls back into the library re-ent=
ers here through the<br>
&gt; &gt; +diff --git a/src/lib/ares_getaddrinfo.c b/src/lib/ares_getaddrin=
fo.c<br>
&gt; &gt; +index 6d9e21af4b..5d9ddb311e 100644<br>
&gt; &gt; +--- a/src/lib/ares_getaddrinfo.c<br>
&gt; &gt; ++++ b/src/lib/ares_getaddrinfo.c<br>
&gt; &gt; +@@ -762,7 +762,12 @@ void ares_getaddrinfo(ares_channel_t *chann=
el,<br>
&gt; const char *name,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_lock(channel);<br>
&gt; &gt; ++=C2=A0 /* Notifications raised along the way are delivered once=
 this whole call<br>
&gt; &gt; ++=C2=A0 =C2=A0* has unwound, not from inside the internals it ru=
ns.=C2=A0 See<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_deferred_cb_enter(). */<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_getaddrinfo_int(channel, name, service, hints,=
 callback, arg);<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_unlock(channel);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/lib/ares_gethostbyaddr.c b/src/lib/ares_gethost=
byaddr.c<br>
&gt; &gt; +index 69c509ab11..b314359331 100644<br>
&gt; &gt; +--- a/src/lib/ares_gethostbyaddr.c<br>
&gt; &gt; ++++ b/src/lib/ares_gethostbyaddr.c<br>
&gt; &gt; +@@ -112,7 +112,12 @@ void ares_gethostbyaddr(ares_channel_t *cha=
nnel,<br>
&gt; const void *addr, int addrlen,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_lock(channel);<br>
&gt; &gt; ++=C2=A0 /* Notifications raised along the way are delivered once=
 this whole call<br>
&gt; &gt; ++=C2=A0 =C2=A0* has unwound, not from inside the internals it ru=
ns.=C2=A0 See<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_deferred_cb_enter(). */<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_gethostbyaddr_nolock(channel, addr, addrlen, f=
amily, callback, arg);<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_unlock(channel);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/lib/ares_getnameinfo.c b/src/lib/ares_getnamein=
fo.c<br>
&gt; &gt; +index 0159354530..7365e9ed82 100644<br>
&gt; &gt; +--- a/src/lib/ares_getnameinfo.c<br>
&gt; &gt; ++++ b/src/lib/ares_getnameinfo.c<br>
&gt; &gt; +@@ -194,7 +194,12 @@ void ares_getnameinfo(ares_channel_t *chann=
el,<br>
&gt; const struct sockaddr *sa,<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_lock(channel);<br>
&gt; &gt; ++=C2=A0 /* Notifications raised along the way are delivered once=
 this whole call<br>
&gt; &gt; ++=C2=A0 =C2=A0* has unwound, not from inside the internals it ru=
ns.=C2=A0 See<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_deferred_cb_enter(). */<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_getnameinfo_int(channel, sa, salen, flags_int,=
 callback, arg);<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_unlock(channel);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/lib/ares_private.h b/src/lib/ares_private.h<br>
&gt; &gt; +index 0a1029e0f8..9610ba7dab 100644<br>
&gt; &gt; +--- a/src/lib/ares_private.h<br>
&gt; &gt; ++++ b/src/lib/ares_private.h<br>
&gt; &gt; +@@ -676,6 +676,16 @@ void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares=
_server_reap(ares_server_t *server);<br>
&gt; &gt; +=C2=A0 *=C2=A0 Nesting is counted; queued notifications are deli=
vered by the outermost<br>
&gt; &gt; +=C2=A0 *=C2=A0 leave.<br>
&gt; &gt; +=C2=A0 *<br>
&gt; &gt; ++ *=C2=A0 The outermost region must be opened by the public entr=
y point itself<br>
&gt; &gt; ++ *=C2=A0 (ares_send_dnsrec(), ares_query_dnsrec(), ares_search(=
),<br>
&gt; ares_getaddrinfo(),<br>
&gt; &gt; ++ *=C2=A0 ares_process_fds(), ares_set_servers_*(), ...), with t=
he channel lock<br>
&gt; &gt; ++ *=C2=A0 held, around everything it does.=C2=A0 Internal helper=
s such as<br>
&gt; &gt; ++ *=C2=A0 ares_send_nolock() open nested regions of their own, b=
ut their callers<br>
&gt; &gt; ++ *=C2=A0 often keep using lookup state afterwards -- a host or =
search query, a<br>
&gt; &gt; ++ *=C2=A0 query id out-pointer -- that a callback reentering the=
 library may end<br>
&gt; &gt; ++ *=C2=A0 and free.=C2=A0 If such a helper were the outermost re=
gion, its leave would<br>
&gt; &gt; ++ *=C2=A0 run the callbacks while that state is still in use.<br=
>
&gt; &gt; ++ *<br>
&gt; &gt; +=C2=A0 *=C2=A0 \param[in] channel=C2=A0 Initialized ares channel=
.<br>
&gt; &gt; +=C2=A0 */<br>
&gt; &gt; + void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_deferred_cb_enter(a=
res_channel_t *channel);<br>
&gt; &gt; +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c<br>
&gt; &gt; +index 82f53610fb..1569408b1b 100644<br>
&gt; &gt; +--- a/src/lib/ares_process.c<br>
&gt; &gt; ++++ b/src/lib/ares_process.c<br>
&gt; &gt; +@@ -490,6 +490,11 @@ void ares_process_pending_write(ares_channe=
l_t<br>
&gt; *channel)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* A failed flush closes the connection and fails its qu=
eries over, which<br>
&gt; &gt; ++=C2=A0 =C2=A0* notifies.=C2=A0 Deliver once we are done walking=
 the servers, and keep<br>
&gt; &gt; ++=C2=A0 =C2=A0* anything unlinked meanwhile readable until then.=
 */<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0/* Set as untriggerd before calling into ares_conn_=
flush(), this is<br>
&gt; &gt; +=C2=A0 =C2=A0 * because its possible ares_conn_flush() might cau=
se additional data to<br>
&gt; &gt; +=C2=A0 =C2=A0 * be enqueued if there is some form of exception s=
o it will need to recurse.<br>
&gt; &gt; +@@ -513,6 +518,7 @@ void ares_process_pending_write(ares_channel=
_t<br>
&gt; *channel)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_unlock(channel);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/lib/ares_query.c b/src/lib/ares_query.c<br>
&gt; &gt; +index ca3b6a9b73..0cf7f70760 100644<br>
&gt; &gt; +--- a/src/lib/ares_query.c<br>
&gt; &gt; ++++ b/src/lib/ares_query.c<br>
&gt; &gt; +@@ -125,7 +125,12 @@ ares_status_t ares_query_dnsrec(ares_channe=
l_t<br>
&gt; *channel, const char *name,<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_lock(channel);<br>
&gt; &gt; ++=C2=A0 /* Notifications raised along the way are delivered once=
 this whole call<br>
&gt; &gt; ++=C2=A0 =C2=A0* has unwound, not from inside the internals it ru=
ns.=C2=A0 See<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_deferred_cb_enter(). */<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0status =3D ares_query_nolock(channel, name, dnsclas=
s, type, callback, arg,<br>
&gt; qid);<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_unlock(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0return status;<br>
&gt; &gt; + }<br>
&gt; &gt; +diff --git a/src/lib/ares_search.c b/src/lib/ares_search.c<br>
&gt; &gt; +index c605caf42c..ebc3d91e20 100644<br>
&gt; &gt; +--- a/src/lib/ares_search.c<br>
&gt; &gt; ++++ b/src/lib/ares_search.c<br>
&gt; &gt; +@@ -463,7 +463,12 @@ void ares_search(ares_channel_t *channel, c=
onst<br>
&gt; char *name, int dnsclass,<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_lock(channel);<br>
&gt; &gt; ++=C2=A0 /* Notifications raised along the way are delivered once=
 this whole call<br>
&gt; &gt; ++=C2=A0 =C2=A0* has unwound, not from inside the internals it ru=
ns.=C2=A0 See<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_deferred_cb_enter(). */<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_search_int(channel, dnsrec, ares_dnsrec_conver=
t_cb, carg);<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_unlock(channel);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_dns_record_destroy(dnsrec);<br>
&gt; &gt; +@@ -481,7 +486,12 @@ ares_status_t ares_search_dnsrec(ares_chann=
el_t<br>
&gt; *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_lock(channel);<br>
&gt; &gt; ++=C2=A0 /* Notifications raised along the way are delivered once=
 this whole call<br>
&gt; &gt; ++=C2=A0 =C2=A0* has unwound, not from inside the internals it ru=
ns.=C2=A0 See<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_deferred_cb_enter(). */<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0status =3D ares_search_int(channel, dnsrec, callbac=
k, arg);<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_unlock(channel);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0return status;<br>
&gt; &gt; +diff --git a/src/lib/ares_send.c b/src/lib/ares_send.c<br>
&gt; &gt; +index 2e0482bf19..dd4a28544b 100644<br>
&gt; &gt; +--- a/src/lib/ares_send.c<br>
&gt; &gt; ++++ b/src/lib/ares_send.c<br>
&gt; &gt; +@@ -246,8 +246,12 @@ ares_status_t ares_send_nolock(ares_channel=
_t<br>
&gt; *channel, ares_server_t *server,<br>
&gt; &gt; +=C2=A0 =C2=A0/* Perform the first query action. */<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* Sending opens and writes to connections and can =
mark a server down,<br>
&gt; both<br>
&gt; &gt; +-=C2=A0 =C2=A0* of which notify.=C2=A0 Deliver those once we are=
 done with the connection and<br>
&gt; &gt; +-=C2=A0 =C2=A0* the server, not part-way through. */<br>
&gt; &gt; ++=C2=A0 =C2=A0* of which notify.=C2=A0 This bracket keeps any co=
nnection or server unlinked<br>
&gt; &gt; ++=C2=A0 =C2=A0* during the send readable until it returns.=C2=A0=
 It is never the outermost<br>
&gt; &gt; ++=C2=A0 =C2=A0* one: every public entry point that can get here,=
 and query processing,<br>
&gt; &gt; ++=C2=A0 =C2=A0* holds its own, so delivery waits until the calle=
r -- which may still be<br>
&gt; &gt; ++=C2=A0 =C2=A0* holding its own lookup state, as ares_getaddrinf=
o() does -- has unwound<br>
&gt; &gt; ++=C2=A0 =C2=A0* too. */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_deferred_cb_enter(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0status =3D ares_send_query(server, query, &amp;now)=
;<br>
&gt; &gt; +=C2=A0 =C2=A0ares_deferred_cb_leave(channel);<br>
&gt; &gt; +@@ -271,9 +275,14 @@ ares_status_t ares_send_dnsrec(ares_channel=
_t<br>
&gt; *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_lock(channel);<br>
&gt; &gt; ++=C2=A0 /* Notifications raised along the way are delivered once=
 this whole call<br>
&gt; &gt; ++=C2=A0 =C2=A0* has unwound, not from inside the internals it ru=
ns.=C2=A0 See<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_deferred_cb_enter(). */<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_enter(channel);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0status =3D ares_send_nolock(channel, NULL, 0, dnsre=
c, callback, arg, qid);<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 ares_deferred_cb_leave(channel);<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_unlock(channel);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0return status;<br>
&gt; &gt; +diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc<br>
&gt; &gt; +index 2158c5a913..b848c02434 100644<br>
&gt; &gt; +--- a/test/ares-test-mock.cc<br>
&gt; &gt; ++++ b/test/ares-test-mock.cc<br>
&gt; &gt; +@@ -2533,6 +2533,112 @@ TEST_F(LibraryTest,<br>
&gt; ReconfigureInSockStateCallbackNoUseAfterFree) {<br>
&gt; &gt; +=C2=A0 =C2=A0data.channel =3D nullptr; /* don&#39;t reconfigure =
from teardown notifications */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_destroy(chan);<br>
&gt; &gt; + }<br>
&gt; &gt; ++// Server-state notifications raised while a public call is iss=
uing its first<br>
&gt; &gt; ++// request must not be delivered until that whole call has unwo=
und.=C2=A0 A<br>
&gt; &gt; ++// failover handler that reconfigures the servers ends the in-f=
light request,<br>
&gt; &gt; ++// and with it the state the issuing call still has to finish w=
ith.=C2=A0 The IPv6<br>
&gt; &gt; ++// server cannot get a socket, so the first send fails over to =
the IPv4 one<br>
&gt; &gt; ++// and queues a failure notification for the handler below.<br>
&gt; &gt; ++static ares_socket_t FailoverNoIPv6Socket(int af, int type, int=
 protocol,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 void *user_data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 (void)user_data;<br>
&gt; &gt; ++=C2=A0 if (af =3D=3D AF_INET6) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_SOCKET_BAD;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 return socket(af, type, protocol);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void FailoverOnServerDown(const char *server_string, are=
s_bool_t<br>
&gt; success,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int flags, void *dat=
a)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 (void)server_string;<br>
&gt; &gt; ++=C2=A0 (void)flags;<br>
&gt; &gt; ++=C2=A0 if (!success) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_set_servers_csv(static_cast&lt;ares_channel_=
t *&gt;(data),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://127.0.0.1:53063" rel=3D"=
noreferrer" target=3D"_blank">127.0.0.1:53063</a>&quot;);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static ares_channel_t *FailoverChannel(ares_socket_functions *f=
uncs)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0*chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 struct ares_options opts;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 opts.tries =3D 1;<br>
&gt; &gt; ++=C2=A0 opts.flags =3D ARES_FLAG_NOSEARCH;<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_init_options(&am=
p;chan, &amp;opts, ARES_OPT_TRIES |<br>
&gt; ARES_OPT_FLAGS));<br>
&gt; &gt; ++=C2=A0 if (chan =3D=3D nullptr) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return nullptr;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_set_servers_csv(=
chan, &quot;[::1]:53061,<a href=3D"http://127.0.0.1:53062" rel=3D"noreferre=
r" target=3D"_blank">127.0.0.1:53062</a>&quot;));<br>
&gt; &gt; ++=C2=A0 ares_set_server_state_callback(chan, FailoverOnServerDow=
n, chan);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(funcs, 0, sizeof(*funcs));<br>
&gt; &gt; ++=C2=A0 funcs-&gt;asocket =3D FailoverNoIPv6Socket;<br>
&gt; &gt; ++=C2=A0 ares_set_socket_functions(chan, funcs, NULL);<br>
&gt; &gt; ++=C2=A0 return chan;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, ServerFailoverDuringGetAddrInfo) {<br>
&gt; &gt; ++=C2=A0 ares_socket_functions=C2=A0 =C2=A0 =C2=A0 funcs;<br>
&gt; &gt; ++=C2=A0 struct ares_addrinfo_hints hints;<br>
&gt; &gt; ++=C2=A0 AddrInfoResult=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0result;<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
*chan =3D FailoverChannel(&amp;funcs);<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, chan);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;hints, 0, sizeof(hints));<br>
&gt; &gt; ++=C2=A0 hints.ai_family =3D AF_INET;<br>
&gt; &gt; ++=C2=A0 ares_getaddrinfo(chan, &quot;<a href=3D"http://www.googl=
e.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, NULL,=
 &amp;hints, AddrInfoCallback,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;result);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_cancel(chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(result.done_);<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Same, through ares_query_dnsrec(): the query id must already=
 have been<br>
&gt; &gt; ++// reported to the caller by the time the query can complete.<b=
r>
&gt; &gt; ++struct FailoverQueryData {<br>
&gt; &gt; ++=C2=A0 unsigned short qid;<br>
&gt; &gt; ++=C2=A0 unsigned short qid_at_callback;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void FailoverQueryCallback(void *data, ares_status_t sta=
tus,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_dns_reco=
rd_t *dnsrec)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 FailoverQueryData *d =3D static_cast&lt;FailoverQueryDat=
a *&gt;(data);<br>
&gt; &gt; ++=C2=A0 (void)status;<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 d-&gt;qid_at_callback =3D d-&gt;qid;<br>
&gt; &gt; ++=C2=A0 d-&gt;done=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
true;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, ServerFailoverDuringQuery) {<br>
&gt; &gt; ++=C2=A0 ares_socket_functions funcs;<br>
&gt; &gt; ++=C2=A0 FailoverQueryData=C2=A0 =C2=A0 =C2=A0data;<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0*chan =3D Failo=
verChannel(&amp;funcs);<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, chan);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.qid=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0;<br>
&gt; &gt; ++=C2=A0 data.qid_at_callback =3D 0;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D f=
alse;<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_query_dnsrec(cha=
n, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" target=3D"_bl=
ank">www.google.com</a>&quot;, ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_REC_TYPE_A, FailoverQueryCal=
lback, &amp;data,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;data.qid));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(data.qid, data.qid_at_callback);<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; +<br>
&gt; &gt; + // Deferring the notifications must not lose them: every public=
 entry point<br>
&gt; &gt; + // that closes a socket still has to tell the application about=
 it before it<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/c-ares/c-ares/0003-ares_qcac=
he-hand-<br>
&gt; callbacks-their-own-copy.patch b/meta-oe/recipes-support/c-ares/c-ares=
/0003-<br>
&gt; ares_qcache-hand-callbacks-their-own-copy.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..02039e92e0<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-support/c-ares/c-ares/0003-ares_qcache-hand=
-<br>
&gt; callbacks-their-own-copy.patch<br>
&gt; &gt; @@ -0,0 +1,1054 @@<br>
&gt; &gt; +From a21160045f9d7039225fa285be7cb1b02173a3a5 Mon Sep 17 00:00:0=
0<br>
&gt; 2001<br>
&gt; &gt; +From: Brad House &lt;<a href=3D"mailto:brad@brad-house.com" targ=
et=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Date: Sun, 18 Oct 2026 22:12:09 -0400<br>
&gt; &gt; +Subject: [PATCH] [Backport v1.34] ares_qcache: hand callbacks th=
eir own<br>
&gt; copy<br>
&gt; &gt; + of a cached answer (#1339)<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +Backport of 31e2f51e8715d418fa8272a6c3a1ee651917fec5 (`ares_qcac=
he:<br>
&gt; hand<br>
&gt; &gt; +callbacks their own copy of a cached answer`) to `v1.34`. See th=
at<br>
&gt; &gt; +commit for the full description.<br>
&gt; &gt; +<br>
&gt; &gt; +**Conflicts:**<br>
&gt; &gt; +- `ares_private.h`: alignment only; formatted with `v1.34`&#39;s=
<br>
&gt; &gt; +`.clang-format`.<br>
&gt; &gt; +- `test/ares-test-internal.cc`: context only =E2=80=94 on `main`=
 the new<br>
&gt; &gt; +`QcacheKeyDistinguishesQuestions` test follows the IDNA/punycode=
 tests<br>
&gt; &gt; +(#1031), which are not on `v1.34`, so it is placed after the URI=
 test<br>
&gt; &gt; +instead.<br>
&gt; &gt; +<br>
&gt; &gt; +**Test fixes from #1334:** carries the part of #1334 that applie=
s to the<br>
&gt; &gt; +tests this introduces =E2=80=94 `ReentrantFlushInCallbackNoUseAf=
terFree`<br>
&gt; &gt; +reconfigures to `127.0.0.1:53055` instead of `127.0.0.55` (only =
routable<br>
&gt; &gt; +on Linux), and `UnknownQueryTypesDoNotShareCacheEntries` drops<b=
r>
&gt; &gt; +`static_cast&lt;ns_type&gt;`, which does not compile on OpenBSD.=
<br>
&gt; &gt; +<br>
&gt; &gt; +Test file contents match `main`. Independent of the dd62bdfc bac=
kport<br>
&gt; &gt; +(#1338); applies cleanly with or without it.<br>
&gt; &gt; +<br>
&gt; &gt; +The full non-live suite passes 650/650 under ASAN+UBSAN and with=
<br>
&gt; &gt; +`-DCARES_WERROR=3DON` on macOS.<br>
&gt; `ReentrantFlushInCallbackNoUseAfterFree`<br>
&gt; &gt; +is a heap-use-after-free in `ares_dns_record_rr_cnt()` on `v1.34=
`<br>
&gt; &gt; +without this change, and passes with it.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Brad House &lt;<a href=3D"mailto:brad@brad-house.=
com" target=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/c-ares/=
c-" rel=3D"noreferrer" target=3D"_blank">https://github.com/c-ares/c-</a><b=
r>
&gt; ares/commit/a21160045f9d7039225fa285be7cb1b02173a3a5]<br>
&gt; &gt; +GHSA: GHSA-grv7-fq5q-9vfc, GHSA-wrgc-prmw-27xh<br>
&gt; &gt; +---<br>
&gt; &gt; + docs/ares_init_options.3=C2=A0 =C2=A0|=C2=A0 11 +-<br>
&gt; &gt; + src/lib/ares_private.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 44 +++-<br>
&gt; &gt; + src/lib/ares_process.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt; + src/lib/ares_qcache.c=C2=A0 =C2=A0 =C2=A0 | 212 +++++++++++++++=
+---<br>
&gt; &gt; + src/lib/ares_send.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 47 ++++-=
<br>
&gt; &gt; + test/ares-test-internal.cc |=C2=A0 54 +++++<br>
&gt; &gt; + test/ares-test-mock.cc=C2=A0 =C2=A0 =C2=A0| 419 +++++++++++++++=
++++++++++++++++++++++<br>
&gt; &gt; + 7 files changed, 743 insertions(+), 45 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/docs/ares_init_options.3 b/docs/ares_init_options.3=
<br>
&gt; &gt; +index e6f6ee8ba6..1ce7fb8e30 100644<br>
&gt; &gt; +--- a/docs/ares_init_options.3<br>
&gt; &gt; ++++ b/docs/ares_init_options.3<br>
&gt; &gt; +@@ -324,7 +324,16 @@ with the maximum number of seconds a query =
result<br>
&gt; may be cached which will<br>
&gt; &gt; + override a larger TTL in the response message. This must be a n=
on-zero<br>
&gt; value<br>
&gt; &gt; + otherwise the cache will be disabled. Choose a reasonable value=
 for your<br>
&gt; &gt; + application such as 300 (5 minutes) or 3600 (1 hour).=C2=A0 The=
 query cache is<br>
&gt; &gt; +-automatically flushed if a server configuration change is made.=
<br>
&gt; &gt; ++automatically flushed if a server configuration change is made.=
=C2=A0 As of c-ares<br>
&gt; &gt; ++1.35.0, and c-ares 1.34.9 on the 1.34 branch, a cached answer r=
eports its<br>
&gt; &gt; ++remaining time to live rather than the<br>
&gt; &gt; ++original value received from the server, so TTLs returned on a =
cache hit<br>
&gt; &gt; ++decrease as the entry ages.=C2=A0 Two lookups share a cached an=
swer only if their<br>
&gt; &gt; ++EDNS state matches: the version, the flag bits including DNSSEC=
 OK, and<br>
&gt; every<br>
&gt; &gt; ++EDNS option other than the DNS cookie and the advertised UDP pa=
yload<br>
&gt; size,<br>
&gt; &gt; ++which are both ignored.=C2=A0 Options are compared in the order=
 the application<br>
&gt; &gt; ++added them.=C2=A0 An application that attaches its own options =
and varies them<br>
&gt; &gt; ++between otherwise identical lookups gets a separate cache entry=
 for each.<br>
&gt; &gt; + .br<br>
&gt; &gt; + .TP 18<br>
&gt; &gt; + .B ARES_OPT_EVENT_THREAD<br>
&gt; &gt; +diff --git a/src/lib/ares_private.h b/src/lib/ares_private.h<br>
&gt; &gt; +index 9610ba7dab..dd06d303b8 100644<br>
&gt; &gt; +--- a/src/lib/ares_private.h<br>
&gt; &gt; ++++ b/src/lib/ares_private.h<br>
&gt; &gt; +@@ -153,6 +153,9 @@ struct ares_query {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_timeval_t=C2=A0 =C2=A0 =C2=A0 =C2=A0ts; /*!&lt=
; Timestamp query was sent */<br>
&gt; &gt; +=C2=A0 =C2=A0ares_timeval_t=C2=A0 =C2=A0 =C2=A0 =C2=A0timeout;<b=
r>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_t=C2=A0 =C2=A0 =C2=A0 *channel;<br>
&gt; &gt; ++=C2=A0 /*! Query cache key, derived from the caller&#39;s reque=
st before the send path<br>
&gt; &gt; ++=C2=A0 =C2=A0*=C2=A0 can mutate query-&gt;query.=C2=A0 NULL whe=
n the cache is disabled. */<br>
&gt; &gt; ++=C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *qcache_key;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/*<br>
&gt; &gt; +=C2=A0 =C2=A0 * Node object for each list entry the query belong=
s to in order to<br>
&gt; &gt; +@@ -718,14 +721,47 @@ ares_status_t<br>
&gt; ares_qcache_create(ares_rand_state *rand_state,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int=C2=A0 =
=C2=A0 =C2=A0max_ttl,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_qcache_t=C2=A0=
 **cache_out);<br>
&gt; &gt; + void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_qcache_flush(ares_q=
cache_t *cache);<br>
&gt; &gt; ++/*! Derive the query cache key for a request.=C2=A0 Caller owns=
 the result.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in] dnsrec=C2=A0 Request to derive the key from=
.<br>
&gt; &gt; ++ *=C2=A0 \return allocated key, or NULL on failure.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ares_qcache_calc_key(con=
st ares_dns_record_t *dnsrec);<br>
&gt; &gt; ++<br>
&gt; &gt; ++/*! Insert a response into the query cache.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in] channel=C2=A0 Initialized channel object.<b=
r>
&gt; &gt; ++ *=C2=A0 \param[in] now=C2=A0 =C2=A0 =C2=A0 Current timestamp.<=
br>
&gt; &gt; ++ *=C2=A0 \param[in] query=C2=A0 =C2=A0 Query the response answe=
rs.=C2=A0 Its cache key, derived<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 when the query was created, becomes the entry key; a<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 NULL key means caching is switched off.<br>
&gt; &gt; ++ *=C2=A0 \param[in] dnsrec=C2=A0 =C2=A0Response to cache.=C2=A0=
 Duplicated internally; the caller<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 retains ownership.<br>
&gt; &gt; ++ *=C2=A0 \return ARES_SUCCESS if cached, ARES_ENOTIMP if cachin=
g is off or<br>
&gt; the<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 response is not cacheable,=
 otherwise another status.<br>
&gt; &gt; ++ */<br>
&gt; &gt; + ares_status_t ares_qcache_insert(ares_channel_t=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_timeval_=
t=C2=A0 =C2=A0 *now,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_query_t=
=C2=A0 =C2=A0 =C2=A0 *query,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_dns_reco=
rd_t *dnsrec);<br>
&gt; &gt; +-ares_status_t ares_qcache_fetch(ares_channel_t=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*channel,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_timeval_t=C2=A0=
 =C2=A0 =C2=A0*now,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_dns_record_t=C2=
=A0 *dnsrec,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_dns_record_t **=
dnsrec_resp);<br>
&gt; &gt; ++/*! Fetch a cached answer for a request.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in]=C2=A0 channel=C2=A0 =C2=A0 =C2=A0 Initializ=
ed channel object.<br>
&gt; &gt; ++ *=C2=A0 \param[in]=C2=A0 now=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Current timestamp.<br>
&gt; &gt; ++ *=C2=A0 \param[in]=C2=A0 key=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Cache key for the request, as produced by<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_qcache_calc_key().=C2=A0 Owned b=
y the caller.<br>
&gt; &gt; ++ *=C2=A0 \param[out] dnsrec_resp=C2=A0 On ARES_SUCCESS, the cac=
hed answer,<br>
&gt; owned by the<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0caller and destroyed with<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_dns_record_destroy().=C2=A0 Set =
to NULL on any<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0other status, except ARES_EFORMERR, w=
hich is<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0returned by the argument check before=
 this is<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touched.<br>
&gt; &gt; ++ *=C2=A0 \return ARES_SUCCESS on a hit, ARES_ENOTFOUND on a mis=
s,<br>
&gt; ARES_EFORMERR on<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invalid arguments.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++ares_status_t ares_qcache_fetch(ares_channel_t=C2=A0 =C2=A0 =C2=
=A0 =C2=A0*channel,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_timeval_t *now,=
 const char *key,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_record_t **dnsrec=
_resp);<br>
&gt; &gt; +<br>
&gt; &gt; + void=C2=A0 =C2=A0ares_metrics_record(const ares_query_t *query,=
 ares_server_t *server,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_status_t status, const ares_dns_rec=
ord_t *dnsrec);<br>
&gt; &gt; +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c<br>
&gt; &gt; +index 1569408b1b..88536704ad 100644<br>
&gt; &gt; +--- a/src/lib/ares_process.c<br>
&gt; &gt; ++++ b/src/lib/ares_process.c<br>
&gt; &gt; +@@ -1859,6 +1859,7 @@ void ares_free_query(ares_query_t *query)<=
br>
&gt; &gt; +=C2=A0 =C2=A0query-&gt;arg=C2=A0 =C2=A0 =C2=A0 =3D NULL;<br>
&gt; &gt; +=C2=A0 =C2=A0/* Deallocate the memory associated with the query =
*/<br>
&gt; &gt; +=C2=A0 =C2=A0ares_dns_record_destroy(query-&gt;query);<br>
&gt; &gt; ++=C2=A0 ares_free(query-&gt;qcache_key);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_free(query);<br>
&gt; &gt; + }<br>
&gt; &gt; +diff --git a/src/lib/ares_qcache.c b/src/lib/ares_qcache.c<br>
&gt; &gt; +index ad3bc83505..f48669b56c 100644<br>
&gt; &gt; +--- a/src/lib/ares_qcache.c<br>
&gt; &gt; ++++ b/src/lib/ares_qcache.c<br>
&gt; &gt; +@@ -38,7 +38,7 @@ typedef struct {<br>
&gt; &gt; +=C2=A0 =C2=A0time_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0insert_ts;<br>
&gt; &gt; + } ares_qcache_entry_t;<br>
&gt; &gt; +<br>
&gt; &gt; +-static char *ares_qcache_calc_key(const ares_dns_record_t *dnsr=
ec)<br>
&gt; &gt; ++char *ares_qcache_calc_key(const ares_dns_record_t *dnsrec)<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_buf_t=C2=A0 =C2=A0 =C2=A0 *buf =3D ares_buf_cr=
eate();<br>
&gt; &gt; +=C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i;<b=
r>
&gt; &gt; +@@ -49,7 +49,22 @@ static char *ares_qcache_calc_key(const<br>
&gt; ares_dns_record_t *dnsrec)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return NULL; /* LCOV_EXCL_LINE: DefensiveCod=
ing */<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 /* Format is OPCODE|FLAGS[|QTYPE1|QCLASS1|QNAME1]... */<=
br>
&gt; &gt; ++=C2=A0 /* Format is<br>
&gt; &gt; ++=C2=A0 =C2=A0*<br>
&gt; OPCODE|FLAGS[|EDNS|VER|FLAGS[|ID:HEX]...]|QDCOUNT[|TYPE|CLASS|LEN:<br>
&gt; QNAME]...<br>
&gt; &gt; ++=C2=A0 =C2=A0*<br>
&gt; &gt; ++=C2=A0 =C2=A0* The EDNS section matters: an answer fetched unde=
r one set of EDNS<br>
&gt; options<br>
&gt; &gt; ++=C2=A0 =C2=A0* is not interchangeable with one fetched under an=
other.=C2=A0 A request with no<br>
&gt; &gt; ++=C2=A0 =C2=A0* OPT record appends nothing; note that EDNS is on=
 by default, so ordinary<br>
&gt; &gt; ++=C2=A0 =C2=A0* lookups do carry one and their keys did change w=
ith this.<br>
&gt; &gt; ++=C2=A0 =C2=A0*<br>
&gt; &gt; ++=C2=A0 =C2=A0* Everything a caller does not control is emitted =
before the questions, so<br>
&gt; &gt; ++=C2=A0 =C2=A0* the names are always last.=C2=A0 A name reaches =
the key unescaped, so<br>
&gt; anything<br>
&gt; &gt; ++=C2=A0 =C2=A0* keyed after it could otherwise be imitated by a =
name containing that same<br>
&gt; &gt; ++=C2=A0 =C2=A0* text, giving two different requests one key.=C2=
=A0 The question count is part<br>
&gt; &gt; ++=C2=A0 =C2=A0* of that: without it, a request with two question=
s and a request with one<br>
&gt; &gt; ++=C2=A0 =C2=A0* whose name spells out the second produce identic=
al keys.=C2=A0 Each name is<br>
&gt; &gt; ++=C2=A0 =C2=A0* also length-prefixed, so adjacent names cannot b=
e made to run together<br>
&gt; &gt; ++=C2=A0 =C2=A0* even when the question counts match. */<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0status =3D ares_buf_append_str(<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0buf, ares_dns_opcode_tostr(ares_dns_record_g=
et_opcode(dnsrec)));<br>
&gt; &gt; +@@ -63,7 +78,11 @@ static char *ares_qcache_calc_key(const<br>
&gt; ares_dns_record_t *dnsrec)<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0flags =3D ares_dns_record_get_flags(dnsrec);<br>
&gt; &gt; +-=C2=A0 /* Only care about RD and CD */<br>
&gt; &gt; ++=C2=A0 /* RD, CD and AD.=C2=A0 AD is here because RFC 6840 sect=
ion 5.7 defines it in a<br>
&gt; &gt; ++=C2=A0 =C2=A0* request as a signal that the requester wants the=
 AD bit evaluated in the<br>
&gt; &gt; ++=C2=A0 =C2=A0* response, and section 5.8 says a validating reso=
lver should only set AD<br>
&gt; &gt; ++=C2=A0 =C2=A0* in a response when the request carried DO or AD =
-- so an answer fetched<br>
&gt; &gt; ++=C2=A0 =C2=A0* without it can legitimately differ from one fetc=
hed with it. */<br>
&gt; &gt; +=C2=A0 =C2=A0if (flags &amp; ARES_FLAG_RD) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0status =3D ares_buf_append_str(buf, &quot;rd=
&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; +@@ -76,6 +95,95 @@ static char *ares_qcache_calc_key(const<br>
&gt; ares_dns_record_t *dnsrec)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail; /* LCOV_EXCL_LINE: OutOfMe=
mory */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; ++=C2=A0 if (flags &amp; ARES_FLAG_AD) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 status =3D ares_buf_append_str(buf, &quot;ad&quot=
;);<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 goto fail; /* LCOV_EXCL_LINE: OutOfMemory =
*/<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* EDNS state.=C2=A0 Skipped entirely when the request c=
arries no OPT record. */<br>
&gt; &gt; ++=C2=A0 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 const ares_dns_rr_t *opt =3D ares_dns_get_opt_rr_=
const(dnsrec);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (opt !=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 size_t opt_cnt =3D ares_dns_rr_get_opt_cnt=
(opt,<br>
&gt; ARES_RR_OPT_OPTIONS);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 size_t j;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 status =3D ares_buf_append_str(buf, &quot;=
|EDNS|&quot;);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail; /* LCOV_EXCL_LINE: OutOf=
Memory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 status =3D ares_buf_append_num_hex(<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf, ares_dns_rr_get_u8(opt, ARES_R=
R_OPT_VERSION), 0);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail; /* LCOV_EXCL_LINE: OutOf=
Memory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 status =3D ares_buf_append_byte(buf, &#39;=
|&#39;);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail; /* LCOV_EXCL_LINE: OutOf=
Memory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* Carries the DO bit, so a DNSSEC-aware r=
equest cannot be served an<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* answer that was fetched without it=
. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 status =3D ares_buf_append_num_hex(<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf, ares_dns_rr_get_u16(opt, ARES_=
RR_OPT_FLAGS), 0);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail; /* LCOV_EXCL_LINE: OutOf=
Memory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* The advertised UDP payload size is deli=
berately excluded: it<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* constrains how a response is trans=
ported, not what it says.=C2=A0 A server<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* that cannot fit the additional sec=
tion may omit it without setting<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* the TC bit (RFC 2181 section 9), s=
o two sizes can produce answers<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* that differ outside the answer sec=
tion; that is accepted here. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 for (j =3D 0; j &lt; opt_cnt; j++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 const unsigned char *val=C2=A0 =C2=
=A0 =C2=A0=3D NULL;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0val_len =3D 0;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned short=C2=A0 =C2=A0 =C2=A0 =
=C2=A0optid =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_rr_get_opt(opt, ARE=
S_RR_OPT_OPTIONS, j, &amp;val,<br>
&gt; &amp;val_len);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* DNS cookies are per-server trans=
port state and say nothing about<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the content of an answer.=
=C2=A0 A cookie c-ares adds never reaches here<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* -- ares_cookie_apply() writ=
es to query-&gt;query, after this key has<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* been derived -- so this onl=
y ever skips one the caller supplied. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (optid =3D=3D ARES_OPT_PARAM_COO=
KIE) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D ares_buf_append_byte(buf=
, &#39;|&#39;);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail; /* LCOV_EXCL_LINE=
: OutOfMemory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D ares_buf_append_num_hex(=
buf, optid, 0);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail; /* LCOV_EXCL_LINE=
: OutOfMemory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D ares_buf_append_byte(buf=
, &#39;:&#39;);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail; /* LCOV_EXCL_LINE=
: OutOfMemory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val !=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t k;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (k =3D 0; k &lt; val_len=
; k++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D ares_buf_a=
ppend_num_hex(buf, val[k], 2);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (status !=3D ARES_=
SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail; /* =
LCOV_EXCL_LINE: OutOfMemory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 status =3D ares_buf_append_byte(buf, &#39;|&#39;);<br>
&gt; &gt; ++=C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 goto fail; /* LCOV_EXCL_LINE: OutOfMemory */<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 status =3D ares_buf_append_num_dec(buf,<br>
&gt; ares_dns_record_query_cnt(dnsrec), 0);<br>
&gt; &gt; ++=C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 goto fail; /* LCOV_EXCL_LINE: OutOfMemory */<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0for (i =3D 0; i &lt; ares_dns_record_query_cnt(dnsr=
ec); i++) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0const char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
*name;<br>
&gt; &gt; +@@ -93,7 +201,13 @@ static char *ares_qcache_calc_key(const<br>
&gt; ares_dns_record_t *dnsrec)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail; /* LCOV_EXCL_LINE: OutOfMe=
mory */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 status =3D ares_buf_append_str(buf, ares_dns_rec_=
type_tostr(qtype));<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Numeric, not the mnemonic: ares_dns_rec_type_t=
ostr() returns<br>
&gt; &quot;UNKNOWN&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* for every type outside its table, and are=
s_dns_record_query_add() does<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* not validate the type, so any 16-bit valu=
e reaches here through the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* ordinary public API.=C2=A0 Two such looku=
ps -- LOC and DNAME, say -- would<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* otherwise key identically and be answered=
 with each other&#39;s records.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* The key only has to be injective, not rea=
dable. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 status =3D ares_buf_append_num_dec(buf, (size_t)q=
type, 0);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail; /* LCOV_EXCL_LINE: OutOfMe=
mory */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +@@ -103,7 +217,10 @@ static char *ares_qcache_calc_key(const<br>
&gt; ares_dns_record_t *dnsrec)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail; /* LCOV_EXCL_LINE: OutOfMe=
mory */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 status =3D ares_buf_append_str(buf, ares_dns_clas=
s_tostr(qclass));<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Numeric for the same reason.=C2=A0 ares_dns_re=
cord_query_add() does<br>
&gt; reject<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* classes outside its list today, so the mn=
emonic is safe -- but the key<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* should not depend on that validation stay=
ing where it is. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 status =3D ares_buf_append_num_dec(buf, (size_t)q=
class, 0);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail; /* LCOV_EXCL_LINE: OutOfMe=
mory */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +@@ -121,6 +238,21 @@ static char *ares_qcache_calc_key(const<br>
&gt; ares_dns_record_t *dnsrec)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0name_len--;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Length-prefix the name so it is self-delimitin=
g.=C2=A0 The question count<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* above stops one question imitating two, b=
ut with the counts equal the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* boundary between adjacent names is still =
guessable, since names reach<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* the key unescaped separated only by &#39;=
|&#39;.=C2=A0 A length makes each name<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* unambiguous for any question count. */<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 status =3D ares_buf_append_num_dec(buf, name_len,=
 0);<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 goto fail; /* LCOV_EXCL_LINE: OutOfMemory =
*/<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 status =3D ares_buf_append_byte(buf, &#39;:&#39;)=
;<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 goto fail; /* LCOV_EXCL_LINE: OutOfMemory =
*/<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (name_len &gt; 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D ares_buf_append(buf, (cons=
t unsigned char *)name, name_len);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; +@@ -301,10 +433,10 @@ static unsigned int<br>
&gt; ares_qcache_soa_minimum(ares_dns_record_t *dnsrec)<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; + /* On success, takes ownership of dnsrec */<br>
&gt; &gt; +-static ares_status_t ares_qcache_insert_int(ares_qcache_t=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*qcache,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ares_dns_record_t=C2=A0 =C2=A0 =C2=A0 =C2=A0*qresp,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const ares_dns_record_t *qreq,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const ares_timeval_t=C2=A0 =C2=A0 *now)<br>
&gt; &gt; ++static ares_status_t ares_qcache_insert_int(ares_qcache_t=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 *qcache,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ares_dns_record_t=C2=A0 =C2=A0 *qresp,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*key,<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const ares_timeval_t *now)<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_qcache_entry_t *entry;<br>
&gt; &gt; +=C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttl;<=
br>
&gt; &gt; +@@ -350,11 +482,11 @@ static ares_status_t<br>
&gt; ares_qcache_insert_int(ares_qcache_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*qcache,<br>
&gt; &gt; +=C2=A0 =C2=A0entry-&gt;expire_ts =3D (time_t)now-&gt;sec + (time=
_t)ttl;<br>
&gt; &gt; +=C2=A0 =C2=A0entry-&gt;insert_ts =3D (time_t)now-&gt;sec;<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 /* We can&#39;t guarantee the server responded with the =
same flags as the<br>
&gt; &gt; +-=C2=A0 =C2=A0* request had, so we have to re-parse the request =
in order to generate the<br>
&gt; &gt; +-=C2=A0 =C2=A0* key for caching, but we&#39;ll only do this once=
 we know for sure we really<br>
&gt; &gt; +-=C2=A0 =C2=A0* want to cache it */<br>
&gt; &gt; +-=C2=A0 entry-&gt;key =3D ares_qcache_calc_key(qreq);<br>
&gt; &gt; ++=C2=A0 /* The key was derived from the caller&#39;s request whe=
n the query was<br>
&gt; created.<br>
&gt; &gt; ++=C2=A0 =C2=A0* It must not be recomputed from query-&gt;query h=
ere: the EDNS fallback<br>
&gt; path<br>
&gt; &gt; ++=C2=A0 =C2=A0* strips the OPT record from that record before a =
successful retry, so a<br>
&gt; &gt; ++=C2=A0 =C2=A0* key derived from it would not match the one a la=
ter lookup computes. */<br>
&gt; &gt; ++=C2=A0 entry-&gt;key =3D ares_strdup(key);<br>
&gt; &gt; +=C2=A0 =C2=A0if (entry-&gt;key =3D=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0goto fail; /* LCOV_EXCL_LINE: OutOfMemory */=
<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +@@ -382,31 +514,25 @@ static ares_status_t<br>
&gt; ares_qcache_insert_int(ares_qcache_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*qcache,<br>
&gt; &gt; +=C2=A0 =C2=A0/* LCOV_EXCL_STOP */<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +-ares_status_t ares_qcache_fetch(ares_channel_t=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*channel,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_timeval_t=C2=A0=
 =C2=A0 =C2=A0*now,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_dns_record_t=C2=
=A0 *dnsrec,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_dns_record_t **=
dnsrec_resp)<br>
&gt; &gt; ++ares_status_t ares_qcache_fetch(ares_channel_t=C2=A0 =C2=A0 =C2=
=A0 =C2=A0*channel,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_timeval_t *now,=
 const char *key,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_record_t **dnsrec=
_resp)<br>
&gt; &gt; + {<br>
&gt; &gt; +-=C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *key =3D NULL;<br>
&gt; &gt; +=C2=A0 =C2=A0ares_qcache_entry_t *entry;<br>
&gt; &gt; +=C2=A0 =C2=A0ares_status_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D=
 ARES_SUCCESS;<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 if (channel =3D=3D NULL || dnsrec =3D=3D NULL || dnsrec_=
resp =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 if (channel =3D=3D NULL || key =3D=3D NULL || dnsrec_res=
p =3D=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ARES_EFORMERR;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 *dnsrec_resp =3D NULL;<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0if (channel-&gt;qcache =3D=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ARES_ENOTFOUND;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_qcache_expire(channel-&gt;qcache, now);<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 key =3D ares_qcache_calc_key(dnsrec);<br>
&gt; &gt; +-=C2=A0 if (key =3D=3D NULL) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 status =3D ARES_ENOMEM; /* LCOV_EXCL_LINE: OutOfM=
emory */<br>
&gt; &gt; +-=C2=A0 =C2=A0 goto done;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* LCOV_EXCL_LINE: OutOfMemory */<br>
&gt; &gt; +-=C2=A0 }<br>
&gt; &gt; +-<br>
&gt; &gt; +=C2=A0 =C2=A0entry =3D ares_htable_strvp_get_direct(channel-&gt;=
qcache-&gt;cache, key);<br>
&gt; &gt; +=C2=A0 =C2=A0if (entry =3D=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0status =3D ARES_ENOTFOUND;<br>
&gt; &gt; +@@ -416,10 +542,24 @@ ares_status_t ares_qcache_fetch(ares_chann=
el_t<br>
&gt; *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0ares_dns_record_ttl_decrement(entry-&gt;dnsrec,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned int)(now-&=
gt;sec - entry-&gt;insert_ts));<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 *dnsrec_resp =3D entry-&gt;dnsrec;<br>
&gt; &gt; ++=C2=A0 /* Hand back a copy the caller owns rather than the cach=
e&#39;s own record.<br>
&gt; &gt; ++=C2=A0 =C2=A0* This is passed straight into an application call=
back, and that callback<br>
&gt; &gt; ++=C2=A0 =C2=A0* is allowed to re-enter c-ares.=C2=A0 Any lookup =
it starts runs the expiry<br>
&gt; &gt; ++=C2=A0 =C2=A0* reaper first, and changing the server list flush=
es the cache outright --<br>
&gt; &gt; ++=C2=A0 =C2=A0* either would destroy this entry while the callba=
ck still held a pointer<br>
&gt; &gt; ++=C2=A0 =C2=A0* into it.=C2=A0 Mirrors the ownership fix already=
 made on the insert side. */<br>
&gt; &gt; ++=C2=A0 status =3D ares_dns_record_duplicate_ex(dnsrec_resp, ent=
ry-&gt;dnsrec);<br>
&gt; &gt; ++=C2=A0 if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Could not hand back a private copy.=C2=A0 Repo=
rt a miss so the lookup falls<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* through to a real query rather than faili=
ng outright: duplication<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* writes and re-parses the record, so it ca=
n fail for reasons other than<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* memory exhaustion, and none of them are a=
 reason to fail a lookup that<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* would have gone to a server a moment earl=
ier. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 status =3D ARES_ENOTFOUND; /* LCOV_EXCL_LINE: Unt=
establePath */<br>
&gt; &gt; ++=C2=A0 =C2=A0 goto done;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* LCOV_EXCL_LINE: UntestablePath */<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; + done:<br>
&gt; &gt; +-=C2=A0 ares_free(key);<br>
&gt; &gt; +=C2=A0 =C2=A0return status;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -428,13 +568,25 @@ ares_status_t ares_qcache_insert(ares_chan=
nel_t<br>
&gt; *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_query_t=
=C2=A0 =C2=A0 =C2=A0 *query,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_dns_reco=
rd_t *dnsrec)<br>
&gt; &gt; + {<br>
&gt; &gt; +-=C2=A0 ares_dns_record_t *dupdns =3D ares_dns_record_duplicate(=
dnsrec);<br>
&gt; &gt; ++=C2=A0 ares_dns_record_t *dupdns;<br>
&gt; &gt; +=C2=A0 =C2=A0ares_status_t=C2=A0 =C2=A0 =C2=A0 status;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* Checked before the duplicate below, which is a full w=
rite and re-parse:<br>
&gt; &gt; ++=C2=A0 =C2=A0* no key means caching is switched off, so the cop=
y would be thrown away.<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_init_options() always creates the cache obj=
ect -- it is disabled by<br>
&gt; &gt; ++=C2=A0 =C2=A0* a zero maximum TTL, not by a NULL pointer -- so =
this is the only place<br>
&gt; &gt; ++=C2=A0 =C2=A0* the distinction is visible here. */<br>
&gt; &gt; ++=C2=A0 if (query-&gt;qcache_key =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_ENOTIMP;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 dupdns =3D ares_dns_record_duplicate(dnsrec);<br>
&gt; &gt; +=C2=A0 =C2=A0if (dupdns =3D=3D NULL) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ARES_ENOMEM;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +-=C2=A0 status =3D ares_qcache_insert_int(channel-&gt;qcache, du=
pdns, query-&gt;query,<br>
&gt; now);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 status =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_qcache_insert_int(channel-&gt;qcache, dupdns=
, query-&gt;qcache_key,<br>
&gt; now);<br>
&gt; &gt; +=C2=A0 =C2=A0if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ares_dns_record_destroy(dupdns);<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +diff --git a/src/lib/ares_send.c b/src/lib/ares_send.c<br>
&gt; &gt; +index dd4a28544b..117745ce28 100644<br>
&gt; &gt; +--- a/src/lib/ares_send.c<br>
&gt; &gt; ++++ b/src/lib/ares_send.c<br>
&gt; &gt; +@@ -111,11 +111,12 @@ ares_status_t ares_send_nolock(ares_channe=
l_t<br>
&gt; *channel, ares_server_t *server,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_callback_dnsrec callb=
ack, void *arg,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned short *qid)<br>
&gt; &gt; + {<br>
&gt; &gt; +-=C2=A0 ares_query_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *q=
uery;<br>
&gt; &gt; +-=C2=A0 ares_timeval_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n=
ow;<br>
&gt; &gt; +-=C2=A0 ares_status_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
tatus;<br>
&gt; &gt; +-=C2=A0 unsigned short=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
d=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D generate_unique_qid(channel);<br>
&gt; &gt; +-=C2=A0 const ares_dns_record_t *dnsrec_resp =3D NULL;<br>
&gt; &gt; ++=C2=A0 ares_query_t=C2=A0 =C2=A0 =C2=A0 *query;<br>
&gt; &gt; ++=C2=A0 ares_timeval_t=C2=A0 =C2=A0 =C2=A0now;<br>
&gt; &gt; ++=C2=A0 ares_status_t=C2=A0 =C2=A0 =C2=A0 status;<br>
&gt; &gt; ++=C2=A0 unsigned short=C2=A0 =C2=A0 =C2=A0id=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D generate_unique_qid(channel);<br>
&gt; &gt; ++=C2=A0 ares_dns_record_t *dnsrec_resp =3D NULL;<br>
&gt; &gt; ++=C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *qc=
ache_key=C2=A0 =3D NULL;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* A channel being destroyed accepts no new queries=
.=C2=A0 ares_destroy(3)<br>
&gt; &gt; +=C2=A0 =C2=A0 * documents that a callback must not add new reque=
sts to a channel being<br>
&gt; &gt; +@@ -145,13 +146,28 @@ ares_status_t ares_send_nolock(ares_channe=
l_t<br>
&gt; *channel, ares_server_t *server,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ARES_ENOSERVER;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 if (!(flags &amp; ARES_SEND_FLAG_NOCACHE)) {<br>
&gt; &gt; ++=C2=A0 /* Derive the cache key once, from the caller&#39;s requ=
est, and only when the<br>
&gt; &gt; ++=C2=A0 =C2=A0* cache is actually on.=C2=A0 The send path may mu=
tate query-&gt;query afterwards<br>
&gt; &gt; ++=C2=A0 =C2=A0* -- the EDNS fallback strips its OPT record -- an=
d a key derived from it<br>
&gt; &gt; ++=C2=A0 =C2=A0* later would not match.=C2=A0 ares_init_options()=
 always creates the cache<br>
&gt; &gt; ++=C2=A0 =C2=A0* object, so a zero maximum TTL is what &quot;off&=
quot; means. */<br>
&gt; &gt; ++=C2=A0 if (channel-&gt;qcache_max_ttl &gt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 qcache_key =3D ares_qcache_calc_key(dnsrec);<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (qcache_key =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 callback(arg, ARES_ENOMEM, 0, NULL); /* LC=
OV_EXCL_LINE:<br>
&gt; OutOfMemory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 return ARES_ENOMEM;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* LCOV_EXCL_LINE: OutOfMemory */=
<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (qcache_key !=3D NULL &amp;&amp; !(flags &amp; ARES_S=
END_FLAG_NOCACHE)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Check query cache */<br>
&gt; &gt; +-=C2=A0 =C2=A0 status =3D ares_qcache_fetch(channel, &amp;now, d=
nsrec, &amp;dnsrec_resp);<br>
&gt; &gt; ++=C2=A0 =C2=A0 status =3D ares_qcache_fetch(channel, &amp;now, q=
cache_key, &amp;dnsrec_resp);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (status !=3D ARES_ENOTFOUND) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ARES_SUCCESS means we retrieved th=
e cache, anything else is a<br>
&gt; critical<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * failure, all result in termination=
 */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ares_free(qcache_key);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0callback(arg, status, 0, dnsrec_resp)=
;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ares_dns_record_destroy(dnsrec_resp);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +@@ -159,8 +175,11 @@ ares_status_t ares_send_nolock(ares_channel=
_t<br>
&gt; *channel, ares_server_t *server,<br>
&gt; &gt; +=C2=A0 =C2=A0/* Allocate space for query and allocated fields. *=
/<br>
&gt; &gt; +=C2=A0 =C2=A0query =3D ares_malloc(sizeof(ares_query_t));<br>
&gt; &gt; +=C2=A0 =C2=A0if (!query) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 callback(arg, ARES_ENOMEM, 0, NULL); /* LCOV_EXCL=
_LINE:<br>
&gt; OutOfMemory */<br>
&gt; &gt; +-=C2=A0 =C2=A0 return ARES_ENOMEM;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* LCOV_EXCL_LINE: OutOfMemory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* LCOV_EXCL_START: OutOfMemory */<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_free(qcache_key);<br>
&gt; &gt; ++=C2=A0 =C2=A0 callback(arg, ARES_ENOMEM, 0, NULL);<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_ENOMEM;<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* LCOV_EXCL_STOP */<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0memset(query, 0, sizeof(*query));<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -173,6 +192,10 @@ ares_status_t ares_send_nolock(ares_channel=
_t<br>
&gt; *channel, ares_server_t *server,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0(channel-&gt;flags &amp; ARES_FLAG_USEVC) ? =
ARES_TRUE : ARES_FALSE;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* Duplicate Query */<br>
&gt; &gt; ++=C2=A0 /* The query adopts the key derived above; ares_free_que=
ry() releases it. */<br>
&gt; &gt; ++=C2=A0 query-&gt;qcache_key =3D qcache_key;<br>
&gt; &gt; ++=C2=A0 qcache_key=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D NULL;<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0status =3D ares_dns_record_duplicate_ex(&amp;query-=
&gt;query, dnsrec);<br>
&gt; &gt; +=C2=A0 =C2=A0if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Sometimes we might get a EBADRESP respons=
e from duplicate due to<br>
&gt; &gt; +@@ -180,7 +203,11 @@ ares_status_t ares_send_nolock(ares_channel=
_t<br>
&gt; *channel, ares_server_t *server,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (status =3D=3D ARES_EBADRESP) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D ARES_EBADQUERY;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +-=C2=A0 =C2=A0 ares_free(query);<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* ares_free_query() rather than ares_free(): the=
 query was zeroed above,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* so detaching finds every node NULL and th=
e qid not yet registered, and<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* it also releases qcache_key.=C2=A0 Reacha=
ble without memory pressure -- a<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* name that is not a valid hostname fails t=
he duplicate. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_free_query(query);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0callback(arg, status, 0, NULL);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +diff --git a/test/ares-test-internal.cc b/test/ares-test-interna=
l.cc<br>
&gt; &gt; +index 8881f3b7cc..5ba5d2b39b 100644<br>
&gt; &gt; +--- a/test/ares-test-internal.cc<br>
&gt; &gt; ++++ b/test/ares-test-internal.cc<br>
&gt; &gt; +@@ -502,6 +502,60 @@ TEST_F(LibraryTest, URI) {<br>
&gt; &gt; +=C2=A0 =C2=A0EXPECT_NE(ARES_SUCCESS, ares_uri_parse_buf(NULL, NU=
LL));<br>
&gt; &gt; +=C2=A0 =C2=A0EXPECT_NE(ARES_SUCCESS, ares_uri_parse_buf(NULL, NU=
LL));<br>
&gt; &gt; + }<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The cache key must distinguish requests whose answers are no=
t<br>
&gt; &gt; ++// interchangeable.=C2=A0 Two shapes are easy to get wrong beca=
use names reach<br>
&gt; the<br>
&gt; &gt; ++// key unescaped: a request with two questions versus one whose=
 name<br>
&gt; spells out<br>
&gt; &gt; ++// the second, and two requests with the same question count wh=
ose names<br>
&gt; can be<br>
&gt; &gt; ++// made to run together.=C2=A0 Both are narrow to reach -- they=
 need a hand-built<br>
&gt; &gt; ++// record with more than one question, which real servers rejec=
t -- but the key<br>
&gt; &gt; ++// asserts they are distinct, so pin it.<br>
&gt; &gt; ++TEST_F(LibraryTest, QcacheKeyDistinguishesQuestions) {<br>
&gt; &gt; ++=C2=A0 struct qcase {<br>
&gt; &gt; ++=C2=A0 =C2=A0 const char *n1;<br>
&gt; &gt; ++=C2=A0 =C2=A0 const char *n2; /* nullptr for a single-question =
record */<br>
&gt; &gt; ++=C2=A0 };<br>
&gt; &gt; ++=C2=A0 const qcase cases[] =3D {<br>
&gt; &gt; ++=C2=A0 =C2=A0 { &quot;<a href=3D"http://one.example.net" rel=3D=
"noreferrer" target=3D"_blank">one.example.net</a>&quot;,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=
=3D"http://two.example.net" rel=3D"noreferrer" target=3D"_blank">two.exampl=
e.net</a>&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; &gt; ++=C2=A0 =C2=A0 { &quot;<a href=3D"http://one.example.net" rel=3D=
"noreferrer" target=3D"_blank">one.example.net</a>|A|IN|<a href=3D"http://t=
wo.example.net" rel=3D"noreferrer" target=3D"_blank">two.example.net</a>&qu=
ot;, nullptr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; &gt; ++=C2=A0 =C2=A0 { &quot;<a href=3D"http://one.example.net" rel=3D=
"noreferrer" target=3D"_blank">one.example.net</a>&quot;,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=
=3D"http://two.example.net" rel=3D"noreferrer" target=3D"_blank">two.exampl=
e.net</a>|A|IN|<a href=3D"http://three.example.net" rel=3D"noreferrer" targ=
et=3D"_blank">three.example.net</a>&quot;<br>
&gt; },<br>
&gt; &gt; ++=C2=A0 =C2=A0 { &quot;<a href=3D"http://one.example.net" rel=3D=
"noreferrer" target=3D"_blank">one.example.net</a>|A|IN|<a href=3D"http://t=
wo.example.net" rel=3D"noreferrer" target=3D"_blank">two.example.net</a>&qu=
ot;, &quot;<a href=3D"http://three.example.net" rel=3D"noreferrer" target=
=3D"_blank">three.example.net</a>&quot;<br>
&gt; },<br>
&gt; &gt; ++=C2=A0 };<br>
&gt; &gt; ++=C2=A0 std::vector&lt;std::string&gt; keys;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 for (size_t i =3D 0; i &lt; sizeof(cases) / sizeof(cases=
[0]); i++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_dns_record_t *req =3D nullptr;<br>
&gt; &gt; ++=C2=A0 =C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *key =3D nullptr;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_recor=
d_create(&amp;req, 0, ARES_FLAG_RD,<br>
&gt; ARES_OPCODE_QUERY,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_R=
CODE_NOERROR));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_recor=
d_query_add(req, cases[i].n1, ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ARES_CLASS_IN));<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (cases[i].n2 !=3D nullptr) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dn=
s_record_query_add(req, cases[i].n2,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ARES_CLASS_IN));<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 key =3D ares_qcache_calc_key(req);<br>
&gt; &gt; ++=C2=A0 =C2=A0 ASSERT_NE(nullptr, key);<br>
&gt; &gt; ++=C2=A0 =C2=A0 keys.push_back(std::string(key));<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_free_string(key);<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_dns_record_destroy(req);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Every one of these is a different request, so every k=
ey must differ. */<br>
&gt; &gt; ++=C2=A0 for (size_t i =3D 0; i &lt; keys.size(); i++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 for (size_t j =3D i + 1; j &lt; keys.size(); j++)=
 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 EXPECT_NE(keys[i], keys[j])<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&lt; &quot;cache key collision =
between case &quot; &lt;&lt; i &lt;&lt; &quot; and case &quot; &lt;&lt; j<b=
r>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&lt; &quot;: &quot; &lt;&lt; ke=
ys[i];<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + #endif /* !CARES_SYMBOL_HIDING */<br>
&gt; &gt; +<br>
&gt; &gt; + TEST_F(LibraryTest, InetPtoN) {<br>
&gt; &gt; +diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc<br>
&gt; &gt; +index b848c02434..4b409db7c3 100644<br>
&gt; &gt; +--- a/test/ares-test-mock.cc<br>
&gt; &gt; ++++ b/test/ares-test-mock.cc<br>
&gt; &gt; +@@ -611,6 +611,425 @@ class CacheQueriesTest<br>
&gt; &gt; +=C2=A0 =C2=A0struct ares_options opts_;<br>
&gt; &gt; + };<br>
&gt; &gt; +<br>
&gt; &gt; ++// A cache hit used to hand the callback a pointer to the cache=
&#39;s own record.<br>
&gt; &gt; ++// That is fine only while the callback does nothing else -- bu=
t re-entering<br>
&gt; &gt; ++// c-ares from a callback is documented as allowed, and two ord=
inary things a<br>
&gt; &gt; ++// callback might do destroy the entry underneath it: changing =
the server list<br>
&gt; &gt; ++// flushes the whole cache, and starting another lookup runs th=
e expiry reaper<br>
&gt; &gt; ++// first.=C2=A0 The record must therefore be the caller&#39;s o=
wn copy.<br>
&gt; &gt; ++//<br>
&gt; &gt; ++// Here the callback changes the server list, which flushes the=
 cache, and<br>
&gt; then<br>
&gt; &gt; ++// reads the record it was handed.<br>
&gt; &gt; ++struct QcacheReentrantCbData {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done;<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ancount;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void QcacheReentrantCallback(void *arg, ares_status_t st=
atus,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t timeo=
uts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_d=
ns_record_t *dnsrec) {<br>
&gt; &gt; ++=C2=A0 QcacheReentrantCbData *data =3D static_cast&lt;QcacheRee=
ntrantCbData<br>
&gt; *&gt;(arg);<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 data-&gt;done =3D true;<br>
&gt; &gt; ++=C2=A0 if (status !=3D ARES_SUCCESS || dnsrec =3D=3D NULL) {<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 /* Documented re-entry.=C2=A0 Reconfiguring servers flus=
hes the query cache. */<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_set_servers_csv(=
data-&gt;channel, &quot;<a href=3D"http://127.0.0.1:53055" rel=3D"noreferre=
r" target=3D"_blank">127.0.0.1:53055</a>&quot;));<br>
&gt; &gt; ++=C2=A0 /* Still inside the callback, so this record must still =
be readable. */<br>
&gt; &gt; ++=C2=A0 data-&gt;ancount =3D ares_dns_record_rr_cnt(dnsrec,<br>
&gt; ARES_SECTION_ANSWER);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_P(CacheQueriesTest, ReentrantFlushInCallbackNoUseAfterFree=
) {<br>
&gt; &gt; ++=C2=A0 DNSPacket rsp;<br>
&gt; &gt; ++=C2=A0 rsp.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a=
>&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;<a href=3D"http://ww=
w.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;=
, 100, {2, 3, 4, 5}));<br>
&gt; &gt; ++=C2=A0 ON_CALL(server_, OnRequest(&quot;<a href=3D"http://www.g=
oogle.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, T=
_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillByDefault(SetReply(&amp;server_, &amp;rsp));=
<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Populate the cache. */<br>
&gt; &gt; ++=C2=A0 QueryResult first;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, =
ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QueryCallback, &amp;first, NULL);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(first.done_);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Served from the cache, so the callback runs synchrono=
usly holding the<br>
&gt; &gt; ++=C2=A0 =C2=A0* record the cache handed it. */<br>
&gt; &gt; ++=C2=A0 QcacheReentrantCbData data;<br>
&gt; &gt; ++=C2=A0 data.channel =3D channel_;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.ancount =3D 0;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, =
ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QcacheReentrantCallback, &amp;data, NULL);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, data.ancount);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The cache key covered the question and a couple of header fl=
ags but<br>
&gt; ignored<br>
&gt; &gt; ++// the request&#39;s OPT record entirely, so two requests diffe=
ring only in their<br>
&gt; &gt; ++// EDNS options collided.=C2=A0 An answer obtained under one se=
t of options is not<br>
&gt; &gt; ++// interchangeable with one obtained under another -- most obvi=
ously, a<br>
&gt; request<br>
&gt; &gt; ++// with the DO bit set must not be handed an answer fetched wit=
hout it.<br>
&gt; &gt; ++//<br>
&gt; &gt; ++// Both requests here ask the identical question; only the EDNS=
 state differs,<br>
&gt; &gt; ++// so the server must see two of them.<br>
&gt; &gt; ++TEST_P(CacheQueriesTest, EdnsOptionsSeparateCacheEntries) {<br>
&gt; &gt; ++=C2=A0 DNSPacket rsp;<br>
&gt; &gt; ++=C2=A0 rsp.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a=
>&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;<a href=3D"http://ww=
w.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;=
, 100, {2, 3, 4, 5}));<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(server_, OnRequest(&quot;<a href=3D"http://w=
ww.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot=
;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .Times(2)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillRepeatedly(SetReply(&amp;server_, &amp;rsp))=
;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* First: no OPT record at all. */<br>
&gt; &gt; ++=C2=A0 ares_dns_record_t *req1 =3D nullptr;<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_record_creat=
e(&amp;req1, 0, ARES_FLAG_RD,<br>
&gt; ARES_OPCODE_QUERY,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_RCODE_NO=
ERROR));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_record_query=
_add(req1, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" targe=
t=3D"_blank">www.google.com</a>&quot;,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_=
CLASS_IN));<br>
&gt; &gt; ++=C2=A0 QueryResult r1;<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_send_dnsrec(chan=
nel_, req1, QueryCallback, &amp;r1, nullptr));<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(r1.done_);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, r1.status_);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Second: same question, but carrying EDNS with the DO =
bit set. */<br>
&gt; &gt; ++=C2=A0 ares_dns_record_t *req2 =3D nullptr;<br>
&gt; &gt; ++=C2=A0 ares_dns_rr_t=C2=A0 =C2=A0 =C2=A0*opt=C2=A0 =3D nullptr;=
<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_record_creat=
e(&amp;req2, 0, ARES_FLAG_RD,<br>
&gt; ARES_OPCODE_QUERY,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_RCODE_NO=
ERROR));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_record_query=
_add(req2, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer" targe=
t=3D"_blank">www.google.com</a>&quot;,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_=
CLASS_IN));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_record_rr_ad=
d(&amp;opt, req2, ARES_SECTION_ADDITIONAL,<br>
&gt; &quot;&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_REC_TYPE=
_OPT, ARES_CLASS_IN, 0));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_rr_set_u16(o=
pt, ARES_RR_OPT_UDP_SIZE, 1232));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_dns_rr_set_u8(opt,<br>
&gt; ARES_RR_OPT_VERSION, 0));<br>
&gt; &gt; ++=C2=A0 /* DO */<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_rr_set_u16(o=
pt, ARES_RR_OPT_FLAGS, 0x8000));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 QueryResult r2;<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_send_dnsrec(chan=
nel_, req2, QueryCallback, &amp;r2, nullptr));<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(r2.done_);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, r2.status_);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_dns_record_destroy(req1);<br>
&gt; &gt; ++=C2=A0 ares_dns_record_destroy(req2);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The test above sets the DO bit, which lives in the OPT flags=
 -- it never<br>
&gt; &gt; ++// reaches the loop that keys the individual EDNS options.=C2=
=A0 That loop is what<br>
&gt; &gt; ++// separates two client subnets, so it needs its own coverage.<=
br>
&gt; &gt; ++// The mirror image of the tests above: two things are delibera=
tely left out<br>
&gt; &gt; ++// of the cache key, and leaving them out is a security-relevan=
t judgement --<br>
&gt; &gt; ++// it declares that two requests differing only in these still =
have<br>
&gt; &gt; ++// interchangeable answers.=C2=A0 Without a test, keying on eit=
her one later would<br>
&gt; &gt; ++// turn every request from an affected application into a perma=
nent cache<br>
&gt; miss<br>
&gt; &gt; ++// and nothing would fail.<br>
&gt; &gt; ++<br>
&gt; &gt; ++// A DNS cookie is per-server transport state and says nothing =
about the<br>
&gt; &gt; ++// content of an answer, so two requests differing only in thei=
r cookie share<br>
&gt; &gt; ++// an entry.=C2=A0 The server must therefore be asked exactly o=
nce.<br>
&gt; &gt; ++// Two query types with no mnemonic in ares_dns_rec_type_tostr(=
) both<br>
&gt; render as<br>
&gt; &gt; ++// &quot;UNKNOWN&quot;, so keying the mnemonic made every such =
type share one<br>
&gt; entry -- a<br>
&gt; &gt; ++// lookup answered with a record of a type it never asked for.=
=C2=A0 Any 16-bit<br>
&gt; &gt; ++// value reaches here through ares_query_dnsrec(); LOC (29) and=
 DNAME<br>
&gt; (39) are<br>
&gt; &gt; ++// both real and both outside the table.<br>
&gt; &gt; ++TEST_P(CacheQueriesTest,<br>
&gt; UnknownQueryTypesDoNotShareCacheEntries) {<br>
&gt; &gt; ++=C2=A0 DNSPacket rsp29;<br>
&gt; &gt; ++=C2=A0 rsp29.set_response().set_aa().add_question(<br>
&gt; &gt; ++=C2=A0 =C2=A0 new DNSQuestion(&quot;<a href=3D"http://example.n=
et" rel=3D"noreferrer" target=3D"_blank">example.net</a>&quot;, 29));<br>
&gt; &gt; ++=C2=A0 DNSPacket rsp39;<br>
&gt; &gt; ++=C2=A0 rsp39.set_response().set_aa().add_question(<br>
&gt; &gt; ++=C2=A0 =C2=A0 new DNSQuestion(&quot;<a href=3D"http://example.n=
et" rel=3D"noreferrer" target=3D"_blank">example.net</a>&quot;, 39));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // One call per type: neither may be served the other&#3=
9;s answer.<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(server_, OnRequest(&quot;<a href=3D"http://e=
xample.net" rel=3D"noreferrer" target=3D"_blank">example.net</a>&quot;, 29)=
)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .Times(1)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillRepeatedly(SetReply(&amp;server_, &amp;rsp29=
));<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(server_, OnRequest(&quot;<a href=3D"http://e=
xample.net" rel=3D"noreferrer" target=3D"_blank">example.net</a>&quot;, 39)=
)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .Times(1)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillRepeatedly(SetReply(&amp;server_, &amp;rsp39=
));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 QueryResult r1;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://exam=
ple.net" rel=3D"noreferrer" target=3D"_blank">example.net</a>&quot;, ARES_C=
LASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 static_cast&lt;ares_dns_rec_type_t&gt;(29), QueryCallback, &amp;r1,<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 nullptr);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(r1.done_);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 QueryResult r2;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://exam=
ple.net" rel=3D"noreferrer" target=3D"_blank">example.net</a>&quot;, ARES_C=
LASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 static_cast&lt;ares_dns_rec_type_t&gt;(39), QueryCallback, &amp;r2,<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 nullptr);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(r2.done_);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Handing back a duplicate materialises the pending TTL decrem=
ent, so a<br>
&gt; &gt; ++// callback that reads the TTL off the record it is given sees =
the remaining<br>
&gt; &gt; ++// lifetime rather than the value the server sent.=C2=A0 docs/a=
res_init_options.3<br>
&gt; &gt; ++// states this, so pin it.=C2=A0 Only visible to a caller that =
does not duplicate<br>
&gt; &gt; ++// first -- QueryResult does, which is why the other cache test=
s cannot see it.<br>
&gt; &gt; ++static unsigned int g_qcache_hit_ttl =3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void QcacheTtlCallback(void *arg, ares_status_t status, =
size_t timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_dns_record_t *dnsrec) =
{<br>
&gt; &gt; ++=C2=A0 const ares_dns_rr_t *rr;<br>
&gt; &gt; ++=C2=A0 (void)arg;<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 if (status !=3D ARES_SUCCESS || dnsrec =3D=3D NULL) {<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 rr =3D ares_dns_record_rr_get_const(dnsrec, ARES_SECTION=
_ANSWER, 0);<br>
&gt; &gt; ++=C2=A0 g_qcache_hit_ttl =3D rr ? ares_dns_rr_get_ttl(rr) : 0;<b=
r>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_P(CacheQueriesTest, CacheHitReportsRemainingTtl) {<br>
&gt; &gt; ++=C2=A0 DNSPacket rsp;<br>
&gt; &gt; ++=C2=A0 rsp.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a=
>&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;<a href=3D"http://ww=
w.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;=
, 100, {2, 3, 4, 5}));<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(server_, OnRequest(&quot;<a href=3D"http://w=
ww.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot=
;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .Times(1)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillRepeatedly(SetReply(&amp;server_, &amp;rsp))=
;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 g_qcache_hit_ttl =3D 0;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, =
ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QcacheTtlCallback, nullptr, nullptr);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((unsigned int)100, g_qcache_hit_ttl);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_sleep_time(2100);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 g_qcache_hit_ttl =3D 0;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, =
ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QcacheTtlCallback, nullptr, nullptr);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 // Served from the cache, and reporting what is left rat=
her than the<br>
&gt; &gt; ++=C2=A0 // original 100.<br>
&gt; &gt; ++=C2=A0 EXPECT_GT(g_qcache_hit_ttl, (unsigned int)0);<br>
&gt; &gt; ++=C2=A0 EXPECT_LT(g_qcache_hit_ttl, (unsigned int)100);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_P(CacheQueriesTest, CookieDoesNotSplitCacheEntries) {<br>
&gt; &gt; ++=C2=A0 DNSPacket rsp;<br>
&gt; &gt; ++=C2=A0 rsp.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a=
>&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;<a href=3D"http://ww=
w.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;=
, 100, {2, 3, 4, 5}));<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(server_, OnRequest(&quot;<a href=3D"http://w=
ww.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot=
;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .Times(1)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillRepeatedly(SetReply(&amp;server_, &amp;rsp))=
;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 const unsigned char=C2=A0 ck1[]=C2=A0 =C2=A0=3D {1, 2, 3=
, 4, 5, 6, 7, 8};<br>
&gt; &gt; ++=C2=A0 const unsigned char=C2=A0 ck2[]=C2=A0 =C2=A0=3D {8, 7, 6=
, 5, 4, 3, 2, 1};<br>
&gt; &gt; ++=C2=A0 const unsigned char *ck[2]=C2=A0 =C2=A0=3D {ck1, ck2};<b=
r>
&gt; &gt; ++=C2=A0 QueryResult=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r[2];<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 for (int i =3D 0; i &lt; 2; i++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_dns_record_t *req =3D nullptr;<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_dns_rr_t=C2=A0 =C2=A0 =C2=A0*opt =3D nullptr=
;<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_recor=
d_create(&amp;req, 0, ARES_FLAG_RD,<br>
&gt; ARES_OPCODE_QUERY,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_R=
CODE_NOERROR));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_recor=
d_query_add(req, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer"=
 target=3D"_blank">www.google.com</a>&quot;,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ARES_CLASS_IN));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_recor=
d_rr_add(&amp;opt, req, ARES_SECTION_ADDITIONAL,<br>
&gt; &quot;&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_R=
EC_TYPE_OPT, ARES_CLASS_IN, 0));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_rr_se=
t_u16(opt, ARES_RR_OPT_UDP_SIZE, 1232));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_rr_se=
t_opt(opt, ARES_RR_OPT_OPTIONS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_OPT_PARAM_COOK=
IE, ck[i], sizeof(ck1)));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_send_dnsr=
ec(channel_, req, QueryCallback, &amp;r[i], nullptr));<br>
&gt; &gt; ++=C2=A0 =C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_TRUE(r[i].done_);<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS, r[i].status_);<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_dns_record_destroy(req);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The advertised UDP payload size constrains how a response is=
<br>
&gt; transported,<br>
&gt; &gt; ++// not what it says, so it is excluded too.=C2=A0 Same expectat=
ion: one request.<br>
&gt; &gt; ++TEST_P(CacheQueriesTest, UdpPayloadSizeDoesNotSplitCacheEntries=
) {<br>
&gt; &gt; ++=C2=A0 DNSPacket rsp;<br>
&gt; &gt; ++=C2=A0 rsp.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a=
>&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;<a href=3D"http://ww=
w.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;=
, 100, {2, 3, 4, 5}));<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(server_, OnRequest(&quot;<a href=3D"http://w=
ww.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot=
;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .Times(1)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillRepeatedly(SetReply(&amp;server_, &amp;rsp))=
;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 const unsigned short sizes[2] =3D {512, 1232};<br>
&gt; &gt; ++=C2=A0 QueryResult=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r[2];<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 for (int i =3D 0; i &lt; 2; i++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_dns_record_t *req =3D nullptr;<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_dns_rr_t=C2=A0 =C2=A0 =C2=A0*opt =3D nullptr=
;<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_recor=
d_create(&amp;req, 0, ARES_FLAG_RD,<br>
&gt; ARES_OPCODE_QUERY,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_R=
CODE_NOERROR));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_recor=
d_query_add(req, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer"=
 target=3D"_blank">www.google.com</a>&quot;,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ARES_CLASS_IN));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_recor=
d_rr_add(&amp;opt, req, ARES_SECTION_ADDITIONAL,<br>
&gt; &quot;&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_R=
EC_TYPE_OPT, ARES_CLASS_IN, 0));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_rr_se=
t_u16(opt, ARES_RR_OPT_UDP_SIZE, sizes[i]));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_send_dnsr=
ec(channel_, req, QueryCallback, &amp;r[i], nullptr));<br>
&gt; &gt; ++=C2=A0 =C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_TRUE(r[i].done_);<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS, r[i].status_);<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_dns_record_destroy(req);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_P(CacheQueriesTest, EdnsClientSubnetSeparateCacheEntries) =
{<br>
&gt; &gt; ++=C2=A0 DNSPacket rsp;<br>
&gt; &gt; ++=C2=A0 rsp.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a=
>&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;<a href=3D"http://ww=
w.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;=
, 100, {2, 3, 4, 5}));<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(server_, OnRequest(&quot;<a href=3D"http://w=
ww.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot=
;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .Times(2)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillRepeatedly(SetReply(&amp;server_, &amp;rsp))=
;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* <a href=3D"http://192.0.2.0/24" rel=3D"noreferrer" ta=
rget=3D"_blank">192.0.2.0/24</a> and <a href=3D"http://198.51.100.0/24" rel=
=3D"noreferrer" target=3D"_blank">198.51.100.0/24</a> */<br>
&gt; &gt; ++=C2=A0 const unsigned char=C2=A0 ecs1[]=C2=A0 =3D {0x00, 0x01, =
0x18, 0x00, 0xc0, 0x00, 0x02};<br>
&gt; &gt; ++=C2=A0 const unsigned char=C2=A0 ecs2[]=C2=A0 =3D {0x00, 0x01, =
0x18, 0x00, 0xc6, 0x33, 0x64};<br>
&gt; &gt; ++=C2=A0 const unsigned char *ecs[2]=C2=A0 =3D {ecs1, ecs2};<br>
&gt; &gt; ++=C2=A0 QueryResult=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r[2];<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 for (int i =3D 0; i &lt; 2; i++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_dns_record_t *req =3D nullptr;<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_dns_rr_t=C2=A0 =C2=A0 =C2=A0*opt =3D nullptr=
;<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_recor=
d_create(&amp;req, 0, ARES_FLAG_RD,<br>
&gt; ARES_OPCODE_QUERY,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_R=
CODE_NOERROR));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_recor=
d_query_add(req, &quot;<a href=3D"http://www.google.com" rel=3D"noreferrer"=
 target=3D"_blank">www.google.com</a>&quot;,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ARES_CLASS_IN));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_recor=
d_rr_add(&amp;opt, req, ARES_SECTION_ADDITIONAL,<br>
&gt; &quot;&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_R=
EC_TYPE_OPT, ARES_CLASS_IN, 0));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_rr_se=
t_u16(opt, ARES_RR_OPT_UDP_SIZE, 1232));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_rr_se=
t_opt(opt, ARES_RR_OPT_OPTIONS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_OPT_PARAM_EDNS=
_CLIENT_SUBNET, ecs[i],<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(ecs1)));<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_send_dnsr=
ec(channel_, req, QueryCallback, &amp;r[i], nullptr));<br>
&gt; &gt; ++=C2=A0 =C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_TRUE(r[i].done_);<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS, r[i].status_);<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_dns_record_destroy(req);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// A server answering an EDNS query with FORMERR makes c-ares s=
trip the<br>
&gt; OPT<br>
&gt; &gt; ++// record from query-&gt;query and retry.=C2=A0 The cache key m=
ust not be derived<br>
&gt; from<br>
&gt; &gt; ++// that record afterwards, or the entry is stored under a key n=
o later lookup<br>
&gt; &gt; ++// computes and the cache silently stops working for that name.=
<br>
&gt; &gt; ++TEST_P(CacheQueriesTest, EdnsFallbackStillCaches) {<br>
&gt; &gt; ++=C2=A0 DNSPacket rspfail;<br>
&gt; &gt; ++=C2=A0 rspfail.set_response().set_aa().set_rcode(FORMERR)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a=
>&quot;, T_A));<br>
&gt; &gt; ++=C2=A0 DNSPacket rspok;<br>
&gt; &gt; ++=C2=A0 rspok.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a=
>&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;<a href=3D"http://ww=
w.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;=
, 100, {1, 2, 3, 4}));<br>
&gt; &gt; ++=C2=A0 /* Two: the FORMERR and the retry.=C2=A0 The second look=
up must be a cache<br>
&gt; hit. */<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(server_, OnRequest(&quot;<a href=3D"http://w=
ww.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot=
;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .Times(2)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillOnce(SetReply(&amp;server_, &amp;rspfail))<b=
r>
&gt; &gt; ++=C2=A0 =C2=A0 .WillRepeatedly(SetReply(&amp;server_, &amp;rspok=
));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 HostResult r1;<br>
&gt; &gt; ++=C2=A0 ares_gethostbyname(channel_, &quot;<a href=3D"http://www=
.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>.&quot;=
, AF_INET,<br>
&gt; HostCallback, &amp;r1);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(r1.done_);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, r1.status_);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 HostResult r2;<br>
&gt; &gt; ++=C2=A0 ares_gethostbyname(channel_, &quot;<a href=3D"http://www=
.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>.&quot;=
, AF_INET,<br>
&gt; HostCallback, &amp;r2);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(r2.done_);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, r2.status_);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The question name is caller-supplied and unescaped, so anyth=
ing keyed<br>
&gt; after<br>
&gt; &gt; ++// it could be imitated by a name containing that same text.=C2=
=A0 A request for<br>
&gt; &gt; ++// &quot;<a href=3D"http://example.net" rel=3D"noreferrer" targ=
et=3D"_blank">example.net</a>|EDNS|0|8000&quot; with no OPT record must not=
 collide with a<br>
&gt; request<br>
&gt; &gt; ++// for &quot;<a href=3D"http://example.net" rel=3D"noreferrer" =
target=3D"_blank">example.net</a>&quot; carrying EDNS with the DNSSEC OK bi=
t set.<br>
&gt; &gt; ++TEST_P(CacheQueriesTest, EdnsSectionCannotBeImitatedByName) {<b=
r>
&gt; &gt; ++=C2=A0 DNSPacket rsp;<br>
&gt; &gt; ++=C2=A0 rsp.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://example.net" rel=3D"noreferrer" target=3D"_blank">example.net</a>&quot=
;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;<a href=3D"http://ex=
ample.net" rel=3D"noreferrer" target=3D"_blank">example.net</a>&quot;, 100,=
 {5, 6, 7, 8}));<br>
&gt; &gt; ++=C2=A0 ON_CALL(server_, OnRequest(&quot;<a href=3D"http://examp=
le.net" rel=3D"noreferrer" target=3D"_blank">example.net</a>&quot;, T_A))<b=
r>
&gt; &gt; ++=C2=A0 =C2=A0 .WillByDefault(SetReply(&amp;server_, &amp;rsp));=
<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Cache an answer for the real name, with EDNS and the =
DO bit set. */<br>
&gt; &gt; ++=C2=A0 ares_dns_record_t *req =3D nullptr;<br>
&gt; &gt; ++=C2=A0 ares_dns_rr_t=C2=A0 =C2=A0 =C2=A0*opt =3D nullptr;<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_record_creat=
e(&amp;req, 0, ARES_FLAG_RD,<br>
&gt; ARES_OPCODE_QUERY,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_RCODE_NO=
ERROR));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_record_query=
_add(req, &quot;<a href=3D"http://example.net" rel=3D"noreferrer" target=3D=
"_blank">example.net</a>&quot;,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_=
CLASS_IN));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_record_rr_ad=
d(&amp;opt, req, ARES_SECTION_ADDITIONAL,<br>
&gt; &quot;&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_REC_TYPE=
_OPT, ARES_CLASS_IN, 0));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_rr_set_u16(o=
pt, ARES_RR_OPT_UDP_SIZE, 1232));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_dns_rr_set_u16(opt,<br>
&gt; ARES_RR_OPT_FLAGS, 0x8000));<br>
&gt; &gt; ++=C2=A0 QueryResult r1;<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_send_dnsrec(chan=
nel_, req, QueryCallback, &amp;r1, nullptr));<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(r1.done_);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, r1.status_);<br>
&gt; &gt; ++=C2=A0 ares_dns_record_destroy(req);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* A different name that spells out the EDNS suffix, wit=
h no OPT record.<br>
&gt; &gt; ++=C2=A0 =C2=A0* It must not be served the entry above; with the =
cache keyed correctly it<br>
&gt; &gt; ++=C2=A0 =C2=A0* is refused, because &#39;|&#39; is not valid in =
a hostname. */<br>
&gt; &gt; ++=C2=A0 ares_dns_record_t *req2 =3D nullptr;<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_record_creat=
e(&amp;req2, 0, ARES_FLAG_RD,<br>
&gt; ARES_OPCODE_QUERY,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARES_RCODE_NO=
ERROR));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_dns_record_query=
_add(req2, &quot;<a href=3D"http://example.net" rel=3D"noreferrer" target=
=3D"_blank">example.net</a>|EDNS|0|8000&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_=
REC_TYPE_A, ARES_CLASS_IN));<br>
&gt; &gt; ++=C2=A0 QueryResult r2;<br>
&gt; &gt; ++=C2=A0 ares_send_dnsrec(channel_, req2, QueryCallback, &amp;r2,=
 nullptr);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(r2.done_);<br>
&gt; &gt; ++=C2=A0 EXPECT_NE(ARES_SUCCESS, r2.status_);<br>
&gt; &gt; ++=C2=A0 ares_dns_record_destroy(req2);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + TEST_P(CacheQueriesTest, GetHostByNameCache) {<br>
&gt; &gt; +=C2=A0 =C2=A0DNSPacket rsp;<br>
&gt; &gt; +=C2=A0 =C2=A0rsp.set_response().set_aa()<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/c-ares/c-ares/0004-Handle-co=
nnections-<br>
&gt; torn-down-by-application.patch b/meta-oe/recipes-support/c-ares/c-ares=
/0004-<br>
&gt; Handle-connections-torn-down-by-application.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..f78e9726b0<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-support/c-ares/c-ares/0004-Handle-connectio=
ns-torn-<br>
&gt; down-by-application.patch<br>
&gt; &gt; @@ -0,0 +1,1107 @@<br>
&gt; &gt; +From 13a10dddbabc30b6fca8e23f9efff73fedba9401 Mon Sep 17 00:00:0=
0<br>
&gt; 2001<br>
&gt; &gt; +From: Brad House &lt;<a href=3D"mailto:brad@brad-house.com" targ=
et=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Date: Sun, 18 Oct 2026 22:51:53 -0400<br>
&gt; &gt; +Subject: [PATCH] [Backport v1.34] Handle connections torn down b=
y<br>
&gt; application<br>
&gt; &gt; + socket functions (#1343)<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +Backport of cb25d8bf297aed0aad8f6e0777ca0635cacc6cb1 to `v1.34`.=
 See<br>
&gt; &gt; +that commit for the full description.<br>
&gt; &gt; +<br>
&gt; &gt; +Application code that c-ares calls while using a connection can<=
br>
&gt; &gt; +reconfigure the servers and so tear that connection down. That i=
ncludes<br>
&gt; &gt; +the socket functions from `ares_set_socket_functions_ex()` and t=
he older<br>
&gt; &gt; +`ares_set_socket_functions()`, and the pending-write callback. c=
-ares<br>
&gt; &gt; +now notices this while opening, writing to, reading from or clos=
ing a<br>
&gt; &gt; +connection. It requeues the affected queries, or drops the stale=
 data,<br>
&gt; &gt; +instead of continuing to use the connection.<br>
&gt; &gt; +<br>
&gt; &gt; +It applied cleanly on top of the dd62bdfc and #1340 backports (#=
1338).<br>
&gt; &gt; +Test file contents match `main`.<br>
&gt; &gt; +<br>
&gt; &gt; +Each of the 11 new tests fails on `v1.34` without this change: n=
ine with<br>
&gt; &gt; +an ASAN heap-use-after-free, and the two receive tests on their<=
br>
&gt; &gt; +assertions. All 11 pass with it. The full non-live suite passes =
674/674<br>
&gt; &gt; +under ASAN+UBSAN and with `-DCARES_WERROR=3DON` on macOS.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Brad House &lt;<a href=3D"mailto:brad@brad-house.=
com" target=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Co-authored-by: Mar &lt;<a href=3D"mailto:mardgez13@gmail.com" t=
arget=3D"_blank">mardgez13@gmail.com</a>&gt;<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/c-ares/=
c-" rel=3D"noreferrer" target=3D"_blank">https://github.com/c-ares/c-</a><b=
r>
&gt; ares/commit/13a10dddbabc30b6fca8e23f9efff73fedba9401]<br>
&gt; &gt; +GHSA: GHSA-pj7p-v3cw-hq66<br>
&gt; &gt; +---<br>
&gt; &gt; + src/lib/ares_close_sockets.c |=C2=A0 =C2=A07 +-<br>
&gt; &gt; + src/lib/ares_conn.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2=
9 ++<br>
&gt; &gt; + src/lib/ares_process.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 65 ++-=
<br>
&gt; &gt; + test/ares-test-mock.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0| 842 ++++++++=
+++++++++++++++++++++++++++<br>
&gt; &gt; + 4 files changed, 935 insertions(+), 8 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/lib/ares_close_sockets.c b/src/lib/ares_close_s=
ockets.c<br>
&gt; &gt; +index 6be662fdd3..a3af721bc6 100644<br>
&gt; &gt; +--- a/src/lib/ares_close_sockets.c<br>
&gt; &gt; ++++ b/src/lib/ares_close_sockets.c<br>
&gt; &gt; +@@ -148,6 +148,7 @@ void ares_check_cleanup_conns(const<br>
&gt; ares_channel_t *channel)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return; /* LCOV_EXCL_LINE: DefensiveCoding *=
/<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++restart:<br>
&gt; &gt; +=C2=A0 =C2=A0/* Iterate across each server */<br>
&gt; &gt; +=C2=A0 =C2=A0for (snode =3D ares_slist_node_first(channel-&gt;se=
rvers); snode !=3D NULL;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 snode =3D ares_slist_node_next(snode=
)) {<br>
&gt; &gt; +@@ -190,8 +191,12 @@ void ares_check_cleanup_conns(const<br>
&gt; ares_channel_t *channel)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 /* Clean it up */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 /* Clean it up.=C2=A0 The close function i=
s application code and may have<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* reconfigured the servers, freeing =
the list nodes this walk holds --<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* the server&#39;s, and the next con=
nection&#39;s.=C2=A0 Start over; connections<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* already closed are no longer liste=
d, so this ends. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ares_close_connection(conn, ARES_SUCC=
ESS);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 goto restart;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; + }<br>
&gt; &gt; +diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c<br>
&gt; &gt; +index 4cc0d1871d..5e0827fbdf 100644<br>
&gt; &gt; +--- a/src/lib/ares_conn.c<br>
&gt; &gt; ++++ b/src/lib/ares_conn.c<br>
&gt; &gt; +@@ -262,6 +262,15 @@ ares_conn_err_t ares_conn_read(ares_conn_t<=
br>
&gt; *conn, void *data, size_t len,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0err =3D ares_socket_recv(channel, conn-&gt;f=
d, ARES_TRUE, data, len,<br>
&gt; read_bytes);<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* The receive function is application code and may have=
 reconfigured the<br>
&gt; &gt; ++=C2=A0 =C2=A0* servers, tearing this connection down.=C2=A0 Not=
hing read from it can be<br>
&gt; &gt; ++=C2=A0 =C2=A0* matched any more -- its queries have moved to th=
e new configuration --<br>
&gt; &gt; ++=C2=A0 =C2=A0* and its descriptor is gone, so it must not be re=
ad again. */<br>
&gt; &gt; ++=C2=A0 if (conn-&gt;flags &amp; ARES_CONN_FLAG_DEAD) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 *read_bytes =3D 0;<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_CONN_ERR_CONNCLOSED;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0/* Toggle connected state if needed */<br>
&gt; &gt; +=C2=A0 =C2=A0if (err =3D=3D ARES_CONN_ERR_SUCCESS) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0conn-&gt;state_flags |=3D ARES_CONN_STATE_CO=
NNECTED;<br>
&gt; &gt; +@@ -408,6 +417,19 @@ ares_conn_err_t ares_conn_write(ares_conn_t=
<br>
&gt; *conn, const void *data, size_t len,<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; + done:<br>
&gt; &gt; ++=C2=A0 /* The send function -- from ares_set_socket_functions_e=
x() or the legacy<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_set_socket_functions() -- and on the first =
TCP Fast Open write the<br>
&gt; &gt; ++=C2=A0 =C2=A0* getsockname function, are application code and m=
ay have reconfigured<br>
&gt; the<br>
&gt; &gt; ++=C2=A0 =C2=A0* servers, tearing this connection down.=C2=A0 Wha=
tever the write returned,<br>
&gt; &gt; ++=C2=A0 =C2=A0* nothing written here can be answered any more, a=
nd the descriptor has<br>
&gt; &gt; ++=C2=A0 =C2=A0* already been closed or handed to the close notif=
ication, so there is no<br>
&gt; &gt; ++=C2=A0 =C2=A0* socket state left to report.=C2=A0 Say so, so ev=
ery caller treats it as the<br>
&gt; &gt; ++=C2=A0 =C2=A0* connection failure it is. */<br>
&gt; &gt; ++=C2=A0 if (conn-&gt;flags &amp; ARES_CONN_FLAG_DEAD) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 *written =3D 0;<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_CONN_ERR_CONNCLOSED;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0if (err =3D=3D ARES_CONN_ERR_SUCCESS &amp;&amp; len=
 =3D=3D *written) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Wrote all data, make sure we&#39;re not l=
istening for write events unless<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * using TFO, in which case we&#39;ll need a=
 write event to know when<br>
&gt; &gt; +@@ -644,6 +666,13 @@ ares_status_t ares_open_connection(ares_con=
n_t<br>
&gt; **conn_out,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0goto done; /* LCOV_EXCL_LINE: UntestablePath=
 */<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* The getsockname function is application code as well,=
 and may have<br>
&gt; &gt; ++=C2=A0 =C2=A0* reconfigured the servers the same way. */<br>
&gt; &gt; ++=C2=A0 if (!ares_server_in_channel(channel, server)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 status =3D ARES_ECONNREFUSED;<br>
&gt; &gt; ++=C2=A0 =C2=A0 goto done;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0/* TCP connections are thrown to the end as we don&=
#39;t spawn multiple TCP<br>
&gt; &gt; +=C2=A0 =C2=A0 * connections. UDP connections are put on front wh=
ere the newest<br>
&gt; connection<br>
&gt; &gt; +=C2=A0 =C2=A0 * can be quickly pulled */<br>
&gt; &gt; +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c<br>
&gt; &gt; +index 88536704ad..5686b077a6 100644<br>
&gt; &gt; +--- a/src/lib/ares_process.c<br>
&gt; &gt; ++++ b/src/lib/ares_process.c<br>
&gt; &gt; +@@ -189,7 +189,9 @@ static void server_increment_failures(ares_s=
erver_t<br>
&gt; *server,<br>
&gt; &gt; +=C2=A0 =C2=A0ares_timeval_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 next_retr=
y_time;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0node =3D ares_slist_node_find(channel-&gt;servers, =
server);<br>
&gt; &gt; +-=C2=A0 if (node =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 /* Matches by sort key, not identity, so a removed serve=
r can match the live<br>
&gt; &gt; ++=C2=A0 =C2=A0* one that replaced it at the same configuration i=
ndex. */<br>
&gt; &gt; ++=C2=A0 if (node =3D=3D NULL || ares_slist_node_val(node) !=3D s=
erver) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return; /* LCOV_EXCL_LINE: DefensiveCoding *=
/<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -220,7 +222,9 @@ static void server_set_good(ares_server_t *s=
erver,<br>
&gt; ares_bool_t used_tcp)<br>
&gt; &gt; +=C2=A0 =C2=A0const ares_channel_t *channel =3D server-&gt;channe=
l;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0node =3D ares_slist_node_find(channel-&gt;servers, =
server);<br>
&gt; &gt; +-=C2=A0 if (node =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 /* Matches by sort key, not identity, so a removed serve=
r can match the live<br>
&gt; &gt; ++=C2=A0 =C2=A0* one that replaced it at the same configuration i=
ndex. */<br>
&gt; &gt; ++=C2=A0 if (node =3D=3D NULL || ares_slist_node_val(node) !=3D s=
erver) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return; /* LCOV_EXCL_LINE: DefensiveCoding *=
/<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -501,21 +505,39 @@ void ares_process_pending_write(ares_chann=
el_t<br>
&gt; *channel)<br>
&gt; &gt; +=C2=A0 =C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0channel-&gt;notify_pending_write =3D ARES_FALSE;<br=
>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 for (node =3D ares_slist_node_first(channel-&gt;servers)=
; node !=3D NULL;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0node =3D ares_slist_node_next(node))=
 {<br>
&gt; &gt; +-=C2=A0 =C2=A0 ares_server_t *server =3D ares_slist_node_val(nod=
e);<br>
&gt; &gt; +-=C2=A0 =C2=A0 ares_conn_t=C2=A0 =C2=A0*conn=C2=A0 =C2=A0=3D ser=
ver-&gt;tcp_conn;<br>
&gt; &gt; ++=C2=A0 node =3D ares_slist_node_first(channel-&gt;servers);<br>
&gt; &gt; ++=C2=A0 while (node !=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_server_t *server=C2=A0 =C2=A0 =C2=A0=3D ares=
_slist_node_val(node);<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_conn_t=C2=A0 =C2=A0*conn=C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D server-&gt;tcp_conn;<br>
&gt; &gt; ++=C2=A0 =C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0generatio=
n =3D channel-&gt;servers_generation;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ares_status_t=C2=A0 status;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (conn =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 node =3D ares_slist_node_next(node);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 /* Enqueue any pending data if there is any */<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 /* Enqueue any pending data if there is any.=C2=
=A0 The flush runs the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* application&#39;s send function, which ma=
y have reconfigured the servers<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* and removed this one; its connection is t=
hen already closed, which<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* handle_conn_error() ignores. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0status =3D ares_conn_flush(conn);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0handle_conn_error(conn, ARES_TRUE, st=
atus);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Tearing down a connection runs the callbacks o=
f the queries it ends,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* and those may reconfigure the servers too=
, destroying the ones the new<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* configuration omits along with their list=
 nodes.=C2=A0 A failure also moves<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* this server further down the list.=C2=A0 =
So when either may have happened,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* start over from the head rather than step=
 from this node; flushing a<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* connection again is harmless. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (status !=3D ARES_SUCCESS || channel-&gt;serve=
rs_generation !=3D<br>
&gt; generation) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 node =3D ares_slist_node_first(channel-&gt=
;servers);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 node =3D ares_slist_node_next(node);<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0ares_deferred_cb_leave(channel);<br>
&gt; &gt; +@@ -902,6 +924,13 @@ static ares_status_t process_read(ares_chan=
nel_t<br>
&gt; *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* A later call to the receive function may have reconfi=
gured the servers,<br>
&gt; &gt; ++=C2=A0 =C2=A0* tearing this connection down after earlier calls=
 buffered answers on it.<br>
&gt; &gt; ++=C2=A0 =C2=A0* Its queries have moved to the new configuration,=
 so drop the answers. */<br>
&gt; &gt; ++=C2=A0 if (conn-&gt;flags &amp; ARES_CONN_FLAG_DEAD) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_SUCCESS;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0status =3D read_answers(conn, now);<br>
&gt; &gt; +=C2=A0 =C2=A0if (status !=3D ARES_SUCCESS) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; &gt; +@@ -1192,6 +1221,15 @@ static void handle_conn_error(ares_conn_t=
 *conn,<br>
&gt; ares_bool_t critical_failure,<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_server_t *server =3D conn-&gt;server;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* Already torn down, most likely by a reconfiguration f=
rom application code<br>
&gt; &gt; ++=C2=A0 =C2=A0* the failing call ran, such as the send function.=
=C2=A0 Its queries have been<br>
&gt; &gt; ++=C2=A0 =C2=A0* requeued, and its server did not fail -- it was =
removed, or the<br>
&gt; &gt; ++=C2=A0 =C2=A0* connection was closed deliberately -- so there i=
s nothing to record and<br>
&gt; &gt; ++=C2=A0 =C2=A0* nothing left to close. */<br>
&gt; &gt; ++=C2=A0 if (conn-&gt;flags &amp; ARES_CONN_FLAG_DEAD) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0/* Increment failures first before requeue so it is=
 unlikely to requeue<br>
&gt; &gt; +=C2=A0 =C2=A0 * to the same server */<br>
&gt; &gt; +=C2=A0 =C2=A0if (critical_failure) {<br>
&gt; &gt; +@@ -1508,6 +1546,14 @@ static ares_status_t<br>
&gt; ares_conn_query_write(ares_conn_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *c=
onn,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0conn-&gt;flags &amp; ARES_CONN_FLAG_T=
CP) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0channel-&gt;notify_pending_write =3D ARES_TR=
UE;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0channel-&gt;notify_pending_write_cb(channel-=
<br>
&gt; &gt;notify_pending_write_cb_data);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* The callback is application code and may have =
reconfigured the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* servers, closing this connection with the=
 query already buffered on<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* it.=C2=A0 Report it as a connection failu=
re so the query is requeued rather<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* than attached to the closed connection. *=
/<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (conn-&gt;flags &amp; ARES_CONN_FLAG_DEAD) {<b=
r>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 return ARES_ECONNREFUSED;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ARES_SUCCESS;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -1650,6 +1696,11 @@ static ares_status_t<br>
&gt; ares_send_query_int(ares_server_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 *requeste=
d_server,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ARES_ECANCELLED;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* Application code that tore this connection down durin=
g the write -- the<br>
&gt; &gt; ++=C2=A0 =C2=A0* send function, or the pending-write callback whe=
n the write is deferred,<br>
&gt; &gt; ++=C2=A0 =C2=A0* reconfiguring the servers, say -- surfaces here =
as<br>
&gt; ARES_ECONNREFUSED,<br>
&gt; &gt; ++=C2=A0 =C2=A0* even if the send itself reported success or neve=
r happened, so the query<br>
&gt; &gt; ++=C2=A0 =C2=A0* is requeued below rather than attached to the cl=
osed connection. */<br>
&gt; &gt; +=C2=A0 =C2=A0switch (status) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Good result, continue on */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case ARES_SUCCESS:<br>
&gt; &gt; +diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc<br>
&gt; &gt; +index 4b409db7c3..f1d9d360e7 100644<br>
&gt; &gt; +--- a/test/ares-test-mock.cc<br>
&gt; &gt; ++++ b/test/ares-test-mock.cc<br>
&gt; &gt; +@@ -2593,6 +2593,86 @@ INSTANTIATE_TEST_SUITE_P(AddressFamilies,=
<br>
&gt; MockUDPSingleTryTest,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ::testing::ValuesIn(ares::test::families),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PrintFamily);<br>
&gt; &gt; +<br>
&gt; &gt; ++// ares_process_pending_write() flushes each server&#39;s TCP c=
onnection.=C2=A0 A<br>
&gt; flush<br>
&gt; &gt; ++// that fails tears the connection down, which ends a query tha=
t is out of<br>
&gt; &gt; ++// retries and runs its callback right there.=C2=A0 A callback =
that reconfigures the<br>
&gt; &gt; ++// servers removes the one being flushed, and the walk must not=
 go on to use<br>
&gt; &gt; ++// that server, its connection or its place in the list.<br>
&gt; &gt; ++class MockTCPSingleTryStayOpenTest<br>
&gt; &gt; ++=C2=A0 : public MockChannelOptsTest,<br>
&gt; &gt; ++=C2=A0 =C2=A0 public ::testing::WithParamInterface&lt;int&gt; {=
<br>
&gt; &gt; ++public:<br>
&gt; &gt; ++=C2=A0 MockTCPSingleTryStayOpenTest()<br>
&gt; &gt; ++=C2=A0 =C2=A0 : MockChannelOptsTest(1, GetParam(), true, false,=
 FillOptions(&amp;opts_),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_OPT_TRIES | ARES_OPT_FLAGS)<br>
&gt; &gt; ++=C2=A0 {<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 static struct ares_options *FillOptions(struct ares_opti=
ons *opts)<br>
&gt; &gt; ++=C2=A0 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 memset(opts, 0, sizeof(struct ares_options));<br>
&gt; &gt; ++=C2=A0 =C2=A0 opts-&gt;tries =3D 1;<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* ARES_OPT_FLAGS replaces the defaults, which in=
clude EDNS. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 opts-&gt;flags =3D ARES_FLAG_STAYOPEN | ARES_FLAG=
_EDNS;<br>
&gt; &gt; ++=C2=A0 =C2=A0 return opts;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++private:<br>
&gt; &gt; ++=C2=A0 struct ares_options opts_;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void PendingWriteNotifyCallback(void *data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 *static_cast&lt;bool *&gt;(data) =3D true;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_P(MockTCPSingleTryStayOpenTest,<br>
&gt; ReconfigureInPendingWriteFailureCallback) {<br>
&gt; &gt; ++=C2=A0 DNSPacket rsp;<br>
&gt; &gt; ++=C2=A0 rsp.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;<a href=3D"ht=
tp://www.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a=
>&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;<a href=3D"http://ww=
w.google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;=
, 100, {2, 3, 4, 5}));<br>
&gt; &gt; ++=C2=A0 ON_CALL(server_, OnRequest(&quot;<a href=3D"http://www.g=
oogle.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, T=
_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillByDefault(SetReply(&amp;server_, &amp;rsp));=
<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Answered, so the TCP connection is connected; STAYOPE=
N keeps it. */<br>
&gt; &gt; ++=C2=A0 QueryResult first;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
google.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, =
ARES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 QueryCallback, &amp;first, NULL);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(first.done_);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* From here writes on that connection wait for ares_pro=
cess_pending_write.<br>
&gt; */<br>
&gt; &gt; ++=C2=A0 bool pending =3D false;<br>
&gt; &gt; ++=C2=A0 ares_set_pending_write_cb(channel_, PendingWriteNotifyCa=
llback,<br>
&gt; &amp;pending);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CancelInCbData data;<br>
&gt; &gt; ++=C2=A0 data.channel =3D channel_;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.cbs=C2=A0 =C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;<a href=3D"http://www.=
example.com" rel=3D"noreferrer" target=3D"_blank">www.example.com</a>&quot;=
, ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ARES_REC_TYPE_A, ReconfigureServersCallback, &amp;data,<br>
&gt; NULL);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(pending);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.done);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* ares_set_socket_functions() stores the pointer rather=
 than copying it. */<br>
&gt; &gt; ++=C2=A0 static ares_socket_functions sock_funcs;<br>
&gt; &gt; ++=C2=A0 memset(&amp;sock_funcs, 0, sizeof(sock_funcs));<br>
&gt; &gt; ++=C2=A0 sock_funcs.asendv =3D ares_sendv_fail;<br>
&gt; &gt; ++=C2=A0 ares_set_socket_functions(channel_, &amp;sock_funcs, NUL=
L);<br>
&gt; &gt; ++=C2=A0 LibraryTest::SetFailSend();<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_process_pending_write(channel_);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, data.cbs);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_set_pending_write_cb(channel_, NULL, NULL);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++INSTANTIATE_TEST_SUITE_P(AddressFamilies,<br>
&gt; MockTCPSingleTryStayOpenTest,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0::testing::ValuesIn(ares::test::families),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0PrintFamily);<br>
&gt; &gt; ++<br>
&gt; &gt; + TEST_P(MockUDPChannelTest, CancelInDestroyCallbackNoUseAfterFre=
e) {<br>
&gt; &gt; +=C2=A0 =C2=A0CancelInCbData data;<br>
&gt; &gt; +=C2=A0 =C2=A0data.channel =3D channel_;<br>
&gt; &gt; +@@ -2898,6 +2978,768 @@ TEST_F(LibraryTest,<br>
&gt; ReconfigureInConfigureHookNoUseAfterFree) {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_destroy(chan);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++// Reconfiguring the servers from the application&#39;s own sen=
d function.=C2=A0 The<br>
&gt; &gt; ++// write itself goes through: the send function reports every b=
yte sent.=C2=A0 But<br>
&gt; &gt; ++// the reconfiguration has already closed the connection being =
written to and<br>
&gt; &gt; ++// removed its server, so the query must be moved to the new co=
nfiguration<br>
&gt; &gt; ++// rather than attached to the closed connection -- where it wo=
uld sit on a<br>
&gt; &gt; ++// list that is freed once the call unwinds, in flight on no so=
cket.<br>
&gt; &gt; ++struct ReconfigureFromSendData {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0statu=
s;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static ares_ssize_t ReconfigureSendv(ares_socket_t fd, const st=
ruct iovec<br>
&gt; *iov,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int io=
vcnt, void *user_data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ReconfigureFromSendData *d =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 static_cast&lt;ReconfigureFromSendData *&gt;(user=
_data);<br>
&gt; &gt; ++=C2=A0 ares_ssize_t len =3D 0;<br>
&gt; &gt; ++=C2=A0 (void)fd;<br>
&gt; &gt; ++=C2=A0 for (int i =3D 0; i &lt; iovcnt; i++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 len +=3D static_cast&lt;ares_ssize_t&gt;(iov[i].i=
ov_len);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 // Frees the server this connection belongs to.=C2=A0 Re=
configuring to the same<br>
&gt; &gt; ++=C2=A0 // list again is a no-op, so the retry is written normal=
ly.<br>
&gt; &gt; ++=C2=A0 ares_set_servers_csv(d-&gt;channel, &quot;<a href=3D"htt=
p://127.0.0.1:53056" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:53056</=
a>&quot;);<br>
&gt; &gt; ++=C2=A0 return len;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void ReconfigureFromSendCallback(void *arg, ares_status_=
t status,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const ares_dns_record_t *dnsrec)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ReconfigureFromSendData *d =3D static_cast&lt;Reconfigur=
eFromSendData<br>
&gt; *&gt;(arg);<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 d-&gt;done=C2=A0 =C2=A0=3D true;<br>
&gt; &gt; ++=C2=A0 d-&gt;status =3D static_cast&lt;int&gt;(status);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, ReconfigureInSuccessfulSendNoUseAfterFree) =
{<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*chan =
=3D nullptr;<br>
&gt; &gt; ++=C2=A0 struct ares_options=C2=A0 =C2=A0 =C2=A0opts;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0optmask =3D 0;<br>
&gt; &gt; ++=C2=A0 ares_socket_functions=C2=A0 =C2=A0funcs;<br>
&gt; &gt; ++=C2=A0 ReconfigureFromSendData data;<br>
&gt; &gt; ++=C2=A0 ares_socket_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0so=
cks[ARES_GETSOCK_MAXNUM];<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 opts.flags=C2=A0 =3D ARES_FLAG_NOSEARCH;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 |=3D ARES_OPT_FLAGS;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_init_options(&amp;chan, &am=
p;opts,<br>
&gt; optmask));<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,<br>
&gt; &quot;<a href=3D"http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53055</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.channel =3D chan;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.status=C2=A0 =3D ARES_SUCCESS;<br>
&gt; &gt; ++=C2=A0 memset(&amp;funcs, 0, sizeof(funcs));<br>
&gt; &gt; ++=C2=A0 funcs.asendv =3D ReconfigureSendv;<br>
&gt; &gt; ++=C2=A0 ares_set_socket_functions(chan, &amp;funcs, &amp;data);<=
br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ReconfigureFromSendCallback, &amp;data, NULL);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Moved to the new server and written there, so it is i=
n flight on a<br>
&gt; &gt; ++=C2=A0 // socket the application can watch.<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++=C2=A0 EXPECT_NE(0, ares_getsock(chan, socks, ARES_GETSOCK_MAXN=
UM));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_cancel(chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_ECANCELLED, data.status);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The connection the send function tore down has already been =
reported as<br>
&gt; &gt; ++// closed, and its descriptor closed or handed to that notifica=
tion.=C2=A0 Nothing<br>
&gt; &gt; ++// after the send may report socket state for it: doing so name=
s<br>
&gt; &gt; ++// ARES_SOCKET_BAD, a descriptor the application was never give=
n.<br>
&gt; &gt; ++struct BadSocketStateData {<br>
&gt; &gt; ++=C2=A0 size_t calls;<br>
&gt; &gt; ++=C2=A0 size_t bad;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void BadSocketStateCallback(void *data, ares_socket_t so=
cket_fd,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int readable,=
 int writable)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 BadSocketStateData *d =3D static_cast&lt;BadSocketStateD=
ata *&gt;(data);<br>
&gt; &gt; ++=C2=A0 (void)readable;<br>
&gt; &gt; ++=C2=A0 (void)writable;<br>
&gt; &gt; ++=C2=A0 d-&gt;calls++;<br>
&gt; &gt; ++=C2=A0 if (socket_fd =3D=3D ARES_SOCKET_BAD) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;bad++;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, ReconfigureInSendReportsNoBadSocket) {<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*chan =
=3D nullptr;<br>
&gt; &gt; ++=C2=A0 struct ares_options=C2=A0 =C2=A0 =C2=A0opts;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0optmask =3D 0;<br>
&gt; &gt; ++=C2=A0 ares_socket_functions=C2=A0 =C2=A0funcs;<br>
&gt; &gt; ++=C2=A0 ReconfigureFromSendData data;<br>
&gt; &gt; ++=C2=A0 BadSocketStateData=C2=A0 =C2=A0 =C2=A0 sock;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 memset(&amp;sock, 0, sizeof(sock));<br>
&gt; &gt; ++=C2=A0 opts.flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D ARES_FLAG_NOSEARCH;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=3D ARES_OPT_FLAGS;<br>
&gt; &gt; ++=C2=A0 opts.sock_state_cb=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D BadSock=
etStateCallback;<br>
&gt; &gt; ++=C2=A0 opts.sock_state_cb_data=C2=A0 =3D &amp;sock;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=3D ARES_OPT_SOCK_STATE_CB;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_init_options(&amp;chan, &am=
p;opts,<br>
&gt; optmask));<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,<br>
&gt; &quot;<a href=3D"http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53055</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.channel =3D chan;<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =3D false;<br>
&gt; &gt; ++=C2=A0 data.status=C2=A0 =3D ARES_SUCCESS;<br>
&gt; &gt; ++=C2=A0 memset(&amp;funcs, 0, sizeof(funcs));<br>
&gt; &gt; ++=C2=A0 funcs.asendv =3D ReconfigureSendv;<br>
&gt; &gt; ++=C2=A0 ares_set_socket_functions(chan, &amp;funcs, &amp;data);<=
br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ReconfigureFromSendCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 ares_cancel(chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_NE((size_t)0, sock.calls);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, sock.bad);<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The same reconfiguration from the send function, reached thr=
ough the<br>
&gt; &gt; ++// deferred TCP write: ares_set_pending_write_cb() queues the w=
rite and the<br>
&gt; &gt; ++// application later flushes it with ares_process_pending_write=
().=C2=A0 That flush<br>
&gt; &gt; ++// is its own outermost library call, so the connection and ser=
ver the<br>
&gt; &gt; ++// reconfiguration closes must stay readable until it returns, =
and its walk of<br>
&gt; &gt; ++// the server list must not step from a list node the reconfigu=
ration freed.<br>
&gt; &gt; ++// Covers both a send that reports success and one that fails.=
=C2=A0 A failure<br>
&gt; &gt; ++// on the removed server must not be charged to the server that=
 replaced it.<br>
&gt; &gt; ++struct PendingWriteReconfigureData {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *channel;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reconfigur=
e;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fail;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pending;<b=
r>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done;<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 server_failures=
;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static int PendingWriteConnect(ares_socket_t fd, const struct s=
ockaddr *addr,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_socklen_t addrlen, voi=
d *user_data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 (void)fd;<br>
&gt; &gt; ++=C2=A0 (void)addr;<br>
&gt; &gt; ++=C2=A0 (void)addrlen;<br>
&gt; &gt; ++=C2=A0 (void)user_data;<br>
&gt; &gt; ++=C2=A0 // Pretend the connection is in progress; the test signa=
ls it writable.<br>
&gt; &gt; ++=C2=A0 return 0;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static ares_ssize_t PendingWriteSendv(ares_socket_t fd, const s=
truct iovec<br>
&gt; *iov,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int i=
ovcnt, void *user_data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 PendingWriteReconfigureData *d =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 static_cast&lt;PendingWriteReconfigureData *&gt;(=
user_data);<br>
&gt; &gt; ++=C2=A0 ares_ssize_t len =3D 0;<br>
&gt; &gt; ++=C2=A0 (void)fd;<br>
&gt; &gt; ++=C2=A0 for (int i =3D 0; i &lt; iovcnt; i++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 len +=3D static_cast&lt;ares_ssize_t&gt;(iov[i].i=
ov_len);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 if (!d-&gt;reconfigure) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return len;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 d-&gt;reconfigure =3D false;<br>
&gt; &gt; ++=C2=A0 // Closes this connection and frees its server.<br>
&gt; &gt; ++=C2=A0 ares_set_servers_csv(d-&gt;channel, &quot;<a href=3D"htt=
p://127.0.0.1:53056" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:53056</=
a>&quot;);<br>
&gt; &gt; ++=C2=A0 if (d-&gt;fail) {<br>
&gt; &gt; ++#ifdef USE_WINSOCK<br>
&gt; &gt; ++=C2=A0 =C2=A0 WSASetLastError(WSAECONNREFUSED);<br>
&gt; &gt; ++#else<br>
&gt; &gt; ++=C2=A0 =C2=A0 errno =3D ECONNREFUSED;<br>
&gt; &gt; ++#endif<br>
&gt; &gt; ++=C2=A0 =C2=A0 return -1;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 return len;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void PendingWriteNotify(void *user_data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 PendingWriteReconfigureData *d =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 static_cast&lt;PendingWriteReconfigureData *&gt;(=
user_data);<br>
&gt; &gt; ++=C2=A0 d-&gt;pending =3D true;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void PendingWriteServerState(const char *server_string,<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_bool_t =
success, int flags,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *user_d=
ata)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 PendingWriteReconfigureData *d =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 static_cast&lt;PendingWriteReconfigureData *&gt;(=
user_data);<br>
&gt; &gt; ++=C2=A0 (void)server_string;<br>
&gt; &gt; ++=C2=A0 (void)flags;<br>
&gt; &gt; ++=C2=A0 if (!success) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;server_failures++;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void PendingWriteCallback(void *arg, ares_status_t statu=
s,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const ares_dns_recor=
d_t *dnsrec)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 PendingWriteReconfigureData *d =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 static_cast&lt;PendingWriteReconfigureData *&gt;(=
arg);<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_ECANCELLED, status);<br>
&gt; &gt; ++=C2=A0 d-&gt;done++;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void ReconfigureInPendingWrite(bool fail)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 struct ares_options=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt=
s;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optmask =3D 0;<br>
&gt; &gt; ++=C2=A0 ares_socket_functions=C2=A0 =C2=A0 =C2=A0 =C2=A0funcs;<b=
r>
&gt; &gt; ++=C2=A0 PendingWriteReconfigureData data;<br>
&gt; &gt; ++=C2=A0 ares_socket_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0socks[ARES_GETSOCK_MAXNUM];<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitmask;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 opts.flags=C2=A0 =3D ARES_FLAG_NOSEARCH | ARES_FLAG_USEV=
C;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 |=3D ARES_OPT_FLAGS;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_init_options(&amp;chan, &am=
p;opts,<br>
&gt; optmask));<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,<br>
&gt; &quot;<a href=3D"http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53055</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.channel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D chan;<=
br>
&gt; &gt; ++=C2=A0 data.reconfigure=C2=A0 =C2=A0 =C2=A0=3D false;<br>
&gt; &gt; ++=C2=A0 data.fail=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D f=
ail;<br>
&gt; &gt; ++=C2=A0 data.pending=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D false;=
<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0=
;<br>
&gt; &gt; ++=C2=A0 data.server_failures =3D 0;<br>
&gt; &gt; ++=C2=A0 memset(&amp;funcs, 0, sizeof(funcs));<br>
&gt; &gt; ++=C2=A0 funcs.aconnect =3D PendingWriteConnect;<br>
&gt; &gt; ++=C2=A0 funcs.asendv=C2=A0 =C2=A0=3D PendingWriteSendv;<br>
&gt; &gt; ++=C2=A0 ares_set_socket_functions(chan, &amp;funcs, &amp;data);<=
br>
&gt; &gt; ++=C2=A0 ares_set_pending_write_cb(chan, PendingWriteNotify, &amp=
;data);<br>
&gt; &gt; ++=C2=A0 ares_set_server_state_callback(chan, PendingWriteServerS=
tate, &amp;data);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // The first query opens the connection; its write waits=
 for it to connect.<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PendingWriteCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 bitmask =3D ares_getsock(chan, socks, ARES_GETSOCK_MAXNU=
M);<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(0, ARES_GETSOCK_WRITABLE(bitmask, 0));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Report it connected, which writes the first query.<br=
>
&gt; &gt; ++=C2=A0 ares_process_fd(chan, ARES_SOCKET_BAD, socks[0]);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.pending);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Now connected, so the second query&#39;s write is def=
erred to the<br>
&gt; &gt; ++=C2=A0 // application.<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.exam=
ple.com" rel=3D"noreferrer" target=3D"_blank">www.example.com</a>&quot;, AR=
ES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PendingWriteCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.pending);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.reconfigure =3D true;<br>
&gt; &gt; ++=C2=A0 ares_process_pending_write(chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.reconfigure);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Both queries were moved to the new server, which has =
not failed.<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, data.server_failures);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)2, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_cancel(chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)2, data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, ReconfigureInSuccessfulPendingWriteNoUseAft=
erFree)<br>
&gt; {<br>
&gt; &gt; ++=C2=A0 ReconfigureInPendingWrite(false);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, ReconfigureInFailedPendingWriteNoUseAfterFr=
ee) {<br>
&gt; &gt; ++=C2=A0 ReconfigureInPendingWrite(true);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The pending-write callback is application code too, and runs=
 once the<br>
&gt; query<br>
&gt; &gt; ++// has been buffered on the connection.=C2=A0 Reconfiguring fro=
m it closes that<br>
&gt; &gt; ++// connection, so the query must be requeued rather than attach=
ed to it.<br>
&gt; &gt; ++static void PendingWriteReconfigureNotify(void *user_data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 PendingWriteReconfigureData *d =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 static_cast&lt;PendingWriteReconfigureData *&gt;(=
user_data);<br>
&gt; &gt; ++=C2=A0 d-&gt;pending =3D true;<br>
&gt; &gt; ++=C2=A0 if (d-&gt;reconfigure) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;reconfigure =3D false;<br>
&gt; &gt; ++=C2=A0 =C2=A0 // Closes the connection the query was just buffe=
red on.<br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_set_servers_csv(d-&gt;channel, &quot;<a href=
=3D"http://127.0.0.1:53056" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:=
53056</a>&quot;);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, ReconfigureInPendingWriteCallbackNoUseAfter=
Free) {<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 struct ares_options=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt=
s;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optmask =3D 0;<br>
&gt; &gt; ++=C2=A0 ares_socket_functions=C2=A0 =C2=A0 =C2=A0 =C2=A0funcs;<b=
r>
&gt; &gt; ++=C2=A0 PendingWriteReconfigureData data;<br>
&gt; &gt; ++=C2=A0 ares_socket_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0socks[ARES_GETSOCK_MAXNUM];<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitmask;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 opts.flags=C2=A0 =3D ARES_FLAG_NOSEARCH | ARES_FLAG_USEV=
C;<br>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 |=3D ARES_OPT_FLAGS;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_init_options(&amp;chan, &am=
p;opts,<br>
&gt; optmask));<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(chan,<br>
&gt; &quot;<a href=3D"http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53055</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.channel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D chan;<=
br>
&gt; &gt; ++=C2=A0 data.reconfigure=C2=A0 =C2=A0 =C2=A0=3D false;<br>
&gt; &gt; ++=C2=A0 data.fail=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D f=
alse;<br>
&gt; &gt; ++=C2=A0 data.pending=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D false;=
<br>
&gt; &gt; ++=C2=A0 data.done=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0=
;<br>
&gt; &gt; ++=C2=A0 data.server_failures =3D 0;<br>
&gt; &gt; ++=C2=A0 memset(&amp;funcs, 0, sizeof(funcs));<br>
&gt; &gt; ++=C2=A0 funcs.aconnect =3D PendingWriteConnect;<br>
&gt; &gt; ++=C2=A0 funcs.asendv=C2=A0 =C2=A0=3D PendingWriteSendv;<br>
&gt; &gt; ++=C2=A0 ares_set_socket_functions(chan, &amp;funcs, &amp;data);<=
br>
&gt; &gt; ++=C2=A0 ares_set_pending_write_cb(chan, PendingWriteReconfigureN=
otify, &amp;data);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // The first query opens the connection; its write waits=
 for it to connect.<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PendingWriteCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 bitmask =3D ares_getsock(chan, socks, ARES_GETSOCK_MAXNU=
M);<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(0, ARES_GETSOCK_WRITABLE(bitmask, 0));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Report it connected, which writes the first query.<br=
>
&gt; &gt; ++=C2=A0 ares_process_fd(chan, ARES_SOCKET_BAD, socks[0]);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.pending);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Now connected, so the second query is buffered and th=
e pending-write<br>
&gt; &gt; ++=C2=A0 // callback runs, reconfiguring the servers.<br>
&gt; &gt; ++=C2=A0 data.reconfigure =3D true;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.exam=
ple.com" rel=3D"noreferrer" target=3D"_blank">www.example.com</a>&quot;, AR=
ES_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PendingWriteCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.pending);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.reconfigure);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Both queries were moved to the new server.<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)2, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_cancel(chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)2, data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Fake socket functions, installed with ares_set_socket_functi=
ons_ex(), that<br>
&gt; &gt; ++// never touch a real descriptor.=C2=A0 Each test arms one of t=
hem to reconfigure<br>
&gt; &gt; ++// the servers part-way through c-ares&#39;s use of a connectio=
n, and they count<br>
&gt; &gt; ++// every call that names ARES_SOCKET_BAD, which a closed connec=
tion<br>
&gt; must never<br>
&gt; &gt; ++// pass to application code.<br>
&gt; &gt; ++struct FakeSockData {<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 *channel;<br>
&gt; &gt; ++=C2=A0 ares_socket_t=C2=A0 =C2=A0 =C2=A0 next_fd;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tfo;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0getsockname_fail_first;<br>
&gt; &gt; ++=C2=A0 ares_socket_t=C2=A0 =C2=A0 =C2=A0 getsockname_last_fd;<b=
r>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0getsockname_reconfigure;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0recv_reconfigure;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0recv_answer_then_reconfigure;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0recv_answered;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0recv_answer;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0close_reconfigure;<br>
&gt; &gt; ++=C2=A0 unsigned char=C2=A0 =C2=A0 =C2=A0 query[512];<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qu=
ery_len;<br>
&gt; &gt; ++=C2=A0 struct sockaddr_in peer;<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
cv_calls;<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ba=
d_fd_calls;<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0so=
ck_state_bad;<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0done;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 status;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void FakeSockSetErrno(bool wouldblock)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++#ifdef USE_WINSOCK<br>
&gt; &gt; ++=C2=A0 WSASetLastError(wouldblock ? WSAEWOULDBLOCK : WSAENOTCON=
N);<br>
&gt; &gt; ++#else<br>
&gt; &gt; ++=C2=A0 errno =3D wouldblock ? EAGAIN : ENOTCONN;<br>
&gt; &gt; ++#endif<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static ares_socket_t FakeSockSocket(int domain, int type, int p=
rotocol,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *user_d=
ata)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 FakeSockData *d =3D static_cast&lt;FakeSockData *&gt;(us=
er_data);<br>
&gt; &gt; ++=C2=A0 (void)domain;<br>
&gt; &gt; ++=C2=A0 (void)type;<br>
&gt; &gt; ++=C2=A0 (void)protocol;<br>
&gt; &gt; ++=C2=A0 return d-&gt;next_fd++;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static int FakeSockClose(ares_socket_t sock, void *user_data)<b=
r>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 FakeSockData *d =3D static_cast&lt;FakeSockData *&gt;(us=
er_data);<br>
&gt; &gt; ++=C2=A0 if (sock =3D=3D ARES_SOCKET_BAD) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;bad_fd_calls++;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 if (d-&gt;close_reconfigure) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;close_reconfigure =3D false;<br>
&gt; &gt; ++=C2=A0 =C2=A0 // Frees the server this connection belonged to.<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 ares_set_servers_csv(d-&gt;channel, &quot;<a href=
=3D"http://127.0.0.1:53056" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:=
53056</a>&quot;);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 return 0;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static int FakeSockSetsockopt(ares_socket_t sock, ares_socket_o=
pt_t opt,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const void *val, ares_socklen_t v=
al_size,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *user_data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 FakeSockData *d =3D static_cast&lt;FakeSockData *&gt;(us=
er_data);<br>
&gt; &gt; ++=C2=A0 (void)sock;<br>
&gt; &gt; ++=C2=A0 (void)val;<br>
&gt; &gt; ++=C2=A0 (void)val_size;<br>
&gt; &gt; ++=C2=A0 if (opt =3D=3D ARES_SOCKET_OPT_TCP_FASTOPEN &amp;&amp; !=
d-&gt;tfo) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return -1;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 return 0;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static int FakeSockConnect(ares_socket_t sock, const struct soc=
kaddr<br>
&gt; *address,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_socklen_t address_len, unsigned int =
flags,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *user_data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 FakeSockData *d =3D static_cast&lt;FakeSockData *&gt;(us=
er_data);<br>
&gt; &gt; ++=C2=A0 (void)sock;<br>
&gt; &gt; ++=C2=A0 (void)flags;<br>
&gt; &gt; ++=C2=A0 if (address-&gt;sa_family =3D=3D AF_INET &amp;&amp; addr=
ess_len &gt;=3D sizeof(d-&gt;peer)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 memcpy(&amp;d-&gt;peer, address, sizeof(d-&gt;pee=
r));<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 return 0;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static ares_ssize_t FakeSockRecvfrom(ares_socket_t sock, void *=
buffer,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t=
 length, int flags,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 sockaddr *address,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_s=
ocklen_t=C2=A0 *address_len,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *user_data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 FakeSockData *d =3D static_cast&lt;FakeSockData *&gt;(us=
er_data);<br>
&gt; &gt; ++=C2=A0 (void)flags;<br>
&gt; &gt; ++=C2=A0 d-&gt;recv_calls++;<br>
&gt; &gt; ++=C2=A0 if (sock =3D=3D ARES_SOCKET_BAD) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;bad_fd_calls++;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 if (d-&gt;query_len &lt; 12 || length &lt; d-&gt;query_l=
en) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 FakeSockSetErrno(true);<br>
&gt; &gt; ++=C2=A0 =C2=A0 return -1;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 if (d-&gt;recv_answer_then_reconfigure) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 // Answer first; reconfigure on the next call, wh=
ich has nothing to read.<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (d-&gt;recv_answered) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 d-&gt;recv_answer_then_reconfigure =3D fal=
se;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ares_set_servers_csv(d-&gt;channel, &quot;=
<a href=3D"http://127.0.0.1:53056" rel=3D"noreferrer" target=3D"_blank">127=
.0.0.1:53056</a>&quot;);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 FakeSockSetErrno(true);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;recv_answered =3D true;<br>
&gt; &gt; ++=C2=A0 } else if (d-&gt;recv_reconfigure) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;recv_reconfigure =3D false;<br>
&gt; &gt; ++=C2=A0 =C2=A0 // Frees the server this connection belongs to.<b=
r>
&gt; &gt; ++=C2=A0 =C2=A0 ares_set_servers_csv(d-&gt;channel, &quot;<a href=
=3D"http://127.0.0.1:53056" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:=
53056</a>&quot;);<br>
&gt; &gt; ++=C2=A0 } else if (d-&gt;recv_answer) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;recv_answer =3D false;<br>
&gt; &gt; ++=C2=A0 } else {<br>
&gt; &gt; ++=C2=A0 =C2=A0 FakeSockSetErrno(true);<br>
&gt; &gt; ++=C2=A0 =C2=A0 return -1;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 // Answer the query: the same message with QR set, no re=
cords.<br>
&gt; &gt; ++=C2=A0 memcpy(buffer, d-&gt;query, d-&gt;query_len);<br>
&gt; &gt; ++=C2=A0 static_cast&lt;unsigned char *&gt;(buffer)[2] |=3D 0x80;=
<br>
&gt; &gt; ++=C2=A0 if (address !=3D NULL &amp;&amp; address_len !=3D NULL &=
amp;&amp;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 *address_len &gt;=3D (ares_socklen_t)sizeo=
f(d-&gt;peer)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 memcpy(address, &amp;d-&gt;peer, sizeof(d-&gt;pee=
r));<br>
&gt; &gt; ++=C2=A0 =C2=A0 *address_len =3D sizeof(d-&gt;peer);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 return static_cast&lt;ares_ssize_t&gt;(d-&gt;query_len);=
<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static ares_ssize_t FakeSockSendto(ares_socket_t sock, const vo=
id *buffer,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t length=
, int flags,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct =
sockaddr *address,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_socklen_=
t address_len, void *user_data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 FakeSockData *d =3D static_cast&lt;FakeSockData *&gt;(us=
er_data);<br>
&gt; &gt; ++=C2=A0 (void)flags;<br>
&gt; &gt; ++=C2=A0 (void)address;<br>
&gt; &gt; ++=C2=A0 (void)address_len;<br>
&gt; &gt; ++=C2=A0 if (sock =3D=3D ARES_SOCKET_BAD) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;bad_fd_calls++;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 if (length &lt;=3D sizeof(d-&gt;query)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 memcpy(d-&gt;query, buffer, length);<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;query_len =3D length;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 return static_cast&lt;ares_ssize_t&gt;(length);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static int FakeSockGetsockname(ares_socket_t sock, struct socka=
ddr<br>
&gt; *address,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_socklen_t *address_len=
, void *user_data)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 FakeSockData=C2=A0 =C2=A0 =C2=A0 *d =3D static_cast&lt;F=
akeSockData *&gt;(user_data);<br>
&gt; &gt; ++=C2=A0 struct sockaddr_in sin;<br>
&gt; &gt; ++=C2=A0 if (sock =3D=3D ARES_SOCKET_BAD) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;bad_fd_calls++;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 // As during TCP Fast Open, before the first write has c=
onnected.<br>
&gt; &gt; ++=C2=A0 if (d-&gt;getsockname_fail_first &amp;&amp; sock !=3D d-=
&gt;getsockname_last_fd) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;getsockname_last_fd =3D sock;<br>
&gt; &gt; ++=C2=A0 =C2=A0 FakeSockSetErrno(false);<br>
&gt; &gt; ++=C2=A0 =C2=A0 return -1;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 if (d-&gt;getsockname_reconfigure) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;getsockname_reconfigure =3D false;<br>
&gt; &gt; ++=C2=A0 =C2=A0 // Frees the server this connection belongs to.<b=
r>
&gt; &gt; ++=C2=A0 =C2=A0 ares_set_servers_csv(d-&gt;channel, &quot;<a href=
=3D"http://127.0.0.1:53056" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:=
53056</a>&quot;);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 if (*address_len &lt; (ares_socklen_t)sizeof(sin)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 FakeSockSetErrno(false);<br>
&gt; &gt; ++=C2=A0 =C2=A0 return -1;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 memset(&amp;sin, 0, sizeof(sin));<br>
&gt; &gt; ++=C2=A0 sin.sin_family=C2=A0 =C2=A0 =C2=A0 =3D AF_INET;<br>
&gt; &gt; ++=C2=A0 sin.sin_port=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D htons(40000)=
;<br>
&gt; &gt; ++=C2=A0 sin.sin_addr.s_addr =3D htonl(INADDR_LOOPBACK);<br>
&gt; &gt; ++=C2=A0 memcpy(address, &amp;sin, sizeof(sin));<br>
&gt; &gt; ++=C2=A0 *address_len =3D sizeof(sin);<br>
&gt; &gt; ++=C2=A0 return 0;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void FakeSockStateCallback(void *data, ares_socket_t soc=
ket_fd,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int readable, int w=
ritable)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 FakeSockData *d =3D static_cast&lt;FakeSockData *&gt;(da=
ta);<br>
&gt; &gt; ++=C2=A0 (void)readable;<br>
&gt; &gt; ++=C2=A0 (void)writable;<br>
&gt; &gt; ++=C2=A0 if (socket_fd =3D=3D ARES_SOCKET_BAD) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 d-&gt;sock_state_bad++;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void FakeSockQueryCallback(void *arg, ares_status_t stat=
us,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeouts,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const ares_dns_reco=
rd_t *dnsrec)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 FakeSockData *d =3D static_cast&lt;FakeSockData *&gt;(ar=
g);<br>
&gt; &gt; ++=C2=A0 (void)timeouts;<br>
&gt; &gt; ++=C2=A0 (void)dnsrec;<br>
&gt; &gt; ++=C2=A0 d-&gt;done=C2=A0 =C2=A0=3D true;<br>
&gt; &gt; ++=C2=A0 d-&gt;status =3D static_cast&lt;int&gt;(status);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++static void FakeSockInit(ares_channel_t **chan, FakeSockData *d=
ata,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0int extra_flags, unsigned int sockfunc_flags,<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0bool sock_state =3D true)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 struct ares_options=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0opts;<br>
&gt; &gt; ++=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optmask =3D 0;<br>
&gt; &gt; ++=C2=A0 struct ares_socket_functions_ex funcs;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;opts, 0, sizeof(opts));<br>
&gt; &gt; ++=C2=A0 opts.flags=C2=A0 =3D ARES_FLAG_NOSEARCH | extra_flags;<b=
r>
&gt; &gt; ++=C2=A0 optmask=C2=A0 =C2=A0 |=3D ARES_OPT_FLAGS;<br>
&gt; &gt; ++=C2=A0 // A socket-state callback defers the close of a connect=
ion&#39;s descriptor<br>
&gt; &gt; ++=C2=A0 // until the outermost call unwinds; without one it is c=
losed inline.<br>
&gt; &gt; ++=C2=A0 if (sock_state) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 opts.sock_state_cb=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
FakeSockStateCallback;<br>
&gt; &gt; ++=C2=A0 =C2=A0 opts.sock_state_cb_data=C2=A0 =3D data;<br>
&gt; &gt; ++=C2=A0 =C2=A0 optmask=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=3D ARES_OPT_SOCK_STATE_CB;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 ASSERT_EQ(ARES_SUCCESS, ares_init_options(chan, &amp;opt=
s, optmask));<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, *chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(*chan,<br>
&gt; &quot;<a href=3D"http://127.0.0.1:53055" rel=3D"noreferrer" target=3D"=
_blank">127.0.0.1:53055</a>&quot;));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data-&gt;channel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D *chan;<br>
&gt; &gt; ++=C2=A0 data-&gt;next_fd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D 100;<br>
&gt; &gt; ++=C2=A0 data-&gt;getsockname_last_fd =3D ARES_SOCKET_BAD;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;funcs, 0, sizeof(funcs));<br>
&gt; &gt; ++=C2=A0 funcs.version=C2=A0 =C2=A0 =C2=A0 =3D 1;<br>
&gt; &gt; ++=C2=A0 funcs.flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D sockfunc_flag=
s;<br>
&gt; &gt; ++=C2=A0 funcs.asocket=C2=A0 =C2=A0 =C2=A0 =3D FakeSockSocket;<br=
>
&gt; &gt; ++=C2=A0 funcs.aclose=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D FakeSockClose=
;<br>
&gt; &gt; ++=C2=A0 funcs.asetsockopt=C2=A0 =3D FakeSockSetsockopt;<br>
&gt; &gt; ++=C2=A0 funcs.aconnect=C2=A0 =C2=A0 =C2=A0=3D FakeSockConnect;<b=
r>
&gt; &gt; ++=C2=A0 funcs.arecvfrom=C2=A0 =C2=A0 =3D FakeSockRecvfrom;<br>
&gt; &gt; ++=C2=A0 funcs.asendto=C2=A0 =C2=A0 =C2=A0 =3D FakeSockSendto;<br=
>
&gt; &gt; ++=C2=A0 funcs.agetsockname =3D FakeSockGetsockname;<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_socket_functions_ex(*ch=
an,<br>
&gt; &amp;funcs, data));<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The getsockname function runs for every new connection, afte=
r the checks<br>
&gt; &gt; ++// that follow the socket-configure and socket-create callbacks=
.=C2=A0 Reconfiguring<br>
&gt; &gt; ++// from it must not leave the connection registered on the remo=
ved server.<br>
&gt; &gt; ++TEST_F(LibraryTest, ReconfigureInGetsocknameNoUseAfterFree) {<b=
r>
&gt; &gt; ++=C2=A0 ares_channel_t *chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 FakeSockData=C2=A0 =C2=A0 data;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;data, 0, sizeof(data));<br>
&gt; &gt; ++=C2=A0 FakeSockInit(&amp;chan, &amp;data, 0, 0);<br>
&gt; &gt; ++=C2=A0 data.getsockname_reconfigure =3D true;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 FakeSockQueryCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.getsockname_reconfigure);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // The first connection&#39;s descriptor: no longer know=
n to the channel.<br>
&gt; &gt; ++=C2=A0 ares_process_fd(chan, 100, ARES_SOCKET_BAD);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Moved to the new server.<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_cancel(chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_ECANCELLED, data.status);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, data.bad_fd_calls);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, data.sock_state_bad);<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// With TCP Fast Open the first getsockname may fail, and is re=
tried after the<br>
&gt; &gt; ++// first write -- from inside ares_conn_write(), after the send=
 function has<br>
&gt; &gt; ++// returned.=C2=A0 Reconfiguring from that retry closes the con=
nection the query was<br>
&gt; &gt; ++// just written on.<br>
&gt; &gt; ++TEST_F(LibraryTest, ReconfigureInFastOpenGetsocknameNoUseAfterF=
ree) {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 FakeSockData=C2=A0 =C2=A0 data;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;data, 0, sizeof(data));<br>
&gt; &gt; ++=C2=A0 FakeSockInit(&amp;chan, &amp;data, ARES_FLAG_USEVC, 0);<=
br>
&gt; &gt; ++=C2=A0 data.tfo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D true;<br>
&gt; &gt; ++=C2=A0 data.getsockname_fail_first=C2=A0 =3D true;<br>
&gt; &gt; ++=C2=A0 data.getsockname_reconfigure =3D true;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 FakeSockQueryCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.getsockname_reconfigure);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Moved to the new server.<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, data.sock_state_bad);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_cancel(chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_ECANCELLED, data.status);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, data.bad_fd_calls);<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// A non-blocking receive function that reconfigures the server=
s and returns<br>
&gt; &gt; ++// an answer.=C2=A0 The connection it read from is closed, so t=
he answer must be<br>
&gt; &gt; ++// dropped -- the query has already moved to the new server -- =
and the<br>
&gt; &gt; ++// receive function must not be called again on the closed conn=
ection.<br>
&gt; &gt; ++TEST_F(LibraryTest, ReconfigureInRecvDropsStaleAnswer) {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 FakeSockData=C2=A0 =C2=A0 data;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;data, 0, sizeof(data));<br>
&gt; &gt; ++=C2=A0 FakeSockInit(&amp;chan, &amp;data, 0,<br>
&gt; ARES_SOCKFUNC_FLAG_NONBLOCKING);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 FakeSockQueryCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 ASSERT_NE((size_t)0, data.query_len);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.recv_reconfigure =3D true;<br>
&gt; &gt; ++=C2=A0 ares_process_fd(chan, 100, ARES_SOCKET_BAD);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.recv_reconfigure);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, data.recv_calls);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, data.bad_fd_calls);<br>
&gt; &gt; ++=C2=A0 // Still in flight on the new server.<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_cancel(chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_ECANCELLED, data.status);<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// As above, but the answer comes from an earlier receive call,=
 and a later<br>
&gt; &gt; ++// call -- which has nothing more to read -- reconfigures the s=
ervers.=C2=A0 The<br>
&gt; &gt; ++// answer is already buffered on the connection that call tore =
down, and must<br>
&gt; &gt; ++// be dropped with it.<br>
&gt; &gt; ++TEST_F(LibraryTest, ReconfigureInRecvDropsBufferedAnswer) {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 FakeSockData=C2=A0 =C2=A0 data;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;data, 0, sizeof(data));<br>
&gt; &gt; ++=C2=A0 FakeSockInit(&amp;chan, &amp;data, 0,<br>
&gt; ARES_SOCKFUNC_FLAG_NONBLOCKING);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 FakeSockQueryCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 ASSERT_NE((size_t)0, data.query_len);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.recv_answer_then_reconfigure =3D true;<br>
&gt; &gt; ++=C2=A0 ares_process_fd(chan, 100, ARES_SOCKET_BAD);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.recv_answer_then_reconfigure);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)2, data.recv_calls);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, data.bad_fd_calls);<br>
&gt; &gt; ++=C2=A0 // Still in flight on the new server.<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_cancel(chan);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_ECANCELLED, data.status);<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// The close function is application code too.=C2=A0 With no so=
cket-state callback<br>
&gt; &gt; ++// to carry the descriptor, it runs inline while ares_check_cle=
anup_conns()<br>
&gt; &gt; ++// walks the server list and each server&#39;s connections, clo=
sing idle ones.<br>
&gt; &gt; ++// Reconfiguring from it frees the list nodes that walk holds.<=
br>
&gt; &gt; ++TEST_F(LibraryTest, ReconfigureInCloseNoUseAfterFree) {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 FakeSockData=C2=A0 =C2=A0 data;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;data, 0, sizeof(data));<br>
&gt; &gt; ++=C2=A0 FakeSockInit(&amp;chan, &amp;data, 0, 0, false);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 FakeSockQueryCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 ASSERT_NE((size_t)0, data.query_len);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Answer it; the now idle connection is then closed.<br=
>
&gt; &gt; ++=C2=A0 data.recv_answer=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D true;<br>
&gt; &gt; ++=C2=A0 data.close_reconfigure =3D true;<br>
&gt; &gt; ++=C2=A0 ares_process_fd(chan, 100, ARES_SOCKET_BAD);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.recv_answer);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.close_reconfigure);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 // The fake answer carries no records.<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_ENODATA, data.status);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, data.bad_fd_calls);<br>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + // The second route to the same freed connection, and the one t=
hat drove the<br>
&gt; &gt; + // change from suppressing the idle sweep to deferring the noti=
fication:<br>
&gt; &gt; + // reconfiguring the servers from the socket-state callback des=
troys the server<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/c-ares/c-ares/0005-ares_proc=
ess-only-<br>
&gt; accept-an-answer-on-the-right-connection.patch b/meta-oe/recipes-suppo=
rt/c-<br>
&gt; ares/c-ares/0005-ares_process-only-accept-an-answer-on-the-right-<br>
&gt; connection.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..20fef5d2f0<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-support/c-ares/c-ares/0005-ares_process-onl=
y-accept-<br>
&gt; an-answer-on-the-right-connection.patch<br>
&gt; &gt; @@ -0,0 +1,575 @@<br>
&gt; &gt; +From c8bd9ab53329f66ec0c395a11002a5696669b147 Mon Sep 17 00:00:0=
0<br>
&gt; 2001<br>
&gt; &gt; +From: Brad House &lt;<a href=3D"mailto:brad@brad-house.com" targ=
et=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Date: Mon, 19 Oct 2026 11:53:54 -0400<br>
&gt; &gt; +Subject: [PATCH] [Backport v1.34] ares_process: only accept an a=
nswer on the<br>
&gt; &gt; + connection its query was sent on (#1361)<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +Backport of b6f8a9b47e17c681e092a74d05d73bbb35c89a39 to `v1.34`.=
 See<br>
&gt; &gt; +that commit for the full description.<br>
&gt; &gt; +<br>
&gt; &gt; +**Conflicts:** `src/lib/ares_socket.h` only =E2=80=94 v1.34 alig=
ns the<br>
&gt; &gt; +neighbouring prototypes differently. Resolved by taking the new =
doc<br>
&gt; &gt; +comments and the `ares_sockaddr_addr_port_eq()` prototype, then<=
br>
&gt; &gt; +re-running clang-format for the v1.34 alignment (which also re-w=
raps the<br>
&gt; &gt; +new `SendData()` declaration in `test/ares-test.h`). All other f=
iles<br>
&gt; &gt; +applied unchanged; the `test/` diffs match main exactly.<br>
&gt; &gt; +<br>
&gt; &gt; +**Tests (local, macOS, Debug, Ninja):**<br>
&gt; &gt; +- ASAN+UBSAN and `-DCARES_WERROR=3DON` builds: `arestest -4<br>
&gt; &gt; +--gtest_filter=3D&#39;-*Live*&#39;` =E2=80=94 693/693 passed in =
both.<br>
&gt; &gt; +- With the `src/` changes reverted, the 4 new test instances fai=
l<br>
&gt; &gt; +(`UDPAnswerFromWrongPortDropped`,<br>
&gt; `AnswerOnOtherServerConnectionDropped`<br>
&gt; &gt; +UDP/TCP, `CookielessAnswerOnOtherServerDropped`); they pass with=
 them.<br>
&gt; &gt; +- `git clang-format --diff upstream/v1.34` clean. Also tested to=
gether<br>
&gt; &gt; +with the other two v1.34 backports (both orders apply cleanly): =
699/699<br>
&gt; &gt; +passed under ASAN+UBSAN and `-Werror`.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Brad House &lt;<a href=3D"mailto:brad@brad-house.=
com" target=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/c-ares/=
c-" rel=3D"noreferrer" target=3D"_blank">https://github.com/c-ares/c-</a><b=
r>
&gt; ares/commit/c8bd9ab53329f66ec0c395a11002a5696669b147]<br>
&gt; &gt; +GHSA: GHSA-fqh5-3x7m-wp44<br>
&gt; &gt; +---<br>
&gt; &gt; + src/lib/ares_conn.c=C2=A0 =C2=A0 |=C2=A0 11 ++-<br>
&gt; &gt; + src/lib/ares_process.c |=C2=A0 18 ++++<br>
&gt; &gt; + src/lib/ares_socket.c=C2=A0 |=C2=A0 24 +++++<br>
&gt; &gt; + src/lib/ares_socket.h=C2=A0 |=C2=A0 21 ++++<br>
&gt; &gt; + test/ares-test-mock.cc | 218<br>
&gt; +++++++++++++++++++++++++++++++++++++++++<br>
&gt; &gt; + test/ares-test.cc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 86 +++++++++-----=
--<br>
&gt; &gt; + test/ares-test.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +++<br>
&gt; &gt; + 7 files changed, 355 insertions(+), 35 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c<br>
&gt; &gt; +index 5e0827fbdf..b868053e62 100644<br>
&gt; &gt; +--- a/src/lib/ares_conn.c<br>
&gt; &gt; ++++ b/src/lib/ares_conn.c<br>
&gt; &gt; +@@ -252,9 +252,16 @@ ares_conn_err_t ares_conn_read(ares_conn_t<=
br>
&gt; *conn, void *data, size_t len,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct sockaddr *)&amp;sa_storage, &amp=
;salen, read_bytes);<br>
&gt; &gt; +<br>
&gt; &gt; + #ifdef HAVE_RECVFROM<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* The socket is connect()ed, so the kernel norma=
lly drops datagrams from<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* any other address or port already.=C2=A0 =
Application-provided socket<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* functions might not filter on connect, so=
 also check here that the<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* datagram came from the server&#39;s addre=
ss and UDP port.=C2=A0 RFC 5452<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* section 9.1 only requires the address to =
match; matching the port too<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* keeps one server from answering for anoth=
er on the same address. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (err =3D=3D ARES_CONN_ERR_SUCCESS &amp;&a=
mp;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 !ares_sockaddr_addr_eq((struct sock=
addr *)&amp;sa_storage,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;conn-&gt;server-&gt;ad=
dr)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 !ares_sockaddr_addr_port_eq((struct=
 sockaddr *)&amp;sa_storage,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;conn-&g=
t;server-&gt;addr,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn-&gt;ser=
ver-&gt;udp_port)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D ARES_CONN_ERR_WOULDBLOCK;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; + #endif<br>
&gt; &gt; +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c<br>
&gt; &gt; +index 5686b077a6..06d0ca507c 100644<br>
&gt; &gt; +--- a/src/lib/ares_process.c<br>
&gt; &gt; ++++ b/src/lib/ares_process.c<br>
&gt; &gt; +@@ -1117,6 +1117,24 @@ static ares_status_t<br>
&gt; process_answer(ares_channel_t=C2=A0 =C2=A0 =C2=A0 *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 /* RFC 5452 section 9.1: only accept a response that arr=
ives on the<br>
&gt; &gt; ++=C2=A0 =C2=A0* connection the query was sent on, and so from th=
e server it was sent to.<br>
&gt; &gt; ++=C2=A0 =C2=A0* For UDP, ares_conn_read() also drops a datagram =
whose source address<br>
&gt; or<br>
&gt; &gt; ++=C2=A0 =C2=A0* port is not the server&#39;s; matching the port =
is hardening beyond RFC 5452<br>
&gt; &gt; ++=C2=A0 =C2=A0* section 9.1, which only requires the address to =
match.=C2=A0 Otherwise any<br>
&gt; &gt; ++=C2=A0 =C2=A0* server we hold a connection to could answer, and=
 get cached, a query that<br>
&gt; &gt; ++=C2=A0 =C2=A0* was only ever sent to some other server, and the=
 cookie check below<br>
&gt; would<br>
&gt; &gt; ++=C2=A0 =C2=A0* run against the wrong server&#39;s cookie state.=
=C2=A0 Treat it like an unknown<br>
&gt; &gt; ++=C2=A0 =C2=A0* query id, before anything acts on it (cookies, s=
erver health, the cache).<br>
&gt; &gt; ++=C2=A0 =C2=A0* Our caller has already consumed the message from=
 the connection&#39;s<br>
&gt; buffer,<br>
&gt; &gt; ++=C2=A0 =C2=A0* so TCP framing stays in sync.=C2=A0 A query not =
attached to any connection<br>
&gt; &gt; ++=C2=A0 =C2=A0* (query-&gt;conn =3D=3D NULL) never matches.=C2=
=A0 This also drops a late answer<br>
&gt; from<br>
&gt; &gt; ++=C2=A0 =C2=A0* a server tried before a retry. */<br>
&gt; &gt; ++=C2=A0 if (query-&gt;conn !=3D conn) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 status =3D ARES_SUCCESS;<br>
&gt; &gt; ++=C2=A0 =C2=A0 goto cleanup;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0/* Validate DNS cookie in response. This function m=
ay need to requeue the<br>
&gt; &gt; +=C2=A0 =C2=A0 * query. */<br>
&gt; &gt; +=C2=A0 =C2=A0if (ares_cookie_validate(query, rdnsrec, conn, now,=
 requeue)<br>
&gt; &gt; +diff --git a/src/lib/ares_socket.c b/src/lib/ares_socket.c<br>
&gt; &gt; +index 4ad3034021..0a12935ab7 100644<br>
&gt; &gt; +--- a/src/lib/ares_socket.c<br>
&gt; &gt; ++++ b/src/lib/ares_socket.c<br>
&gt; &gt; +@@ -127,6 +127,30 @@ ares_bool_t ares_sockaddr_addr_eq(const str=
uct<br>
&gt; sockaddr=C2=A0 *sa,<br>
&gt; &gt; +=C2=A0 =C2=A0return ARES_FALSE; /* different */<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++ares_bool_t ares_sockaddr_addr_port_eq(const struct sockaddr=C2=
=A0 *sa,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0const struct ares_addr *aa,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0unsigned short=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 unsigned short sa_port;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (!ares_sockaddr_addr_eq(sa, aa)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_FALSE;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* ares_sockaddr_addr_eq() only matches AF_INET and AF_I=
NET6 */<br>
&gt; &gt; ++=C2=A0 if (sa-&gt;sa_family =3D=3D AF_INET) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 sa_port =3D (CARES_INADDR_CAST(const struct socka=
ddr_in *, sa))-<br>
&gt; &gt;sin_port;<br>
&gt; &gt; ++=C2=A0 } else {<br>
&gt; &gt; ++=C2=A0 =C2=A0 sa_port =3D (CARES_INADDR_CAST(const struct socka=
ddr_in6 *, sa))-<br>
&gt; &gt;sin6_port;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (ntohs(sa_port) !=3D port) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return ARES_FALSE;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 return ARES_TRUE;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + ares_conn_err_t ares_socket_write(ares_channel_t *channel, ares=
_socket_t<br>
&gt; fd,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const void *d=
ata, size_t len, size_t *written,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct =
sockaddr *sa,<br>
&gt; &gt; +diff --git a/src/lib/ares_socket.h b/src/lib/ares_socket.h<br>
&gt; &gt; +index 24a99ab331..f7128e3493 100644<br>
&gt; &gt; +--- a/src/lib/ares_socket.h<br>
&gt; &gt; ++++ b/src/lib/ares_socket.h<br>
&gt; &gt; +@@ -139,8 +139,29 @@ typedef enum {<br>
&gt; &gt; +=C2=A0 =C2=A0ARES_CONN_ERR_FAILURE=C2=A0 =C2=A0 =C2=A0 =3D 99=C2=
=A0 /*!&lt; Generic failure */<br>
&gt; &gt; + } ares_conn_err_t;<br>
&gt; &gt; +<br>
&gt; &gt; ++/*! Compare the IP address of a socket address with an ares_add=
r.=C2=A0 The port<br>
&gt; &gt; ++ *=C2=A0 in the socket address is ignored.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in] sa=C2=A0 Socket address (AF_INET or AF_INET=
6)<br>
&gt; &gt; ++ *=C2=A0 \param[in] aa=C2=A0 Address to compare against<br>
&gt; &gt; ++ *=C2=A0 \return ARES_TRUE if the address families and IP addre=
sses are equal,<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_FALSE otherwise<br>
&gt; &gt; ++ */<br>
&gt; &gt; + ares_bool_t=C2=A0 =C2=A0 =C2=A0ares_sockaddr_addr_eq(const stru=
ct sockaddr=C2=A0 *sa,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0const struct ares_addr *aa);<br>
&gt; &gt; ++<br>
&gt; &gt; ++/*! Compare the IP address and port of a socket address with an=
 ares_addr<br>
&gt; and<br>
&gt; &gt; ++ *=C2=A0 port.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in] sa=C2=A0 =C2=A0 Socket address (AF_INET or =
AF_INET6)<br>
&gt; &gt; ++ *=C2=A0 \param[in] aa=C2=A0 =C2=A0 Address to compare against<=
br>
&gt; &gt; ++ *=C2=A0 \param[in] port=C2=A0 Port to compare against, in host=
 byte order<br>
&gt; &gt; ++ *=C2=A0 \return ARES_TRUE if the address families, IP addresse=
s and ports are<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 equal, ARES_FALSE otherwis=
e<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++ares_bool_t=C2=A0 =C2=A0 =C2=A0ares_sockaddr_addr_port_eq(const=
 struct sockaddr=C2=A0 *sa,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const struct ares_addr *aa,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0unsigned short=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port);<br=
>
&gt; &gt; + ares_status_t=C2=A0 =C2=A0ares_socket_configure(ares_channel_t =
*channel, int family,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ares_bool_t is_tcp, ares_socket_t fd);<br>
&gt; &gt; + ares_conn_err_t ares_socket_enable_tfo(const ares_channel_t *ch=
annel,<br>
&gt; &gt; +diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc<br>
&gt; &gt; +index d233f9070f..058dc93001 100644<br>
&gt; &gt; +--- a/test/ares-test-mock.cc<br>
&gt; &gt; ++++ b/test/ares-test-mock.cc<br>
&gt; &gt; +@@ -3363,6 +3363,7 @@ struct FakeSockData {<br>
&gt; &gt; +=C2=A0 =C2=A0unsigned char=C2=A0 =C2=A0 =C2=A0 query[512];<br>
&gt; &gt; +=C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0query_len;<br>
&gt; &gt; +=C2=A0 =C2=A0struct sockaddr_in peer;<br>
&gt; &gt; ++=C2=A0 unsigned short=C2=A0 =C2=A0 =C2=A0recv_port; /* network =
order; 0 reports the peer&#39;s port */<br>
&gt; &gt; +=C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0recv_calls;<br>
&gt; &gt; +=C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bad_fd_calls;<br>
&gt; &gt; +=C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sock_state_bad;<br>
&gt; &gt; +@@ -3471,6 +3472,9 @@ static ares_ssize_t<br>
&gt; FakeSockRecvfrom(ares_socket_t sock, void *buffer,<br>
&gt; &gt; +=C2=A0 =C2=A0if (address !=3D NULL &amp;&amp; address_len !=3D N=
ULL &amp;&amp;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*address_len &gt;=3D (ares_socklen_t)=
sizeof(d-&gt;peer)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0memcpy(address, &amp;d-&gt;peer, sizeof(d-&g=
t;peer));<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (d-&gt;recv_port !=3D 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 reinterpret_cast&lt;struct sockaddr_in *&g=
t;(address)-&gt;sin_port =3D d-&gt;recv_port;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0*address_len =3D sizeof(d-&gt;peer);<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0return static_cast&lt;ares_ssize_t&gt;(d-&gt;query_=
len);<br>
&gt; &gt; +@@ -3710,6 +3714,42 @@ TEST_F(LibraryTest,<br>
&gt; ReconfigureInRecvDropsBufferedAnswer) {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_destroy(chan);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++// Socket functions need not filter on connect(), so ares_conn_=
read() checks<br>
&gt; &gt; ++// a UDP datagram&#39;s source itself.=C2=A0 An answer reported=
 from the server&#39;s<br>
&gt; &gt; ++// address but another port (here <a href=3D"http://127.0.0.1:5=
3" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:53</a> for a server at<br=
>
&gt; &gt; ++// <a href=3D"http://127.0.0.1:53055" rel=3D"noreferrer" target=
=3D"_blank">127.0.0.1:53055</a>) must be dropped, so that one server cannot=
 answer for<br>
&gt; &gt; ++// another on the same address.=C2=A0 The same answer from the =
right port is then<br>
&gt; &gt; ++// accepted.<br>
&gt; &gt; ++TEST_F(LibraryTest, UDPAnswerFromWrongPortDropped) {<br>
&gt; &gt; ++=C2=A0 ares_channel_t *chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 FakeSockData=C2=A0 =C2=A0 data;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;data, 0, sizeof(data));<br>
&gt; &gt; ++=C2=A0 FakeSockInit(&amp;chan, &amp;data, 0,<br>
&gt; ARES_SOCKFUNC_FLAG_NONBLOCKING);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 FakeSockQueryCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 ASSERT_NE((size_t)0, data.query_len);<br>
&gt; &gt; ++=C2=A0 ASSERT_EQ(htons(53055), data.peer.sin_port);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.recv_port=C2=A0 =C2=A0=3D htons(53);<br>
&gt; &gt; ++=C2=A0 data.recv_answer =3D true;<br>
&gt; &gt; ++=C2=A0 ares_process_fd(chan, 100, ARES_SOCKET_BAD);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.recv_answer);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.done);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)1, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.recv_port=C2=A0 =C2=A0=3D 0;<br>
&gt; &gt; ++=C2=A0 data.recv_answer =3D true;<br>
&gt; &gt; ++=C2=A0 ares_process_fd(chan, 100, ARES_SOCKET_BAD);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.recv_answer);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 // The fake answer carries no records.<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_ENODATA, data.status);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + // The close function is application code too.=C2=A0 With no so=
cket-state callback<br>
&gt; &gt; + // to carry the descriptor, it runs inline while ares_check_cle=
anup_conns()<br>
&gt; &gt; + // walks the server list and each server&#39;s connections, clo=
sing idle ones.<br>
&gt; &gt; +@@ -5530,5 +5570,183 @@<br>
&gt; INSTANTIATE_TEST_SUITE_P(TransportModes, ServerRecoveryMultiMockTest,<=
br>
&gt; ::testing:<br>
&gt; &gt; +<br>
&gt; &gt; + INSTANTIATE_TEST_SUITE_P(TransportModes,<br>
&gt; ServerRecoveryNoProbeMultiMockTest,<br>
&gt; ::testing::ValuesIn(ares::test::families_modes), PrintFamilyMode);<br>
&gt; &gt; +<br>
&gt; &gt; ++// An answer is only accepted on the connection its query was s=
ent on<br>
&gt; &gt; ++// (RFC 5452 section 9.1).=C2=A0 Two servers: #0 is demoted by =
a SERVFAIL so a<br>
&gt; later<br>
&gt; &gt; ++// query goes only to #1, while #0&#39;s connection stays open =
(STAYOPEN).<br>
&gt; Server<br>
&gt; &gt; ++// #0 then answers that query on its own connection.=C2=A0 The =
answer must be<br>
&gt; &gt; ++// dropped without side effects, and the query must then comple=
te normally.<br>
&gt; &gt; ++class ReplyConnMultiMockTest<br>
&gt; &gt; ++=C2=A0 : public MockChannelOptsTest,<br>
&gt; &gt; ++=C2=A0 =C2=A0 public ::testing::WithParamInterface&lt; std::pai=
r&lt;int, bool&gt; &gt; {<br>
&gt; &gt; ++ public:<br>
&gt; &gt; ++=C2=A0 ReplyConnMultiMockTest()<br>
&gt; &gt; ++=C2=A0 =C2=A0 : MockChannelOptsTest(2, GetParam().first, GetPar=
am().second, false,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 FillOptions(&amp;opts_),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_OPT_FLAGS | ARES_OPT_TRIES |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_OPT_SERVER_FAILOVER | ARES_OPT_NOROTATE)<b=
r>
&gt; {}<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 static struct ares_options* FillOptions(struct ares_opti=
ons *opts) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 memset(opts, 0, sizeof(struct ares_options));<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Keep the demoted server&#39;s connection open;=
 no DNS 0x20 so the replies<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* built here match the question exactly */<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 opts-&gt;flags =3D ARES_FLAG_STAYOPEN | ARES_FLAG=
_EDNS;<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* One try per server: the query goes to #1, then=
 on timeout to #0 */<br>
&gt; &gt; ++=C2=A0 =C2=A0 opts-&gt;tries =3D 1;<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Never probe the demoted server, so the query i=
s sent only to #1 */<br>
&gt; &gt; ++=C2=A0 =C2=A0 opts-&gt;server_failover_opts.retry_chance =3D 0;=
<br>
&gt; &gt; ++=C2=A0 =C2=A0 opts-&gt;server_failover_opts.retry_delay=C2=A0 =
=3D 10000;<br>
&gt; &gt; ++=C2=A0 =C2=A0 return opts;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++ private:<br>
&gt; &gt; ++=C2=A0 struct ares_options opts_;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++static std::string ReplyConnFirstA(const QueryResult &amp;resul=
t)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 const ares_dns_rr_t *rr;<br>
&gt; &gt; ++=C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0addr[64];<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (result.dnsrec_.dnsrec_ =3D=3D nullptr ||<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ares_dns_record_rr_cnt(result.dnsrec_.dnsr=
ec_,<br>
&gt; ARES_SECTION_ANSWER) =3D=3D 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return &quot;&quot;;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 rr =3D ares_dns_record_rr_get_const(result.dnsrec_.dnsre=
c_,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_SECTION=
_ANSWER, 0);<br>
&gt; &gt; ++=C2=A0 if (ares_dns_rr_get_type(rr) !=3D ARES_REC_TYPE_A ||<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ares_inet_ntop(AF_INET, ares_dns_rr_get_ad=
dr(rr,<br>
&gt; ARES_RR_A_ADDR), addr,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sizeof(addr)) =3D=3D nullptr) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 return &quot;&quot;;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 return addr;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_P(ReplyConnMultiMockTest,<br>
&gt; AnswerOnOtherServerConnectionDropped) {<br>
&gt; &gt; ++=C2=A0 DNSPacket warm_servfail;<br>
&gt; &gt; ++=C2=A0 warm_servfail.set_response().set_aa().set_rcode(SERVFAIL=
)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;warmup.exampl=
e&quot;, T_A));<br>
&gt; &gt; ++=C2=A0 DNSPacket warm_ok;<br>
&gt; &gt; ++=C2=A0 warm_ok.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;warmup.exampl=
e&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;warmup.example&quot;=
, 100, {1, 1, 1, 1}));<br>
&gt; &gt; ++=C2=A0 DNSPacket forged;<br>
&gt; &gt; ++=C2=A0 forged.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;victim.exampl=
e&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;victim.example&quot;=
, 100, {6, 6, 6, 6}));<br>
&gt; &gt; ++=C2=A0 DNSPacket genuine;<br>
&gt; &gt; ++=C2=A0 genuine.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;victim.exampl=
e&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;victim.example&quot;=
, 100, {1, 2, 3, 4}));<br>
&gt; &gt; ++=C2=A0 unsigned short qid =3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Demote #0, leaving a connection to it open */<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(*servers_[0], OnRequest(&quot;warmup.example=
&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillOnce(SetReply(servers_[0].get(), &amp;warm_s=
ervfail));<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(*servers_[1], OnRequest(&quot;warmup.example=
&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillOnce(SetReply(servers_[1].get(), &amp;warm_o=
k));<br>
&gt; &gt; ++=C2=A0 QueryResult warm;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;warmup.example&quot;, =
ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ARES_REC_TYPE_A, QueryCallback, &amp;warm, NULL);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 ASSERT_TRUE(warm.done_);<br>
&gt; &gt; ++=C2=A0 ASSERT_EQ(ARES_SUCCESS, warm.status_);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* The query goes only to #1, which does not answer.=C2=
=A0 Meanwhile #0<br>
&gt; answers<br>
&gt; &gt; ++=C2=A0 =C2=A0* it on #0&#39;s own connection.=C2=A0 That answer=
 must be dropped, so the query<br>
&gt; &gt; ++=C2=A0 =C2=A0* times out on #1 and is retried on #0, whose genu=
ine answer is accepted<br>
&gt; on<br>
&gt; &gt; ++=C2=A0 =C2=A0* the same (still in sync, for TCP) connection. */=
<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(*servers_[1], OnRequest(&quot;victim.example=
&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillOnce(InvokeWithoutArgs([&amp;]() {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 servers_[0]-&gt;SendUnsolicited(&amp;forge=
d, qid);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 servers_[1]-&gt;SetReplyData(std::vector&l=
t;byte&gt;());<br>
&gt; &gt; ++=C2=A0 =C2=A0 }));<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(*servers_[0], OnRequest(&quot;victim.example=
&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillOnce(SetReply(servers_[0].get(), &amp;genuin=
e));<br>
&gt; &gt; ++=C2=A0 QueryResult result;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;victim.example&quot;, =
ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ARES_REC_TYPE_A, QueryCallback, &amp;result, &amp;qid);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 ASSERT_TRUE(result.done_);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, result.status_);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(&quot;1.2.3.4&quot;, ReplyConnFirstA(result));=
<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(1, (int)result.timeouts_);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// DNS cookies (RFC 7873) are per-server state, validated again=
st the server<br>
&gt; &gt; ++// the query was sent to.=C2=A0 #1 supports cookies, #0 does no=
t.=C2=A0 A cookie-less<br>
&gt; &gt; ++// answer arriving on #0&#39;s connection for a query sent only=
 to #1 must not be<br>
&gt; &gt; ++// accepted: it would otherwise be checked against #0&#39;s coo=
kie state and<br>
&gt; pass.<br>
&gt; &gt; ++class ReplyConnCookieMultiMockTest<br>
&gt; &gt; ++=C2=A0 : public MockChannelOptsTest,<br>
&gt; &gt; ++=C2=A0 =C2=A0 public ::testing::WithParamInterface&lt;int&gt; {=
<br>
&gt; &gt; ++ public:<br>
&gt; &gt; ++=C2=A0 ReplyConnCookieMultiMockTest()<br>
&gt; &gt; ++=C2=A0 =C2=A0 : MockChannelOptsTest(2, GetParam(), false, false=
,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ReplyConnMultiMockTest::FillOptions(&amp;opts_)=
,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_OPT_FLAGS | ARES_OPT_TRIES |<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARES_OPT_SERVER_FAILOVER | ARES_OPT_NOROTATE)<b=
r>
&gt; {}<br>
&gt; &gt; ++ private:<br>
&gt; &gt; ++=C2=A0 struct ares_options opts_;<br>
&gt; &gt; ++};<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_P(ReplyConnCookieMultiMockTest,<br>
&gt; CookielessAnswerOnOtherServerDropped) {<br>
&gt; &gt; ++=C2=A0 std::vector&lt;byte&gt; server_cookie =3D { 1, 2, 3, 4, =
5, 6, 7, 8 };<br>
&gt; &gt; ++=C2=A0 DNSPacket warm_servfail;<br>
&gt; &gt; ++=C2=A0 warm_servfail.set_response().set_aa().set_rcode(SERVFAIL=
)<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;warmup.exampl=
e&quot;, T_A));<br>
&gt; &gt; ++=C2=A0 DNSPacket warm_ok;<br>
&gt; &gt; ++=C2=A0 warm_ok.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;warmup.exampl=
e&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;warmup.example&quot;=
, 100, {1, 1, 1, 1}))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_additional(new DNSOptRR(0, 0, 0, 1280, { }, =
server_cookie, false));<br>
&gt; &gt; ++=C2=A0 DNSPacket forged;<br>
&gt; &gt; ++=C2=A0 forged.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;victim.exampl=
e&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;victim.example&quot;=
, 100, {6, 6, 6, 6}));<br>
&gt; &gt; ++=C2=A0 DNSPacket genuine;<br>
&gt; &gt; ++=C2=A0 genuine.set_response().set_aa()<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_question(new DNSQuestion(&quot;victim.exampl=
e&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .add_answer(new DNSARR(&quot;victim.example&quot;=
, 100, {1, 2, 3, 4}));<br>
&gt; &gt; ++=C2=A0 unsigned short qid =3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* #0 answers without a cookie (and is demoted); #1 answ=
ers with one, so<br>
&gt; &gt; ++=C2=A0 =C2=A0* #1&#39;s cookie state becomes SUPPORTED */<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(*servers_[0], OnRequest(&quot;warmup.example=
&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillOnce(SetReply(servers_[0].get(), &amp;warm_s=
ervfail));<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(*servers_[1], OnRequest(&quot;warmup.example=
&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillOnce(SetReply(servers_[1].get(), &amp;warm_o=
k));<br>
&gt; &gt; ++=C2=A0 QueryResult warm;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;warmup.example&quot;, =
ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ARES_REC_TYPE_A, QueryCallback, &amp;warm, NULL);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 ASSERT_TRUE(warm.done_);<br>
&gt; &gt; ++=C2=A0 ASSERT_EQ(ARES_SUCCESS, warm.status_);<br>
&gt; &gt; ++=C2=A0 size_t cookie_len =3D 0;<br>
&gt; &gt; ++=C2=A0 fetch_server_cookie(warm.dnsrec_.dnsrec_, &amp;cookie_le=
n);<br>
&gt; &gt; ++=C2=A0 ASSERT_EQ(server_cookie.size(), cookie_len);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* The cookie-protected query goes only to #1; a cookie-=
less answer for it<br>
&gt; &gt; ++=C2=A0 =C2=A0* arrives on #0&#39;s connection and must be dropp=
ed.=C2=A0 The retry to #0 is then<br>
&gt; &gt; ++=C2=A0 =C2=A0* legitimately answered by #0, which does not use =
cookies. */<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(*servers_[1], OnRequest(&quot;victim.example=
&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillOnce(InvokeWithoutArgs([&amp;]() {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 servers_[0]-&gt;SendUnsolicited(&amp;forge=
d, qid);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 servers_[1]-&gt;SetReplyData(std::vector&l=
t;byte&gt;());<br>
&gt; &gt; ++=C2=A0 =C2=A0 }));<br>
&gt; &gt; ++=C2=A0 EXPECT_CALL(*servers_[0], OnRequest(&quot;victim.example=
&quot;, T_A))<br>
&gt; &gt; ++=C2=A0 =C2=A0 .WillOnce(SetReply(servers_[0].get(), &amp;genuin=
e));<br>
&gt; &gt; ++=C2=A0 QueryResult result;<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(channel_, &quot;victim.example&quot;, =
ARES_CLASS_IN,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ARES_REC_TYPE_A, QueryCallback, &amp;result, &amp;qid);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 ASSERT_TRUE(result.done_);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, result.status_);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(&quot;1.2.3.4&quot;, ReplyConnFirstA(result));=
<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(1, (int)result.timeouts_);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++INSTANTIATE_TEST_SUITE_P(TransportModes, ReplyConnMultiMockTest=
,<br>
&gt; ::testing::ValuesIn(ares::test::families_modes), PrintFamilyMode);<br>
&gt; &gt; ++<br>
&gt; &gt; ++INSTANTIATE_TEST_SUITE_P(AddressFamilies,<br>
&gt; ReplyConnCookieMultiMockTest, ::testing::ValuesIn(ares::test::families=
),<br>
&gt; PrintFamily);<br>
&gt; &gt; ++<br>
&gt; &gt; + }=C2=A0 // namespace test<br>
&gt; &gt; + }=C2=A0 // namespace ares<br>
&gt; &gt; +diff --git a/test/ares-test.cc b/test/ares-test.cc<br>
&gt; &gt; +index d333ee9419..0b3ac12c09 100644<br>
&gt; &gt; +--- a/test/ares-test.cc<br>
&gt; &gt; ++++ b/test/ares-test.cc<br>
&gt; &gt; +@@ -448,6 +448,9 @@ MockServer::MockServer(int family, unsigned =
short<br>
&gt; port)<br>
&gt; &gt; +=C2=A0 =C2=A0// Create a TCP socket to receive data on.<br>
&gt; &gt; +=C2=A0 =C2=A0tcp_data_ =3D NULL;<br>
&gt; &gt; +=C2=A0 =C2=A0tcp_data_len_ =3D 0;<br>
&gt; &gt; ++=C2=A0 last_fd_ =3D ARES_SOCKET_BAD;<br>
&gt; &gt; ++=C2=A0 memset(&amp;last_addr_, 0, sizeof(last_addr_));<br>
&gt; &gt; ++=C2=A0 last_addrlen_ =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0tcpfd_ =3D socket(family, SOCK_STREAM, 0);<br>
&gt; &gt; +=C2=A0 =C2=A0EXPECT_NE(ARES_SOCKET_BAD, tcpfd_);<br>
&gt; &gt; +=C2=A0 =C2=A0int optval =3D 1;<br>
&gt; &gt; +@@ -710,6 +713,50 @@ std::set&lt;ares_socket_t&gt; MockServer::f=
ds() const {<br>
&gt; &gt; +=C2=A0 =C2=A0return result;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++void MockServer::SendData(ares_socket_t fd, struct sockaddr_sto=
rage *addr,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_socklen_t addrlen, int qid,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 std::vector&lt;byte&gt; reply) {<br>
&gt; &gt; ++=C2=A0 int flags =3D 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (reply.size() &gt;=3D=C2=A0 2) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 // Overwrite the query ID if space to do so.<br>
&gt; &gt; ++=C2=A0 =C2=A0 reply[0] =3D (byte)((qid &gt;&gt; 8) &amp; 0xff);=
<br>
&gt; &gt; ++=C2=A0 =C2=A0 reply[1] =3D (byte)(qid &amp; 0xff);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 if (verbose) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 std::cerr &lt;&lt; &quot;sending reply &quot; &lt=
;&lt; PacketToString(reply)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&lt; &quot=
; on port &quot; &lt;&lt; ((fd =3D=3D udpfd_) ? udpport_ : tcpport_)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&lt; &quot=
;:&quot; &lt;&lt; getaddrport(addr) &lt;&lt; std::endl;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Prefix with 2-byte length if TCP.<br>
&gt; &gt; ++=C2=A0 if (fd !=3D udpfd_) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 int len =3D (int)reply.size();<br>
&gt; &gt; ++=C2=A0 =C2=A0 std::vector&lt;byte&gt; vlen =3D {(byte)((len &am=
p; 0xFF00) &gt;&gt; 8), (byte)(len &amp; 0xFF)};<br>
&gt; &gt; ++=C2=A0 =C2=A0 reply.insert(reply.begin(), vlen.begin(), vlen.en=
d());<br>
&gt; &gt; ++=C2=A0 =C2=A0 // Also, don&#39;t bother with the destination ad=
dress.<br>
&gt; &gt; ++=C2=A0 =C2=A0 addr =3D nullptr;<br>
&gt; &gt; ++=C2=A0 =C2=A0 addrlen =3D 0;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++#ifdef MSG_NOSIGNAL<br>
&gt; &gt; ++=C2=A0 flags |=3D MSG_NOSIGNAL;<br>
&gt; &gt; ++#endif<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_ssize_t rc =3D (ares_ssize_t)sendto(fd, BYTE_CAST r=
eply.data(),<br>
&gt; (SEND_TYPE_ARG3)reply.size(), flags,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(struct sockaddr *)addr, addrlen);<br>
&gt; &gt; ++=C2=A0 if (rc &lt; static_cast&lt;ares_ssize_t&gt;(reply.size()=
)) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 std::cerr &lt;&lt; &quot;Failed to send full repl=
y, rc=3D&quot; &lt;&lt; rc &lt;&lt; std::endl;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++void MockServer::SendUnsolicited(const DNSPacket *reply, unsign=
ed short<br>
&gt; qid) {<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(ARES_SOCKET_BAD, last_fd_);<br>
&gt; &gt; ++=C2=A0 ASSERT_TRUE(last_fd_ =3D=3D udpfd_ || connfds_.count(las=
t_fd_) !=3D 0)<br>
&gt; &gt; ++=C2=A0 =C2=A0 &lt;&lt; &quot;the most recent requester&#39;s co=
nnection has closed&quot;;<br>
&gt; &gt; ++=C2=A0 SendData(last_fd_, &amp;last_addr_, last_addrlen_, qid, =
reply-&gt;data());<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + void MockServer::ProcessRequest(ares_socket_t fd, struct sockad=
dr_storage*<br>
&gt; addr,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ares_socklen_t addrl=
en, const std::vector&lt;byte&gt; &amp;req,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const std::string &a=
mp;reqstr,<br>
&gt; &gt; +@@ -717,10 +764,14 @@ void MockServer::ProcessRequest(ares_socke=
t_t<br>
&gt; fd, struct sockaddr_storage* addr,<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* DNS 0x20 will mix case, do case-insensitive matc=
hing of name in request<br>
&gt; */<br>
&gt; &gt; +=C2=A0 =C2=A0char lower_name[256];<br>
&gt; &gt; +-=C2=A0 int flags =3D 0;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0arestest_strtolower(lower_name, name, sizeof(lower_=
name));<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 // Remember the requester so SendUnsolicited() can reach=
 it.<br>
&gt; &gt; ++=C2=A0 last_fd_ =3D fd;<br>
&gt; &gt; ++=C2=A0 memcpy(&amp;last_addr_, addr, sizeof(last_addr_));<br>
&gt; &gt; ++=C2=A0 last_addrlen_ =3D addrlen;<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0// Before processing, let gMock know the request is=
 happening.<br>
&gt; &gt; +=C2=A0 =C2=A0OnRequest(lower_name, rrtype);<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -747,43 +798,12 @@ void MockServer::ProcessRequest(ares_socke=
t_t<br>
&gt; fd, struct sockaddr_storage* addr,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 // Make a local copy of the current pending reply.<br>
&gt; &gt; +-=C2=A0 std::vector&lt;byte&gt; reply =3D exact_reply_;<br>
&gt; &gt; +-<br>
&gt; &gt; +=C2=A0 =C2=A0if (qid_ &gt;=3D 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0// Use the explicitly specified query ID.<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0qid =3D qid_;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +-=C2=A0 if (reply.size() &gt;=3D=C2=A0 2) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 // Overwrite the query ID if space to do so.<br>
&gt; &gt; +-=C2=A0 =C2=A0 reply[0] =3D (byte)((qid &gt;&gt; 8) &amp; 0xff);=
<br>
&gt; &gt; +-=C2=A0 =C2=A0 reply[1] =3D (byte)(qid &amp; 0xff);<br>
&gt; &gt; +-=C2=A0 }<br>
&gt; &gt; +-=C2=A0 if (verbose) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 std::cerr &lt;&lt; &quot;sending reply &quot; &lt=
;&lt; PacketToString(reply)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&lt; &quot=
; on port &quot; &lt;&lt; ((fd =3D=3D udpfd_) ? udpport_ : tcpport_)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;&lt; &quot=
;:&quot; &lt;&lt; getaddrport(addr) &lt;&lt; std::endl;<br>
&gt; &gt; +-=C2=A0 }<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0 // Prefix with 2-byte length if TCP.<br>
&gt; &gt; +-=C2=A0 if (fd !=3D udpfd_) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 int len =3D (int)reply.size();<br>
&gt; &gt; +-=C2=A0 =C2=A0 std::vector&lt;byte&gt; vlen =3D {(byte)((len &am=
p; 0xFF00) &gt;&gt; 8), (byte)(len &amp; 0xFF)};<br>
&gt; &gt; +-=C2=A0 =C2=A0 reply.insert(reply.begin(), vlen.begin(), vlen.en=
d());<br>
&gt; &gt; +-=C2=A0 =C2=A0 // Also, don&#39;t bother with the destination ad=
dress.<br>
&gt; &gt; +-=C2=A0 =C2=A0 addr =3D nullptr;<br>
&gt; &gt; +-=C2=A0 =C2=A0 addrlen =3D 0;<br>
&gt; &gt; +-=C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +-#ifdef MSG_NOSIGNAL<br>
&gt; &gt; +-=C2=A0 flags |=3D MSG_NOSIGNAL;<br>
&gt; &gt; +-#endif<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0 ares_ssize_t rc =3D (ares_ssize_t)sendto(fd, BYTE_CAST r=
eply.data(),<br>
&gt; (SEND_TYPE_ARG3)reply.size(), flags,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(struct sockaddr *)addr, addrlen);<br>
&gt; &gt; +-=C2=A0 if (rc &lt; static_cast&lt;ares_ssize_t&gt;(reply.size()=
)) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 std::cerr &lt;&lt; &quot;Failed to send full repl=
y, rc=3D&quot; &lt;&lt; rc &lt;&lt; std::endl;<br>
&gt; &gt; +-=C2=A0 }<br>
&gt; &gt; ++=C2=A0 SendData(fd, addr, addrlen, qid, exact_reply_);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0if (disconnect_after_reply_ &amp;&amp; fd !=3D udpf=
d_) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0disconnect_after_reply_ =3D false;<br>
&gt; &gt; +diff --git a/test/ares-test.h b/test/ares-test.h<br>
&gt; &gt; +index 2b973c3982..170c284f26 100644<br>
&gt; &gt; +--- a/test/ares-test.h<br>
&gt; &gt; ++++ b/test/ares-test.h<br>
&gt; &gt; +@@ -303,6 +303,12 @@ class MockServer {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0disconnect_after_reply_ =3D true;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 // Send reply, with the given query ID, to the client of=
 the most recent<br>
&gt; &gt; ++=C2=A0 // request this server received, on the socket that requ=
est arrived on.=C2=A0 The<br>
&gt; &gt; ++=C2=A0 // client did not send this server a request with that q=
uery ID: this models<br>
&gt; &gt; ++=C2=A0 // a server answering a query that was only sent to some=
 other server.<br>
&gt; &gt; ++=C2=A0 void SendUnsolicited(const DNSPacket *reply, unsigned sh=
ort qid);<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0// The set of file descriptors that the server hand=
les.<br>
&gt; &gt; +=C2=A0 =C2=A0std::set&lt;ares_socket_t&gt; fds() const;<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -327,6 +333,8 @@ class MockServer {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int rrtype);<br>
&gt; &gt; +=C2=A0 =C2=A0void=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Proces=
sPacket(ares_socket_t fd, struct sockaddr_storage *addr,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_socklen_t addrlen, by=
te *data, int len);<br>
&gt; &gt; ++=C2=A0 void SendData(ares_socket_t fd, struct sockaddr_storage =
*addr,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_so=
cklen_t addrlen, int qid, std::vector&lt;byte&gt; reply);<br>
&gt; &gt; +=C2=A0 =C2=A0unsigned short udpport_;<br>
&gt; &gt; +=C2=A0 =C2=A0unsigned short tcpport_;<br>
&gt; &gt; +=C2=A0 =C2=A0ares_socket_t=C2=A0 udpfd_;<br>
&gt; &gt; +@@ -339,6 +347,10 @@ class MockServer {<br>
&gt; &gt; +=C2=A0 =C2=A0bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 disconnect_after_reply_;<br>
&gt; &gt; +=C2=A0 =C2=A0unsigned char=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *tc=
p_data_;<br>
&gt; &gt; +=C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tcp_data_len_;<br>
&gt; &gt; ++=C2=A0 // Where the most recent request came from, for SendUnso=
licited().<br>
&gt; &gt; ++=C2=A0 ares_socket_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0la=
st_fd_;<br>
&gt; &gt; ++=C2=A0 struct sockaddr_storage last_addr_;<br>
&gt; &gt; ++=C2=A0 ares_socklen_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last_ad=
drlen_;<br>
&gt; &gt; + };<br>
&gt; &gt; +<br>
&gt; &gt; + // Test fixture that uses a mock DNS server.<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/c-ares/c-ares/0006-ares_save=
_options-read-<br>
&gt; channel-config-under-lock.patch b/meta-oe/recipes-support/c-ares/c-are=
s/0006-<br>
&gt; ares_save_options-read-channel-config-under-lock.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..76c072dd7e<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-support/c-ares/c-ares/0006-ares_save_option=
s-read-<br>
&gt; channel-config-under-lock.patch<br>
&gt; &gt; @@ -0,0 +1,243 @@<br>
&gt; &gt; +From 25a6911370878d4b617b44b142ea0e49d1ccede6 Mon Sep 17<br>
&gt; 00:00:00 2001<br>
&gt; &gt; +From: Brad House &lt;<a href=3D"mailto:brad@brad-house.com" targ=
et=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Date: Mon, 19 Oct 2026 11:53:59 -0400<br>
&gt; &gt; +Subject: [PATCH] [Backport v1.34] ares_save_options: read channe=
l<br>
&gt; &gt; + configuration under the channel lock (#1362)<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +Backport of 5d878a580a8b57b51d15e2725cf6775c8e7bca0e to `v1.34`.=
 See<br>
&gt; &gt; +that commit for the full description.<br>
&gt; &gt; +<br>
&gt; &gt; +**Conflicts:** none; cherry-picked cleanly.<br>
&gt; &gt; +<br>
&gt; &gt; +**Tests (local, macOS, Debug, Ninja):**<br>
&gt; &gt; +- ASAN+UBSAN and `-DCARES_WERROR=3DON` builds: `arestest -4<br>
&gt; &gt; +--gtest_filter=3D&#39;-*Live*&#39;` =E2=80=94 691/691 passed in =
both.<br>
&gt; &gt; +- With the `src/` changes reverted, the new `DupConcurrentSetSer=
vers` /<br>
&gt; &gt; +`SaveOptionsConcurrentSetServers` tests abort with an ASAN<br>
&gt; &gt; +heap-buffer-overflow; they pass with them.<br>
&gt; &gt; +- `git clang-format --diff upstream/v1.34` clean. Also tested to=
gether<br>
&gt; &gt; +with the other two v1.34 backports (both orders apply cleanly): =
699/699<br>
&gt; &gt; +passed under ASAN+UBSAN and `-Werror`.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Brad House &lt;<a href=3D"mailto:brad@brad-house.=
com" target=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/c-ares/=
c-" rel=3D"noreferrer" target=3D"_blank">https://github.com/c-ares/c-</a><b=
r>
&gt; ares/commit/25a6911370878d4b617b44b142ea0e49d1ccede6]<br>
&gt; &gt; +GHSA: GHSA-ph6c-3cvx-mq6v<br>
&gt; &gt; +---<br>
&gt; &gt; + src/lib/ares_init.c=C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt; &gt; + src/lib/ares_options.c | 45 ++++++++++++++++++----<br>
&gt; &gt; + test/ares-test-init.cc | 87<br>
&gt; ++++++++++++++++++++++++++++++++++++++++++<br>
&gt; &gt; + 3 files changed, 126 insertions(+), 9 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/lib/ares_init.c b/src/lib/ares_init.c<br>
&gt; &gt; +index 4758c5de56..85b2e13050 100644<br>
&gt; &gt; +--- a/src/lib/ares_init.c<br>
&gt; &gt; ++++ b/src/lib/ares_init.c<br>
&gt; &gt; +@@ -483,7 +483,8 @@ int ares_dup(ares_channel_t **dest, const<br=
>
&gt; ares_channel_t *src)<br>
&gt; &gt; +=C2=A0 =C2=A0*dest =3D NULL; /* in case of failure return NULL e=
xplicitly */<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0/* First get the options supported by the old ares_=
save_options() function,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0which is most of them */<br>
&gt; &gt; ++=C2=A0 =C2=A0* which is most of them.=C2=A0 ares_save_options()=
 takes the src channel lock<br>
&gt; &gt; ++=C2=A0 =C2=A0* itself.=C2=A0 No lock is held across ares_init_o=
ptions(). */<br>
&gt; &gt; +=C2=A0 =C2=A0rc =3D (ares_status_t)ares_save_options(src, &amp;o=
pts, &amp;optmask);<br>
&gt; &gt; +=C2=A0 =C2=A0if (rc !=3D ARES_SUCCESS) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ares_destroy_options(&amp;opts);<br>
&gt; &gt; +diff --git a/src/lib/ares_options.c b/src/lib/ares_options.c<br>
&gt; &gt; +index 2b5624bbea..5ea35b732e 100644<br>
&gt; &gt; +--- a/src/lib/ares_options.c<br>
&gt; &gt; ++++ b/src/lib/ares_options.c<br>
&gt; &gt; +@@ -55,8 +55,8 @@ static struct in_addr *ares_save_opt_servers(c=
onst<br>
&gt; ares_channel_t *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 *nservers)<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_slist_node_t *snode;<br>
&gt; &gt; +-=C2=A0 struct in_addr=C2=A0 =C2=A0 *out =3D<br>
&gt; &gt; +-=C2=A0 =C2=A0 ares_malloc_zero(ares_slist_len(channel-&gt;serve=
rs) * sizeof(*out));<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cn=
t =3D ares_slist_len(channel-&gt;servers);<br>
&gt; &gt; ++=C2=A0 struct in_addr=C2=A0 =C2=A0 *out =3D ares_malloc_zero_ar=
ray(cnt, sizeof(*out));<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0*nservers =3D 0;<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -64,7 +64,11 @@ static struct in_addr *ares_save_opt_servers(=
const<br>
&gt; ares_channel_t *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 for (snode =3D ares_slist_node_first(channel-&gt;servers=
); snode !=3D NULL;<br>
&gt; &gt; ++=C2=A0 /* Never write more entries than were allocated.=C2=A0 T=
he caller holds the<br>
&gt; &gt; ++=C2=A0 =C2=A0* channel lock so the server list cannot change un=
derneath us; this is<br>
&gt; &gt; ++=C2=A0 =C2=A0* purely defensive. */<br>
&gt; &gt; ++=C2=A0 for (snode =3D ares_slist_node_first(channel-&gt;servers=
);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0snode !=3D NULL &amp;&amp; (size_t)*=
nservers &lt; cnt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 snode =3D ares_slist_node_next(snode=
)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0const ares_server_t *server =3D ares_slist_n=
ode_val(snode);<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -79,9 +83,11 @@ static struct in_addr *ares_save_opt_servers(=
const<br>
&gt; ares_channel_t *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0return out;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +-/* Save options from initialized channel */<br>
&gt; &gt; +-int ares_save_options(const ares_channel_t *channel,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 struct ares_options *options, int *optmask)<br>
&gt; &gt; ++/* Save options from initialized channel.=C2=A0 Caller must hol=
d the channel lock<br>
&gt; &gt; ++ * (if channel is not NULL). */<br>
&gt; &gt; ++static ares_status_t ares_save_options_nolock(const ares_channe=
l_t<br>
&gt; *channel,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct ares_options=C2=A0 *options,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 *optmask)<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0size_t i;<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -150,7 +156,8 @@ int ares_save_options(const ares_channel_t<b=
r>
&gt; *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0if (channel-&gt;optmask &amp; ARES_OPT_DOMAINS) {<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0options-&gt;domains =3D NULL;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (channel-&gt;ndomains) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 options-&gt;domains =3D ares_malloc(channe=
l-&gt;ndomains * sizeof(char *));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 options-&gt;domains =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_malloc_zero_array(channel-&gt;=
ndomains, sizeof(char *));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!options-&gt;domains) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ARES_ENOMEM;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +@@ -176,7 +183,8 @@ int ares_save_options(const ares_channel_t<b=
r>
&gt; *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0if (channel-&gt;optmask &amp; ARES_OPT_SORTLIST) {<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0options-&gt;sortlist =3D NULL;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (channel-&gt;nsort) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 options-&gt;sortlist =3D ares_malloc(chann=
el-&gt;nsort * sizeof(struct apattern));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 options-&gt;sortlist =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_malloc_zero_array(channel-&gt;=
nsort, sizeof(*options-&gt;sortlist));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!options-&gt;sortlist) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ARES_ENOMEM;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +@@ -238,6 +246,27 @@ int ares_save_options(const ares_channel_t<=
br>
&gt; *channel,<br>
&gt; &gt; +=C2=A0 =C2=A0return ARES_SUCCESS;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++int ares_save_options(const ares_channel_t *channel,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 struct ares_options *options, int *optmask)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ares_status_t status;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (channel =3D=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Preserve historic behavior: initialize the poi=
nters so<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* ares_destroy_options() is safe, then retu=
rn ARES_ENODATA */<br>
&gt; &gt; ++=C2=A0 =C2=A0 return (int)ares_save_options_nolock(NULL, option=
s, optmask);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* The configuration may be modified concurrently by oth=
er threads (e.g.<br>
&gt; &gt; ++=C2=A0 =C2=A0* ares_set_servers_csv()), so it must only be read=
 with the channel lock<br>
&gt; &gt; ++=C2=A0 =C2=A0* held. */<br>
&gt; &gt; ++=C2=A0 ares_channel_lock(channel);<br>
&gt; &gt; ++=C2=A0 status =3D ares_save_options_nolock(channel, options, op=
tmask);<br>
&gt; &gt; ++=C2=A0 ares_channel_unlock(channel);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 return (int)status;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + static ares_status_t ares_init_options_servers(ares_channel_t=
=C2=A0 =C2=A0 =C2=A0 =C2=A0*channel,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct in_addr *servers,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 nservers)<br>
&gt; &gt; +diff --git a/test/ares-test-init.cc b/test/ares-test-init.cc<br>
&gt; &gt; +index b44211a1e4..1c5d0f2171 100644<br>
&gt; &gt; +--- a/test/ares-test-init.cc<br>
&gt; &gt; ++++ b/test/ares-test-init.cc<br>
&gt; &gt; +@@ -25,6 +25,8 @@<br>
&gt; &gt; +=C2=A0 */<br>
&gt; &gt; + #include &quot;ares-test.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; ++#include &lt;atomic&gt;<br>
&gt; &gt; ++<br>
&gt; &gt; + extern &quot;C&quot; {<br>
&gt; &gt; +=C2=A0 =C2=A0#include &quot;ares_private.h&quot;<br>
&gt; &gt; + }<br>
&gt; &gt; +@@ -295,6 +297,91 @@ TEST_F(LibraryTest, FailChannelInit) {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_library_cleanup();<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++// CARES_THREADS implies ares_threadsafety() is true<br>
&gt; &gt; ++#ifdef CARES_THREADS<br>
&gt; &gt; ++// Build a CSV list of n distinct IPv4 servers.<br>
&gt; &gt; ++static std::string ConfigRaceServerCsv(size_t n)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 std::string csv;<br>
&gt; &gt; ++=C2=A0 for (size_t i =3D 0; i &lt; n; i++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (i !=3D 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 csv +=3D &quot;,&quot;;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 csv +=3D &quot;127.0.&quot; + std::to_string((i /=
 250) + 1) + &quot;.&quot; +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::to_string((i % 25=
0) + 1) + &quot;:5353&quot;;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 return csv;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++// Readers snapshot the channel configuration (via ares_dup() o=
r<br>
&gt; &gt; ++// ares_save_options()) while a writer thread keeps swapping th=
e server list<br>
&gt; &gt; ++// between a short and a long one.=C2=A0 The configuration must=
 only be read<br>
&gt; under<br>
&gt; &gt; ++// the channel lock; otherwise the saved server array is sized =
from one list<br>
&gt; &gt; ++// and filled from another (heap-buffer-overflow under ASAN).<b=
r>
&gt; &gt; ++static void ConfigRaceRun(bool use_dup, size_t reader_loops)<br=
>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 const size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 nreaders=C2=A0 =
=3D 4;<br>
&gt; &gt; ++=C2=A0 const std::string=C2=A0 =C2=A0small_csv =3D ConfigRaceSe=
rverCsv(4);<br>
&gt; &gt; ++=C2=A0 const std::string=C2=A0 =C2=A0large_csv =3D ConfigRaceSe=
rverCsv(400);<br>
&gt; &gt; ++=C2=A0 ares_channel_t=C2=A0 =C2=A0 =C2=A0*channel=C2=A0 =C2=A0=
=3D nullptr;<br>
&gt; &gt; ++=C2=A0 std::atomic&lt;size_t&gt; readers_done(0);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_init_options(&amp;channel, =
nullptr, 0));<br>
&gt; &gt; ++=C2=A0 ASSERT_NE(nullptr, channel);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, ares_set_servers_csv(channel,<br=
>
&gt; small_csv.c_str()));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Writer runs until every reader finished; readers are =
bounded so the<br>
&gt; &gt; ++=C2=A0 // whole test is bounded.<br>
&gt; &gt; ++=C2=A0 std::thread=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 writer([&amp;]() {<br>
&gt; &gt; ++=C2=A0 =C2=A0 size_t i =3D 0;<br>
&gt; &gt; ++=C2=A0 =C2=A0 while (readers_done.load() &lt; nreaders) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ares_set_servers_csv(channel,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(i++ &amp; 1) ? large_csv.c_str() : small=
_csv.c_str());<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 });<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 std::vector&lt;std::thread&gt; readers;<br>
&gt; &gt; ++=C2=A0 for (size_t r =3D 0; r &lt; nreaders; r++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 readers.emplace_back([&amp;]() {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 for (size_t i =3D 0; i &lt; reader_loops; =
i++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (use_dup) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_channel_t *dup =3D null=
ptr;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS, ares=
_dup(&amp;dup, channel));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dup !=3D nullptr) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_destroy(dup);<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ares_options opts;<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optmask =3D 0;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;opts, 0, sizeof(=
opts));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXPECT_EQ(ARES_SUCCESS, ares=
_save_options(channel, &amp;opts,<br>
&gt; &amp;optmask));<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXPECT_NE(0, optmask &amp; A=
RES_OPT_SERVERS);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXPECT_TRUE(opts.nservers =
=3D=3D 4 || opts.nservers =3D=3D 400);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_destroy_options(&amp;op=
ts);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 readers_done++;<br>
&gt; &gt; ++=C2=A0 =C2=A0 });<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 for (auto &amp;t : readers) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 t.join();<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 writer.join();<br>
&gt; &gt; ++=C2=A0 ares_destroy(channel);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, DupConcurrentSetServers)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ConfigRaceRun(true, 20);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++TEST_F(LibraryTest, SaveOptionsConcurrentSetServers)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ConfigRaceRun(false, 20000);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++#endif<br>
&gt; &gt; ++<br>
&gt; &gt; + #ifndef WIN32<br>
&gt; &gt; + TEST_F(LibraryTest, EnvInit) {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_channel_t *channel =3D nullptr;<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/c-ares/c-ares/0007-ares_inet=
_pton-reject-a-<br>
&gt; prefix-length.patch b/meta-oe/recipes-support/c-ares/c-ares/0007-ares_=
inet_pton-<br>
&gt; reject-a-prefix-length.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..2cd1ea8c24<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-support/c-ares/c-ares/0007-ares_inet_pton-r=
eject-a-<br>
&gt; prefix-length.patch<br>
&gt; &gt; @@ -0,0 +1,364 @@<br>
&gt; &gt; +From 7e65b381c0b915aa5671ddc713080c87e15fc42f Mon Sep 17 00:00:0=
0<br>
&gt; 2001<br>
&gt; &gt; +From: Brad House &lt;<a href=3D"mailto:brad@brad-house.com" targ=
et=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Date: Mon, 19 Oct 2026 12:24:52 -0400<br>
&gt; &gt; +Subject: [PATCH] [Backport v1.34] ares_inet_pton: reject a prefi=
x length,<br>
&gt; &gt; + always write the full address (#1363)<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +Backport of 7b4ef8e555b611be6af39d913aa280cd1a348102 to `v1.34`.=
 See<br>
&gt; &gt; +that commit for the full description.<br>
&gt; &gt; +<br>
&gt; &gt; +**Conflicts:** `test/ares-test-mock-ai.cc` only =E2=80=94 the ne=
ighbouring<br>
&gt; &gt; +`FamilyV6IgnoresARecords` test (added on main by an unrelated ch=
ange)<br>
&gt; &gt; +does not exist on v1.34. Resolved by adding only the new<br>
&gt; &gt; +`NumericHostRejectsPrefixLength` test at the same position. Othe=
r files<br>
&gt; &gt; +applied unchanged.<br>
&gt; &gt; +<br>
&gt; &gt; +**Also includes** the comment spelling fix from #1364<br>
&gt; &gt; +(ead5557d1301328536c3920bd01759a1bff5ca9a): &quot;unparseable&qu=
ot; -&gt;<br>
&gt; &gt; +&quot;unparsable&quot; in `src/lib/inet_net_pton.c` and<br>
&gt; &gt; +`test/ares-test-internal.cc`, so Codespell passes and the text m=
atches<br>
&gt; &gt; +main.<br>
&gt; &gt; +<br>
&gt; &gt; +**Tests (local, macOS, Debug, Ninja):**<br>
&gt; &gt; +- ASAN+UBSAN and `-DCARES_WERROR=3DON` builds: `arestest -4<br>
&gt; &gt; +--gtest_filter=3D&#39;-*Live*&#39;` =E2=80=94 693/693 passed in =
both.<br>
&gt; &gt; +- With the `src/` changes reverted, the 4 new test instances fai=
l<br>
&gt; &gt; +(`InetNetPtoNPrefixZeroFills`, `InetPtoNRejectsPrefixLength`,<br=
>
&gt; &gt; +`NumericHostRejectsPrefixLength` UDP/TCP); they pass with them.<=
br>
&gt; &gt; +- `git clang-format --diff upstream/v1.34` clean. Also tested to=
gether<br>
&gt; &gt; +with the other two v1.34 backports (both orders apply cleanly): =
699/699<br>
&gt; &gt; +passed under ASAN+UBSAN and `-Werror`.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Brad House &lt;<a href=3D"mailto:brad@brad-house.=
com" target=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/c-ares/=
c-" rel=3D"noreferrer" target=3D"_blank">https://github.com/c-ares/c-</a><b=
r>
&gt; ares/commit/7e65b381c0b915aa5671ddc713080c87e15fc42f]<br>
&gt; &gt; +GHSA: GHSA-cfcv-8v2j-qj6r<br>
&gt; &gt; +---<br>
&gt; &gt; + docs/ares_inet_pton.3=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 ++++++++-=
-<br>
&gt; &gt; + src/lib/ares_inet_net_pton.h | 28 ++++++++++++++++<br>
&gt; &gt; + src/lib/inet_net_pton.c=C2=A0 =C2=A0 =C2=A0 | 65 ++++++++++++++=
++++++----------------<br>
&gt; &gt; + test/ares-test-internal.cc=C2=A0 =C2=A0| 54 +++++++++++++++++++=
+++++++++++<br>
&gt; &gt; + test/ares-test-mock-ai.cc=C2=A0 =C2=A0 | 23 +++++++++++++<br>
&gt; &gt; + 5 files changed, 157 insertions(+), 31 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/docs/ares_inet_pton.3 b/docs/ares_inet_pton.3<br>
&gt; &gt; +index 34b2df063c..19c5fdfda3 100644<br>
&gt; &gt; +--- a/docs/ares_inet_pton.3<br>
&gt; &gt; ++++ b/docs/ares_inet_pton.3<br>
&gt; &gt; +@@ -12,8 +12,9 @@ ares_inet_pton \- convert an IPv4 or IPv6 addr=
ess from<br>
&gt; text to binary form<br>
&gt; &gt; + int ares_inet_pton(int \fIaf\fP, const char *\fIsrc\fP, void *\=
fIdst\fP);<br>
&gt; &gt; + .fi<br>
&gt; &gt; + .SH DESCRIPTION<br>
&gt; &gt; +-This is a portable version with the identical functionality of =
the commonly<br>
&gt; &gt; +-available \fIinet_pton\fP.<br>
&gt; &gt; ++This is a portable version of the commonly available \fIinet_pt=
on\fP.=C2=A0 It<br>
&gt; &gt; ++behaves the same for AF_INET6, and for AF_INET it additionally =
accepts the<br>
&gt; &gt; ++legacy forms described below.<br>
&gt; &gt; +<br>
&gt; &gt; + The ares_inet_pton() function converts the address in its stand=
ard text<br>
&gt; &gt; + presentation form into its numeric binary form. The \fBaf\fP ar=
gument shall<br>
&gt; &gt; +@@ -23,9 +24,20 @@ in. The \fBdst\fP argument points to a buffer=
 into which<br>
&gt; the function stores<br>
&gt; &gt; + the numeric address; this shall be large enough to hold the num=
eric address<br>
&gt; &gt; + (32 bits for AF_INET, 128 bits for AF_INET6).<br>
&gt; &gt; +<br>
&gt; &gt; ++The \fBsrc\fP argument must be an address, not a network: a &qu=
ot;/bits&quot; prefix<br>
&gt; &gt; ++length suffix (CIDR notation) is not accepted and the function =
returns 0 for<br>
&gt; &gt; ++such input.=C2=A0 On success, the whole address (4 bytes for AF=
_INET, 16 bytes for<br>
&gt; &gt; ++AF_INET6) is always written to \fBdst\fP.=C2=A0 Versions of c-a=
res before 1.34.9<br>
&gt; &gt; ++accepted a prefix length here.<br>
&gt; &gt; ++<br>
&gt; &gt; ++Unlike POSIX \fIinet_pton\fP, AF_INET also accepts shortened fo=
rms such as<br>
&gt; &gt; ++&quot;10.1&quot; and hexadecimal forms such as &quot;0x0a000001=
&quot;.=C2=A0 Octets that are not<br>
&gt; given<br>
&gt; &gt; ++are set to zero, so &quot;10.1&quot; is 10.1.0.0.<br>
&gt; &gt; ++<br>
&gt; &gt; + It returns 1 if the address was valid for the specified address=
 family, or 0<br>
&gt; &gt; + if the address was not parseable in the specified address famil=
y, or -1 if<br>
&gt; &gt; +-some system error occurred (in which case errno will have been =
set).<br>
&gt; &gt; ++the address family is not supported (in which case errno will h=
ave been set<br>
&gt; &gt; ++to EAFNOSUPPORT).<br>
&gt; &gt; +<br>
&gt; &gt; + .SH SEE ALSO<br>
&gt; &gt; + .BR ares_init (3),<br>
&gt; &gt; +diff --git a/src/lib/ares_inet_net_pton.h b/src/lib/ares_inet_ne=
t_pton.h<br>
&gt; &gt; +index e3ed83a3cb..e1a6f2d71e 100644<br>
&gt; &gt; +--- a/src/lib/ares_inet_net_pton.h<br>
&gt; &gt; ++++ b/src/lib/ares_inet_net_pton.h<br>
&gt; &gt; +@@ -26,6 +26,34 @@<br>
&gt; &gt; + #ifndef HEADER_CARES_INET_NET_PTON_H<br>
&gt; &gt; + #define HEADER_CARES_INET_NET_PTON_H<br>
&gt; &gt; +<br>
&gt; &gt; ++/*! Parse a network (an address with an optional &quot;/bits&qu=
ot; prefix length) from<br>
&gt; &gt; ++ *=C2=A0 its text form.=C2=A0 This is not an address parser: fo=
r an address use<br>
&gt; &gt; ++ *=C2=A0 ares_inet_pton(), which rejects a prefix length and al=
ways writes the<br>
&gt; &gt; ++ *=C2=A0 whole address.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 How it differs from ares_inet_pton():<br>
&gt; &gt; ++ *=C2=A0 =C2=A0- A &quot;/bits&quot; prefix length is accepted =
(0-32 for IPv4, 0-128 for IPv6).<br>
&gt; &gt; ++ *=C2=A0 =C2=A0- The return value is the prefix length, not 1.=
=C2=A0 Without &quot;/bits&quot;, IPv6<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0returns 128 and IPv4 infers it from the a=
ddress class, widened to<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0cover every octet given (&quot;10&quot; i=
s 8, &quot;130.155&quot; is 16, &quot;1.2.3.4&quot; is 32,<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0and a lone &quot;224&quot; is 4).=C2=A0 0=
 is a valid result (&quot;::1/0&quot;).<br>
&gt; &gt; ++ *=C2=A0 =C2=A0- What is written to dst differs by family.=C2=
=A0 On success all size bytes<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0are zeroed first.=C2=A0 IPv4 then writes =
every octet given, including bits<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0beyond the prefix (&quot;<a href=3D"http:=
//1.2.3.4/8" rel=3D"noreferrer" target=3D"_blank">1.2.3.4/8</a>&quot; write=
s 1.2.3.4).=C2=A0 IPv6 writes only the<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0(bits+7)/8 bytes covering the prefix (&qu=
ot;2001:db8::1/64&quot; writes<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A02001:db8::).<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ *=C2=A0 \param[in]=C2=A0 af=C2=A0 =C2=A0 AF_INET or AF_INET6.<=
br>
&gt; &gt; ++ *=C2=A0 \param[in]=C2=A0 src=C2=A0 =C2=A0NUL-terminated networ=
k in text form.<br>
&gt; &gt; ++ *=C2=A0 \param[out] dst=C2=A0 =C2=A0Buffer to receive the netw=
ork, in network byte order.<br>
&gt; &gt; ++ *=C2=A0 \param[in]=C2=A0 size=C2=A0 Size of dst in bytes.<br>
&gt; &gt; ++ *=C2=A0 \return Prefix length in bits on success.=C2=A0 -1 on =
failure, with SOCKERRNO<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set to ENOENT if src is no=
t a valid network, or EMSGSIZE if it<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 does not fit in size bytes=
 or (IPv6) src is too long to be a<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network.=C2=A0 On Windows =
these are the WSA equivalents.=C2=A0 An<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsupported af returns -1 =
without setting SOCKERRNO.=C2=A0 On failure<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst may be partially writt=
en.<br>
&gt; &gt; ++ */<br>
&gt; &gt; + int ares_inet_net_pton(int af, const char *src, void *dst, size=
_t size);<br>
&gt; &gt; +<br>
&gt; &gt; + #endif /* HEADER_CARES_INET_NET_PTON_H */<br>
&gt; &gt; +diff --git a/src/lib/inet_net_pton.c b/src/lib/inet_net_pton.c<b=
r>
&gt; &gt; +index e1f76ef834..f60823023b 100644<br>
&gt; &gt; +--- a/src/lib/inet_net_pton.c<br>
&gt; &gt; ++++ b/src/lib/inet_net_pton.c<br>
&gt; &gt; +@@ -51,14 +51,15 @@ const struct ares_in6_addr ares_in6addr_any =
=3D { { { 0,<br>
&gt; 0, 0, 0, 0, 0, 0, 0, 0,<br>
&gt; &gt; +<br>
&gt; &gt; + /*<br>
&gt; &gt; +=C2=A0 * static int<br>
&gt; &gt; +- * inet_net_pton_ipv4(src, dst, size)<br>
&gt; &gt; ++ * inet_net_pton_ipv4(src, dst, size, allow_cidr)<br>
&gt; &gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 convert IPv4 network number from pr=
esentation to network format.<br>
&gt; &gt; +- *=C2=A0 =C2=A0 =C2=A0 accepts hex octets, hex strings, decimal=
 octets, and /CIDR.<br>
&gt; &gt; +- *=C2=A0 =C2=A0 =C2=A0 &quot;size&quot; is in bytes and describ=
es &quot;dst&quot;.<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 accepts hex octets, hex strings, decimal=
 octets, and, if<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 &quot;allow_cidr&quot; is true, /CIDR.=
=C2=A0 &quot;size&quot; is in bytes and describes &quot;dst&quot;.<br>
&gt; &gt; +=C2=A0 * return:<br>
&gt; &gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 number of bits, either imputed clas=
sfully or specified with /CIDR,<br>
&gt; &gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 or -1 if some failure occurred (che=
ck errno).=C2=A0 ENOENT means it was<br>
&gt; &gt; +- *=C2=A0 =C2=A0 =C2=A0 not an IPv4 network specification.<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 not an IPv4 network specification (inclu=
ding a /CIDR suffix when<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 &quot;allow_cidr&quot; is false).<br>
&gt; &gt; +=C2=A0 * note:<br>
&gt; &gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 network byte order assumed.=C2=A0 t=
his means <a href=3D"http://192.5.5.240/28" rel=3D"noreferrer" target=3D"_b=
lank">192.5.5.240/28</a> has<br>
&gt; &gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 0b11110000 in its fourth octet.<br>
&gt; &gt; +@@ -71,7 +72,7 @@ const struct ares_in6_addr ares_in6addr_any =
=3D { { { 0, 0,<br>
&gt; 0, 0, 0, 0, 0, 0, 0,<br>
&gt; &gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 Paul Vixie (ISC), June 1996<br>
&gt; &gt; +=C2=A0 */<br>
&gt; &gt; + static int ares_inet_net_pton_ipv4(const char *src, unsigned ch=
ar *dst,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size)<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size, =
ares_bool_t allow_cidr)<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0static const char=C2=A0 =C2=A0 xdigits[] =3D &quot;=
0123456789abcdef&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0static const char=C2=A0 =C2=A0 digits[]=C2=A0 =3D &=
quot;0123456789&quot;;<br>
&gt; &gt; +@@ -147,7 +148,8 @@ static int ares_inet_net_pton_ipv4(const cha=
r *src,<br>
&gt; unsigned char *dst,<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0bits =3D -1;<br>
&gt; &gt; +-=C2=A0 if (ch =3D=3D &#39;/&#39; &amp;&amp; ares_isascii(src[0]=
) &amp;&amp; ares_isdigit(src[0]) &amp;&amp; dst &gt; odst) {<br>
&gt; &gt; ++=C2=A0 if (allow_cidr &amp;&amp; ch =3D=3D &#39;/&#39; &amp;&am=
p; ares_isascii(src[0]) &amp;&amp; ares_isdigit(src[0]) &amp;&amp;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 dst &gt; odst) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* CIDR width specifier.=C2=A0 Nothing can f=
ollow it. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ch=C2=A0 =C2=A0=3D *src++; /* Skip over the =
/. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0bits =3D 0;<br>
&gt; &gt; +@@ -317,7 +319,7 @@ static int ares_inet_pton6(const char *src, =
unsigned<br>
&gt; char *dst)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ch =3D=3D &#39;.&#39; &amp;&amp; ((tp + =
NS_INADDRSZ) &lt;=3D endp) &amp;&amp;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_inet_net_pton_ipv4(curtok, tp,=
 NS_INADDRSZ) &gt; 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ares_inet_net_pton_ipv4(curtok, tp,=
 NS_INADDRSZ, ARES_FALSE) &gt; 0)<br>
&gt; {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D NS_INADDRSZ;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0saw_xdigit=C2=A0 =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0break; /* &#39;\0&#39; was seen by in=
et_pton4(). */<br>
&gt; &gt; +@@ -400,29 +402,23 @@ static int ares_inet_net_pton_ipv6(const c=
har *src,<br>
&gt; unsigned char *dst,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0SET_SOCKERRNO(EMSGSIZE);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; ++=C2=A0 /* Only the first (bits+7)/8 bytes carry the network, ze=
ro the remainder of<br>
&gt; &gt; ++=C2=A0 =C2=A0* the caller&#39;s buffer so it never holds uninit=
ialized data. */<br>
&gt; &gt; ++=C2=A0 memset(dst, 0, size);<br>
&gt; &gt; +=C2=A0 =C2=A0memcpy(dst, &amp;in6, bytes);<br>
&gt; &gt; +=C2=A0 =C2=A0return (int)bits;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +-/*<br>
&gt; &gt; +- * int<br>
&gt; &gt; +- * inet_net_pton(af, src, dst, size)<br>
&gt; &gt; +- *=C2=A0 =C2=A0 =C2=A0 convert network number from presentation=
 to network format.<br>
&gt; &gt; +- *=C2=A0 =C2=A0 =C2=A0 accepts hex octets, hex strings, decimal=
 octets, and /CIDR.<br>
&gt; &gt; +- *=C2=A0 =C2=A0 =C2=A0 &quot;size&quot; is in bytes and describ=
es &quot;dst&quot;.<br>
&gt; &gt; +- * return:<br>
&gt; &gt; +- *=C2=A0 =C2=A0 =C2=A0 number of bits, either imputed classfull=
y or specified with /CIDR,<br>
&gt; &gt; +- *=C2=A0 =C2=A0 =C2=A0 or -1 if some failure occurred (check er=
rno).=C2=A0 ENOENT means it was<br>
&gt; &gt; +- *=C2=A0 =C2=A0 =C2=A0 not a valid network specification.<br>
&gt; &gt; ++/* Parse a network, not an address.=C2=A0 See ares_inet_net_pto=
n.h for the<br>
&gt; &gt; ++ * contract and how it differs from ares_inet_pton().<br>
&gt; &gt; +=C2=A0 * author:<br>
&gt; &gt; +=C2=A0 *=C2=A0 =C2=A0 =C2=A0 Paul Vixie (ISC), June 1996<br>
&gt; &gt; +- *<br>
&gt; &gt; +=C2=A0 */<br>
&gt; &gt; + int ares_inet_net_pton(int af, const char *src, void *dst, size=
_t size)<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0 =C2=A0switch (af) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case AF_INET:<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 return ares_inet_net_pton_ipv4(src, dst, s=
ize);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 return ares_inet_net_pton_ipv4(src, dst, s=
ize, ARES_TRUE);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case AF_INET6:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ares_inet_net_pton_ipv6(src, d=
st, size);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; &gt; +@@ -430,22 +426,35 @@ int ares_inet_net_pton(int af, const char =
*src, void<br>
&gt; *dst, size_t size)<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++/*<br>
&gt; &gt; ++ * int<br>
&gt; &gt; ++ * inet_pton(af, src, dst)<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 convert an address (not a network) from =
presentation to network<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 format, like POSIX inet_pton().=C2=A0 A =
&quot;/bits&quot; prefix length denotes a<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 prefix, not an address (RFC 4291 Section=
 2.3 vs. the address text<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 forms of Section 2.2), and is rejected; =
dst is always fully written<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 on success (4 bytes for AF_INET, 16 byte=
s for AF_INET6).<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 For a network with a prefix length, use =
ares_inet_net_pton().<br>
&gt; &gt; ++ * return:<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 1 on success, 0 if src is not a valid ad=
dress for af (as POSIX<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 inet_pton() does for any unparsable inpu=
t), or -1 with errno set to<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 EAFNOSUPPORT if af is not supported.<br>
&gt; &gt; ++ */<br>
&gt; &gt; + int ares_inet_pton(int af, const char *src, void *dst)<br>
&gt; &gt; + {<br>
&gt; &gt; +-=C2=A0 int=C2=A0 =C2=A0 result;<br>
&gt; &gt; +-=C2=A0 size_t size;<br>
&gt; &gt; ++=C2=A0 int result;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0if (af =3D=3D AF_INET) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 size =3D sizeof(struct in_addr);<br>
&gt; &gt; ++=C2=A0 =C2=A0 result =3D<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ares_inet_net_pton_ipv4(src, dst, sizeof(s=
truct in_addr), ARES_FALSE);<br>
&gt; &gt; +=C2=A0 =C2=A0} else if (af =3D=3D AF_INET6) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 size =3D sizeof(struct ares_in6_addr);<br>
&gt; &gt; ++=C2=A0 =C2=A0 result =3D ares_inet_pton6(src, dst);<br>
&gt; &gt; +=C2=A0 =C2=A0} else {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0SET_SOCKERRNO(EAFNOSUPPORT);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +-=C2=A0 result =3D ares_inet_net_pton(af, src, dst, size);<br>
&gt; &gt; +-=C2=A0 if (result =3D=3D -1 &amp;&amp; SOCKERRNO =3D=3D ENOENT)=
 {<br>
&gt; &gt; +-=C2=A0 =C2=A0 return 0;<br>
&gt; &gt; +-=C2=A0 }<br>
&gt; &gt; +-=C2=A0 return (result &gt; -1) ? 1 : -1;<br>
&gt; &gt; ++=C2=A0 /* Neither parser can fail for a system reason: any fail=
ure (ENOENT, or<br>
&gt; &gt; ++=C2=A0 =C2=A0* EMSGSIZE for too many IPv4 octets as in &quot;1.=
2.3.4.5&quot;) means src is not a<br>
&gt; &gt; ++=C2=A0 =C2=A0* valid address. */<br>
&gt; &gt; ++=C2=A0 return (result &gt; -1) ? 1 : 0;<br>
&gt; &gt; + }<br>
&gt; &gt; +diff --git a/test/ares-test-internal.cc b/test/ares-test-interna=
l.cc<br>
&gt; &gt; +index bf06a74605..294e3f4555 100644<br>
&gt; &gt; +--- a/test/ares-test-internal.cc<br>
&gt; &gt; ++++ b/test/ares-test-internal.cc<br>
&gt; &gt; +@@ -274,6 +274,23 @@ TEST_F(LibraryTest, InetNetPtoN) {<br>
&gt; &gt; +=C2=A0 =C2=A0EXPECT_EQ(-1, ares_inet_net_pton(AF_INET, &quot;253=
&quot;, &amp;a4, sizeof(a4) - 1));<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++// An IPv6 network with a prefix length only carries (bits+7)/8=
 bytes; the<br>
&gt; &gt; ++// rest of the destination must be zeroed rather than left as i=
t was.<br>
&gt; &gt; ++TEST_F(LibraryTest, InetNetPtoNPrefixZeroFills) {<br>
&gt; &gt; ++=C2=A0 unsigned char a6[16];<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(a6, 0x41, sizeof(a6));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(0, ares_inet_net_pton(AF_INET6, &quot;::1/0&qu=
ot;, a6, sizeof(a6)));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(&quot;0000:0000:0000:0000:0000:0000:0000:0000&=
quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AddressToString(a6, 1=
6));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(a6, 0x41, sizeof(a6));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(64, ares_inet_net_pton(AF_INET6, &quot;2001:db=
8:1:2:3:4:5:6/64&quot;,<br>
&gt; a6,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(a6)));=
<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(&quot;2001:0db8:0001:0002:0000:0000:0000:0000&=
quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AddressToString(a6, 1=
6));<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + TEST_F(LibraryTest, FreeLongChain) {<br>
&gt; &gt; +=C2=A0 =C2=A0struct ares_addr_node *data =3D nullptr;<br>
&gt; &gt; +=C2=A0 =C2=A0for (int ii =3D 0; ii &lt; 100000; ii++) {<br>
&gt; &gt; +@@ -600,9 +617,46 @@ TEST_F(LibraryTest, InetPtoN) {<br>
&gt; &gt; +=C2=A0 =C2=A0EXPECT_EQ(1, ares_inet_pton(AF_INET6, &quot;12:34::=
ff&quot;, &amp;a6));<br>
&gt; &gt; +=C2=A0 =C2=A0EXPECT_EQ(1, ares_inet_pton(AF_INET6, &quot;12:34::=
ffff:1.2.3.4&quot;, &amp;a6));<br>
&gt; &gt; +=C2=A0 =C2=A0EXPECT_EQ(0, ares_inet_pton(AF_INET, &quot;xyzzy&qu=
ot;, &amp;a4));<br>
&gt; &gt; ++=C2=A0 // Too many octets is unparsable input, not a system err=
or.<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(0, ares_inet_pton(AF_INET, &quot;1.2.3.4.5&quo=
t;, &amp;a4));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(0, ares_inet_pton(AF_INET, &quot;0x0102030405&=
quot;, &amp;a4));<br>
&gt; &gt; +=C2=A0 =C2=A0EXPECT_EQ(-1, ares_inet_pton(AF_INET+AF_INET6, &quo=
t;1.2.3.4&quot;, &amp;a4));<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++// ares_inet_pton() parses addresses, not networks: like inet_p=
ton(3) it must<br>
&gt; &gt; ++// reject a &quot;/bits&quot; prefix length.=C2=A0 It used to a=
ccept one and, for IPv6, write<br>
&gt; &gt; ++// only (bits+7)/8 bytes of dst while still returning 1.<br>
&gt; &gt; ++TEST_F(LibraryTest, InetPtoNRejectsPrefixLength) {<br>
&gt; &gt; ++=C2=A0 const char *cases6[] =3D { &quot;::1/0&quot;, &quot;ffff=
::1/16&quot;, &quot;2001:db8::1/64&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;2001:db8::1/128&quot;, &quot;::ffff=
:<a href=3D"http://1.2.3.4/8" rel=3D"noreferrer" target=3D"_blank">1.2.3.4/=
8</a>&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;::ffff:<a href=3D"http://1.2.3.4/32=
" rel=3D"noreferrer" target=3D"_blank">1.2.3.4/32</a>&quot; };<br>
&gt; &gt; ++=C2=A0 const char *cases4[] =3D { &quot;<a href=3D"http://1.2.3=
.4/8" rel=3D"noreferrer" target=3D"_blank">1.2.3.4/8</a>&quot;, &quot;<a hr=
ef=3D"http://1.2.3.4/0" rel=3D"noreferrer" target=3D"_blank">1.2.3.4/0</a>&=
quot;, &quot;<a href=3D"http://1.2.3.4/32" rel=3D"noreferrer" target=3D"_bl=
ank">1.2.3.4/32</a>&quot;, &quot;10/8&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;0x0a000000/8&quot; };<br>
&gt; &gt; ++=C2=A0 unsigned char a4[4];<br>
&gt; &gt; ++=C2=A0 unsigned char a6[16];<br>
&gt; &gt; ++=C2=A0 size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 i;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 for (i =3D 0; i &lt; sizeof(cases6) / sizeof(*cases6); i=
++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(0, ares_inet_pton(AF_INET6, cases6[i], =
a6)) &lt;&lt; cases6[i];<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++=C2=A0 for (i =3D 0; i &lt; sizeof(cases4) / sizeof(*cases4); i=
++) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 EXPECT_EQ(0, ares_inet_pton(AF_INET, cases4[i], a=
4)) &lt;&lt; cases4[i];<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 // Without a prefix length, the whole destination is wri=
tten.<br>
&gt; &gt; ++=C2=A0 memset(a6, 0x41, sizeof(a6));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(1, ares_inet_pton(AF_INET6, &quot;ffff::1&quot=
;, a6));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(&quot;ffff:0000:0000:0000:0000:0000:0000:0001&=
quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AddressToString(a6, 1=
6));<br>
&gt; &gt; ++=C2=A0 memset(a6, 0x41, sizeof(a6));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(1, ares_inet_pton(AF_INET6, &quot;::ffff:1.2.3=
.4&quot;, a6));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(&quot;0000:0000:0000:0000:0000:ffff:0102:0304&=
quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AddressToString(a6, 1=
6));<br>
&gt; &gt; ++=C2=A0 memset(a4, 0x41, sizeof(a4));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(1, ares_inet_pton(AF_INET, &quot;1.2.3.4&quot;=
, a4));<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(&quot;1.2.3.4&quot;, AddressToString(a4, 4));<=
br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + TEST_F(LibraryTest, FreeCorruptData) {<br>
&gt; &gt; +=C2=A0 =C2=A0// ares_free_data(p) expects that there is a type f=
ield and a marker<br>
&gt; &gt; +=C2=A0 =C2=A0// field in the memory before p.=C2=A0 Feed it inco=
rrect versions of each.<br>
&gt; &gt; +diff --git a/test/ares-test-mock-ai.cc b/test/ares-test-mock-ai.=
cc<br>
&gt; &gt; +index ae45c45527..43d0b89175 100644<br>
&gt; &gt; +--- a/test/ares-test-mock-ai.cc<br>
&gt; &gt; ++++ b/test/ares-test-mock-ai.cc<br>
&gt; &gt; +@@ -617,6 +617,29 @@ TEST_P(MockChannelTestAI, FamilyV6) {<br>
&gt; &gt; +=C2=A0 =C2=A0EXPECT_THAT(result.ai_,<br>
&gt; IncludesV6Address(&quot;2121:0000:0000:0000:0000:0000:0000:0303&quot;)=
);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++// A numeric host with a &quot;/bits&quot; prefix length is a n=
etwork, not an address.<br>
&gt; &gt; ++// It used to be accepted, returning uninitialized stack memory=
 as the address.<br>
&gt; &gt; ++TEST_P(MockChannelTestAI, NumericHostRejectsPrefixLength) {<br>
&gt; &gt; ++=C2=A0 struct ares_addrinfo_hints hints =3D {0, 0, 0, 0};<br>
&gt; &gt; ++=C2=A0 hints.ai_family =3D AF_INET6;<br>
&gt; &gt; ++=C2=A0 hints.ai_flags=C2=A0 =3D ARES_AI_NUMERICHOST;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 AddrInfoResult result;<br>
&gt; &gt; ++=C2=A0 ares_getaddrinfo(channel_, &quot;::1/0&quot;, NULL, &amp=
;hints, AddrInfoCallback,<br>
&gt; &amp;result);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(result.done_);<br>
&gt; &gt; ++=C2=A0 EXPECT_NE(ARES_SUCCESS, result.status_);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 AddrInfoResult result2;<br>
&gt; &gt; ++=C2=A0 ares_getaddrinfo(channel_, &quot;::1&quot;, NULL, &amp;h=
ints, AddrInfoCallback, &amp;result2);<br>
&gt; &gt; ++=C2=A0 Process();<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(result2.done_);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_SUCCESS, result2.status_);<br>
&gt; &gt; ++=C2=A0 EXPECT_THAT(result2.ai_, IncludesNumAddresses(1));<br>
&gt; &gt; ++=C2=A0 EXPECT_THAT(result2.ai_,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IncludesV6Addr=
ess(&quot;0000:0000:0000:0000:0000:0000:0000:0001&quot;));<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + // Test case for Issue #662<br>
&gt; &gt; + TEST_P(MockChannelTestAI, PartialQueryCancel) {<br>
&gt; &gt; +=C2=A0 =C2=A0std::vector&lt;byte&gt; nothing;<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/c-ares/c-ares/0008-ares_conn=
_read-dont-<br>
&gt; drop-UDP-answers-from-server-port.patch b/meta-oe/recipes-support/c-ar=
es/c-<br>
&gt; ares/0008-ares_conn_read-dont-drop-UDP-answers-from-server-port.patch<=
br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..f4f182b995<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-support/c-ares/c-ares/0008-ares_conn_read-d=
ont-drop-<br>
&gt; UDP-answers-from-server-port.patch<br>
&gt; &gt; @@ -0,0 +1,178 @@<br>
&gt; &gt; +From c7fa9ebcb0c0086730c53bf03191c03f03706246 Mon Sep 17 00:00:0=
0<br>
&gt; 2001<br>
&gt; &gt; +From: &quot;c-ares-backport-gha[bot]&quot;<br>
&gt; &gt; + &lt;299594594+c-ares-backport-gha[bot]@<a href=3D"http://users.=
noreply.github.com" rel=3D"noreferrer" target=3D"_blank">users.noreply.gith=
ub.com</a>&gt;<br>
&gt; &gt; +Date: Tue, 20 Oct 2026 02:25:59 +0000<br>
&gt; &gt; +Subject: [PATCH] [Backport v1.34] ares_conn_read: don&#39;t drop=
 UDP answers<br>
&gt; whose<br>
&gt; &gt; + source port isn&#39;t reported (#1371)<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +# Description<br>
&gt; &gt; +Backport of #1370 to `v1.34`.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Brad House &lt;<a href=3D"mailto:brad@brad-house.=
com" target=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Co-authored-by: Brad House &lt;<a href=3D"mailto:brad@brad-house=
.com" target=3D"_blank">brad@brad-house.com</a>&gt;<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/c-ares/=
c-" rel=3D"noreferrer" target=3D"_blank">https://github.com/c-ares/c-</a><b=
r>
&gt; ares/commit/c7fa9ebcb0c0086730c53bf03191c03f03706246]<br>
&gt; &gt; +GHSA: GHSA-fqh5-3x7m-wp44<br>
&gt; &gt; +---<br>
&gt; &gt; + docs/ares_set_socket_functions.3 | 20 ++++++++++++++++++++<br>
&gt; &gt; + src/lib/ares_conn.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 9 ++++++++-<br>
&gt; &gt; + src/lib/ares_socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 4 +++-<br>
&gt; &gt; + src/lib/ares_socket.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 8 +++++---<br>
&gt; &gt; + test/ares-test-mock.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 32 +++++++++++++++++++++++++++++++-<br>
&gt; &gt; + 5 files changed, 67 insertions(+), 6 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/docs/ares_set_socket_functions.3<br>
&gt; b/docs/ares_set_socket_functions.3<br>
&gt; &gt; +index 605beb26ef..75c621cb48 100644<br>
&gt; &gt; +--- a/docs/ares_set_socket_functions.3<br>
&gt; &gt; ++++ b/docs/ares_set_socket_functions.3<br>
&gt; &gt; +@@ -149,6 +149,20 @@ a socket. Additional flags controlling beha=
vior are in<br>
&gt; &gt; + address, the callback should fill this in. The \fIflags\fP para=
meter is<br>
&gt; &gt; + currently unused. See \fBrecvfrom(2)\fP.<br>
&gt; &gt; +<br>
&gt; &gt; ++For UDP, the callback must fill in the full source address, inc=
luding the<br>
&gt; &gt; ++source port, exactly as \fBrecvfrom(2)\fP does. c-ares discards=
 a datagram<br>
&gt; &gt; ++whose source address does not match the server it queried, or w=
hose source<br>
&gt; &gt; ++port does not match that server&#39;s port.<br>
&gt; &gt; ++<br>
&gt; &gt; ++\fBSecurity:\fP for compatibility with older callbacks, a repor=
ted source port<br>
&gt; &gt; ++of 0 is treated as unknown and only the address is checked. A c=
allback that<br>
&gt; &gt; ++does not fill in the source port is therefore insecure: c-ares =
will accept<br>
&gt; &gt; ++answers sent from any port on the server&#39;s address, for exa=
mple from another<br>
&gt; &gt; ++DNS server or any other service or user able to send UDP from t=
hat host, and<br>
&gt; &gt; ++those answers are cached and returned to the application. Such =
an<br>
&gt; &gt; ++implementation is non-compliant and should be fixed to report t=
he real<br>
&gt; source<br>
&gt; &gt; ++port.<br>
&gt; &gt; ++<br>
&gt; &gt; + .TP 8<br>
&gt; &gt; + .B ares_ssize_t (*\fIasendto\fP)(ares_socket_t \fIfd\fP, const =
void * \fIbuffer\fP,<br>
&gt; size_t \fIlength\fP, int \fIflags\fP, const struct sockaddr * \fIaddre=
ss\fP,<br>
&gt; ares_socklen_t \fIaddress_len\fP, void * \fIuser_data\fP)<br>
&gt; &gt; + .br<br>
&gt; &gt; +@@ -305,6 +319,12 @@ Receives data from remote socket endpoint, =
if<br>
&gt; available. If the \fIaddr\fP<br>
&gt; &gt; + parameter is not NULL and the connection protocol provides the =
source<br>
&gt; address,<br>
&gt; &gt; + the callback should fill this in. See \fBrecvfrom(2)\fP<br>
&gt; &gt; +<br>
&gt; &gt; ++For UDP, the callback must fill in the full source address, inc=
luding the<br>
&gt; &gt; ++source port, as described above for \fIarecvfrom\fP in<br>
&gt; &gt; ++\fBares_set_socket_functions_ex\fP. \fBSecurity:\fP a callback =
that<br>
&gt; &gt; ++does not fill in the source port is insecure, and c-ares will a=
ccept answers<br>
&gt; &gt; ++sent from any port on the server&#39;s address.<br>
&gt; &gt; ++<br>
&gt; &gt; + .TP 8<br>
&gt; &gt; + .B ares_ssize_t (*\fIasendv\fP)(ares_socket_t \fIfd\fP, const s=
truct iovec *<br>
&gt; \fIdata\fP, int \fIlen\fP, void * \fIuser_data\fP)<br>
&gt; &gt; + .br<br>
&gt; &gt; +diff --git a/src/lib/ares_conn.c b/src/lib/ares_conn.c<br>
&gt; &gt; +index b868053e62..7711d8649e 100644<br>
&gt; &gt; +--- a/src/lib/ares_conn.c<br>
&gt; &gt; ++++ b/src/lib/ares_conn.c<br>
&gt; &gt; +@@ -257,7 +257,14 @@ ares_conn_err_t ares_conn_read(ares_conn_t<=
br>
&gt; *conn, void *data, size_t len,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * functions might not filter on connect, so=
 also check here that the<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * datagram came from the server&#39;s addre=
ss and UDP port.=C2=A0 RFC 5452<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * section 9.1 only requires the address to =
match; matching the port too<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0* keeps one server from answering for anoth=
er on the same address. */<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* keeps one server from answering for anoth=
er on the same address.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* Socket functions that fill in the source =
address but leave the port 0<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* predate the port check, so for those only=
 the address is checked.=C2=A0 A<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* sender cannot use this to skip the port c=
heck: the default socket<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* functions connect() the socket, so the ke=
rnel drops a datagram from<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* port 0, and an unprivileged process on th=
e server&#39;s host cannot send<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* from port 0, while an off-path attacker a=
ble to forge port 0 can forge<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0* the server&#39;s real port just as easily=
. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (err =3D=3D ARES_CONN_ERR_SUCCESS &amp;&a=
mp;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!ares_sockaddr_addr_port_eq((s=
truct sockaddr *)&amp;sa_storage,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;c=
onn-&gt;server-&gt;addr,<br>
&gt; &gt; +diff --git a/src/lib/ares_socket.c b/src/lib/ares_socket.c<br>
&gt; &gt; +index 0a12935ab7..29d595e1a9 100644<br>
&gt; &gt; +--- a/src/lib/ares_socket.c<br>
&gt; &gt; ++++ b/src/lib/ares_socket.c<br>
&gt; &gt; +@@ -144,7 +144,9 @@ ares_bool_t ares_sockaddr_addr_port_eq(const=
<br>
&gt; struct sockaddr=C2=A0 *sa,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0sa_port =3D (CARES_INADDR_CAST(const struct =
sockaddr_in6 *, sa))-<br>
&gt; &gt;sin6_port;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0 if (ntohs(sa_port) !=3D port) {<br>
&gt; &gt; ++=C2=A0 /* A port of 0 means the source port was not reported, s=
o only the address<br>
&gt; &gt; ++=C2=A0 =C2=A0* can be checked. */<br>
&gt; &gt; ++=C2=A0 if (sa_port !=3D 0 &amp;&amp; ntohs(sa_port) !=3D port) =
{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ARES_FALSE;<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/lib/ares_socket.h b/src/lib/ares_socket.h<br>
&gt; &gt; +index f7128e3493..1ede6987ee 100644<br>
&gt; &gt; +--- a/src/lib/ares_socket.h<br>
&gt; &gt; ++++ b/src/lib/ares_socket.h<br>
&gt; &gt; +@@ -151,13 +151,15 @@ ares_bool_t=C2=A0 =C2=A0 =C2=A0ares_sockad=
dr_addr_eq(const<br>
&gt; struct sockaddr=C2=A0 *sa,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0const struct ares_addr *aa);<br>
&gt; &gt; +<br>
&gt; &gt; + /*! Compare the IP address and port of a socket address with an=
 ares_addr<br>
&gt; and<br>
&gt; &gt; +- *=C2=A0 port.<br>
&gt; &gt; ++ *=C2=A0 port.=C2=A0 A port of 0 in the socket address means th=
e port is unknown, so it<br>
&gt; &gt; ++ *=C2=A0 matches any port.<br>
&gt; &gt; +=C2=A0 *<br>
&gt; &gt; +=C2=A0 *=C2=A0 \param[in] sa=C2=A0 =C2=A0 Socket address (AF_INE=
T or AF_INET6)<br>
&gt; &gt; +=C2=A0 *=C2=A0 \param[in] aa=C2=A0 =C2=A0 Address to compare aga=
inst<br>
&gt; &gt; +=C2=A0 *=C2=A0 \param[in] port=C2=A0 Port to compare against, in=
 host byte order<br>
&gt; &gt; +- *=C2=A0 \return ARES_TRUE if the address families, IP addresse=
s and ports are<br>
&gt; &gt; +- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 equal, ARES_FALSE otherwis=
e<br>
&gt; &gt; ++ *=C2=A0 \return ARES_TRUE if the address families and IP addre=
sses are equal<br>
&gt; and<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the ports are equal or the=
 socket address port is 0, ARES_FALSE<br>
&gt; &gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 otherwise<br>
&gt; &gt; +=C2=A0 */<br>
&gt; &gt; + ares_bool_t=C2=A0 =C2=A0 =C2=A0ares_sockaddr_addr_port_eq(const=
 struct sockaddr=C2=A0 *sa,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const struct ares_addr *aa,<br>
&gt; &gt; +diff --git a/test/ares-test-mock.cc b/test/ares-test-mock.cc<br>
&gt; &gt; +index 058dc93001..cc5e6482f2 100644<br>
&gt; &gt; +--- a/test/ares-test-mock.cc<br>
&gt; &gt; ++++ b/test/ares-test-mock.cc<br>
&gt; &gt; +@@ -3364,6 +3364,7 @@ struct FakeSockData {<br>
&gt; &gt; +=C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0query_len;<br>
&gt; &gt; +=C2=A0 =C2=A0struct sockaddr_in peer;<br>
&gt; &gt; +=C2=A0 =C2=A0unsigned short=C2=A0 =C2=A0 =C2=A0recv_port; /* net=
work order; 0 reports the peer&#39;s port */<br>
&gt; &gt; ++=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0recv_no_port; /* report the peer&#39;s address with port 0 */<br>
&gt; &gt; +=C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0recv_calls;<br>
&gt; &gt; +=C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bad_fd_calls;<br>
&gt; &gt; +=C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sock_state_bad;<br>
&gt; &gt; +@@ -3472,7 +3473,9 @@ static ares_ssize_t<br>
&gt; FakeSockRecvfrom(ares_socket_t sock, void *buffer,<br>
&gt; &gt; +=C2=A0 =C2=A0if (address !=3D NULL &amp;&amp; address_len !=3D N=
ULL &amp;&amp;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*address_len &gt;=3D (ares_socklen_t)=
sizeof(d-&gt;peer)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0memcpy(address, &amp;d-&gt;peer, sizeof(d-&g=
t;peer));<br>
&gt; &gt; +-=C2=A0 =C2=A0 if (d-&gt;recv_port !=3D 0) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (d-&gt;recv_no_port) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 reinterpret_cast&lt;struct sockaddr_in *&g=
t;(address)-&gt;sin_port =3D 0;<br>
&gt; &gt; ++=C2=A0 =C2=A0 } else if (d-&gt;recv_port !=3D 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reinterpret_cast&lt;struct sockaddr_i=
n *&gt;(address)-&gt;sin_port =3D d-&gt;recv_port;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0*address_len =3D sizeof(d-&gt;peer);<br>
&gt; &gt; +@@ -3750,6 +3753,33 @@ TEST_F(LibraryTest,<br>
&gt; UDPAnswerFromWrongPortDropped) {<br>
&gt; &gt; +=C2=A0 =C2=A0ares_destroy(chan);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++// Socket functions written before the port check may fill in t=
he source<br>
&gt; &gt; ++// address but leave the port 0.=C2=A0 The address is still che=
cked, but the answer<br>
&gt; &gt; ++// must not be dropped for its port.<br>
&gt; &gt; ++TEST_F(LibraryTest, UDPAnswerWithoutPortAccepted)<br>
&gt; &gt; ++{<br>
&gt; &gt; ++=C2=A0 ares_channel_t *chan =3D nullptr;<br>
&gt; &gt; ++=C2=A0 FakeSockData=C2=A0 =C2=A0 data;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;data, 0, sizeof(data));<br>
&gt; &gt; ++=C2=A0 FakeSockInit(&amp;chan, &amp;data, 0,<br>
&gt; ARES_SOCKFUNC_FLAG_NONBLOCKING);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 ares_query_dnsrec(chan, &quot;<a href=3D"http://www.goog=
le.com" rel=3D"noreferrer" target=3D"_blank">www.google.com</a>&quot;, ARES=
_CLASS_IN,<br>
&gt; ARES_REC_TYPE_A,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 FakeSockQueryCallback, &amp;data, NULL);<br>
&gt; &gt; ++=C2=A0 ASSERT_NE((size_t)0, data.query_len);<br>
&gt; &gt; ++=C2=A0 ASSERT_EQ(htons(53055), data.peer.sin_port);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 data.recv_no_port =3D true;<br>
&gt; &gt; ++=C2=A0 data.recv_answer=C2=A0 =3D true;<br>
&gt; &gt; ++=C2=A0 ares_process_fd(chan, 100, ARES_SOCKET_BAD);<br>
&gt; &gt; ++=C2=A0 EXPECT_FALSE(data.recv_answer);<br>
&gt; &gt; ++=C2=A0 EXPECT_TRUE(data.done);<br>
&gt; &gt; ++=C2=A0 // The fake answer carries no records.<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ(ARES_ENODATA, data.status);<br>
&gt; &gt; ++=C2=A0 EXPECT_EQ((size_t)0, ares_queue_active_queries(chan));<b=
r>
&gt; &gt; ++=C2=A0 ares_destroy(chan);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + // The close function is application code too.=C2=A0 With no so=
cket-state callback<br>
&gt; &gt; + // to carry the descriptor, it runs inline while ares_check_cle=
anup_conns()<br>
&gt; &gt; + // walks the server list and each server&#39;s connections, clo=
sing idle ones.<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/c-ares/<a href=3D"http://c-a=
res_1.34.8.bb" rel=3D"noreferrer" target=3D"_blank">c-ares_1.34.8.bb</a> b/=
meta-oe/recipes-<br>
&gt; support/c-ares/<a href=3D"http://c-ares_1.34.8.bb" rel=3D"noreferrer" =
target=3D"_blank">c-ares_1.34.8.bb</a><br>
&gt; &gt; index 058f3666e7..1d0f3eb343 100644<br>
&gt; &gt; --- a/meta-oe/recipes-support/c-ares/<a href=3D"http://c-ares_1.3=
4.8.bb" rel=3D"noreferrer" target=3D"_blank">c-ares_1.34.8.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-support/c-ares/<a href=3D"http://c-ares_1.3=
4.8.bb" rel=3D"noreferrer" target=3D"_blank">c-ares_1.34.8.bb</a><br>
&gt; &gt; @@ -6,6 +6,14 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://LICENSE.md;md5=3Dd3e72a10e08191f2ca1be3f3228d78f3&quot;<b=
r>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://github.com/c-ares/c-" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/c-ares/c-</a><br>
&gt; ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ares_cancel=
-ares_destroy-detach-queries-before-<br>
&gt; callbacks.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Deliver-def=
erred-socket-server-state-notifications.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-ares_qcache=
-hand-callbacks-their-own-copy.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Handle-conn=
ections-torn-down-by-application.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-ares_proces=
s-only-accept-an-answer-on-the-right-<br>
&gt; connection.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-ares_save_o=
ptions-read-channel-config-under-lock.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-ares_inet_p=
ton-reject-a-prefix-length.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-ares_conn_r=
ead-dont-drop-UDP-answers-from-server-<br>
&gt; port.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest&q=
uot;<br>
&gt; &gt;=C2=A0 SRC_URI[sha256sum] =3D<br>
&gt; &quot;c222b6d681096f9444d2c4863d2c1174019e27cacca0a4a5c114d36dd7d7bf78=
&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.43.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div>

--000000000000d69b12065ed076a5--
