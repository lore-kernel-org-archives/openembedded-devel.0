Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5633D0D151
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:27 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12160.1767808162164629517
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 09:49:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/Hqk68e;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fb9a67b06so25784597b3.1
        for <Openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767808161; x=1768412961; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zidCOjrSVCfQ5nFqJ3kq9+RFE9raDS648labYXNZfA4=;
        b=Y/Hqk68eitSoN4cynkFLKhaOF/u9R8ezLLr98KLC+eAfocG2sMM2bEtsgIS+xFaSM+
         DNlzsDnWQ/FUCCTvblcyTvibByn0+8b3TDqBlOkscnaUoF6m3t334j0vv7rRMucxN9Je
         /WYyUOsmFeX4klcM8JVyjW7BlcUU5aqE2k/4junW+GyMt+c7Buk/PzwJ6RPC7ABBscTZ
         +FljJemQCS16G9VC8w32Robc3S2DENKIZDIuKuRsL8XEQLKggnYHlCu3FhmMlNfLHulN
         KO3k+ys5FgARWAome8Q80xfQwgWWG2gT8SPIazc9p0XS3Y9V6y9K9lAa5wKO6Uz/BMhM
         7uaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767808161; x=1768412961;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zidCOjrSVCfQ5nFqJ3kq9+RFE9raDS648labYXNZfA4=;
        b=vfU6V9TOChUpqTuL+l1RhZklDZRhTLG2B83ig4SS+7wHh+Nbi429LjWGXa5S292PMJ
         1wlI9b+LPNLApAenuXjW15A8H6sDtf/fzYgGjqZWwMkgRhLQ3hXfOctwhZq7JK6qHzHR
         w7+X0YIsyg3MoL+PmCaInVmfXkdDj28bmelpFmti7Cjdr04ExGzLHGvbSr28PPiJkE65
         0fFhuNL+ypvFegOSwJ8M2RKWihQ1xE/ZatTBbM0SA3flBhjEvlMueVSKJ7yPastFxRpJ
         0lW+U0XkdUhBi+cNQC5QaSqK3TKK14LW50ewUwb2GVE2S7wica9xwTV5XPw2/qsXJmvN
         z7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjpSAhgp01pBwedjsJ5bwijnBq4pavXKpxClk7r/ceN26tdL23ZAzVXnxWCpj6lvCpgewMYG4HwRjo+iBDJiGXgG4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxUEXa4FA6l3K9nKQs5kMDZ7FrFRjmyNWOwxGMhdyGqDF+Y4Hu/
	x2w6KWXQt8Sa8Jn4vbJvoNudh629wEcoHZvxJbM+aXHG4cvXjm7wTXX0EgRSiNS+jak+OTXG5Ul
	CKix6hFgmSZWXyQ9l73H9mnhm14hXyQE=
X-Gm-Gg: AY/fxX5nBhai+HoIKpUQHKIpWLH8s9zAjwxqx+0SInLHgC/aoInscgKhtriKmu8aeCV
	bZjqMyiJbEBQ4WhD+f9dtViCZOF3KT6E+1oygFABUn4Nb1tdg5Jp1XucuTz6aloAFR910y7enEL
	KL4h1QSR+wH1gYiFZWcubj9YdYFpSzeymZkQujDj8VHR1Nfa/Cey56PC92vMWNZOgueyYDbdQD6
	amt+z33TelEswnV17aoYc7bBTWuvnJTf4PwkLZ6Gi6UiMXOFZ3YuY1cD9MbWcBzW8c+juwN7YuO
	NzKWmzqHDQTmu02kpob4+0Zwfihmmly5at/Yol++CQVXVchrXJr62Rdsam5IF7B+VYeoFP5ZcqG
	S518Pmfi1L/X7LsbuX7L4pmiy6pbcRBO1qsDBWhnq04wV2g==
X-Google-Smtp-Source: AGHT+IHKfoUvFYpMDKq5lwyIGEZH+FCwWn7Hn5eCFLjcxHtoNrLoE1aAXVLxKSz/uiQDfJVKt9PcQhFxOwiVD/kNsPE=
X-Received: by 2002:a05:690e:1243:b0:63f:9979:2f9e with SMTP id
 956f58d0204a3-64716b35d5dmr3086149d50.17.1767808161116; Wed, 07 Jan 2026
 09:49:21 -0800 (PST)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Jan 2026 09:48:54 -0800
X-Gm-Features: AQt7F2pi1LOrjLLnJeemQhbck1omqlKeC4E5k5PrhI3aUulZsiynoX3Z4qImyyA
Message-ID: <CAMKF1srHzaW_tz3+JshMYrEve6KbxVk9N3PBC05vx3hcqx+TFA@mail.gmail.com>
Subject: python3-h2 ptest timeouts
To: Gyorgy Sarvari <skandigraun@gmail.com>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007973cc0647cfe9cf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 17:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123228

--0000000000007973cc0647cfe9cf
Content-Type: text/plain; charset="UTF-8"

Hi Gyorgy

When running on slower emalations ( without kvm ) e.g. qemuriscv64 one test
fails like below, I think the timeout should be laxed a bit to ensure that
these
are considered.

+ Exception Group Traceback (most recent call last):
  |   File "/usr/lib/python3-h2/ptest/tests/test_basic_logic.py", line 824,
in test_changing_max_frame_size
  |
@settings(suppress_health_check=[HealthCheck.function_scoped_fixture])
  |                ^^^^^^^^^^^^^^^^^^^^^^
  |   File "/usr/lib/python3.13/site-packages/hypothesis/core.py", line
2234, in wrapped_test
  |     raise the_error_hypothesis_found
  | hypothesis.errors.FlakyFailure: Hypothesis
test_changing_max_frame_size(self=<tests.test_basic_logic.TestBasicClient
object at 0x3f9769e580>, frame_factory=<tests.helpers.FrameFactory object
at 0x3f9696e7b0>, frame_size=3623515) produces unreliable results:
Falsified on the first call but did not on a subsequent one (1
sub-exception)
  | Falsifying example: test_changing_max_frame_size(
  |     self=<tests.test_basic_logic.TestBasicClient object at
0x3f9769e580>,
  |     frame_factory=<tests.helpers.FrameFactory object at 0x3f9696e7b0>,
  |     frame_size=3623515,
  | )
  | Unreliable test timings! On an initial run, this test took 638.89ms,
which exceeded the deadline of 200.00ms, but on a subsequent run it took
153.78 ms, which did not. If you expect this sort of variability in your
test timings, consider turning deadlines off for this test by setting
deadline=None.
  +-+---------------- 1 ----------------
    | Traceback (most recent call last):
    |   File "/usr/lib/python3.13/site-packages/hypothesis/core.py", line
1200, in _execute_once_for_engine
    |     result = self.execute_once(data)
    |   File "/usr/lib/python3.13/site-packages/hypothesis/core.py", line
1140, in execute_once
    |     result = self.test_runner(data, run)
    |   File "/usr/lib/python3.13/site-packages/hypothesis/core.py", line
824, in default_executor
    |     return function(data)
    |   File "/usr/lib/python3.13/site-packages/hypothesis/core.py", line
1097, in run
    |     return test(*args, **kwargs)
    |   File "/usr/lib/python3-h2/ptest/tests/test_basic_logic.py", line
824, in test_changing_max_frame_size
    |
@settings(suppress_health_check=[HealthCheck.function_scoped_fixture])
    |                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |   File "/usr/lib/python3.13/site-packages/hypothesis/core.py", line
1031, in test
    |     raise DeadlineExceeded(
    |         datetime.timedelta(seconds=runtime), self.settings.deadline
    |     )
    | hypothesis.errors.DeadlineExceeded: Test took 638.89ms, which exceeds
the deadline of 200.00ms. If you expect test cases to take this long, you
can use @settings(deadline=...) to either set a higher deadline, or to
disable it with deadline=None.
    +------------------------------------

--0000000000007973cc0647cfe9cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Gyorgy<div><br></div><div>When running on slower emalat=
ions ( without kvm ) e.g. qemuriscv64 one test</div><div>fails like below, =
I think the timeout should be laxed a bit to ensure that these</div><div>ar=
e considered.</div><div><br></div><div>+ Exception Group Traceback (most re=
cent call last):<br>=C2=A0 | =C2=A0 File &quot;/usr/lib/python3-h2/ptest/te=
sts/test_basic_logic.py&quot;, line 824, in test_changing_max_frame_size<br=
>=C2=A0 | =C2=A0 =C2=A0 @settings(suppress_health_check=3D[HealthCheck.func=
tion_scoped_fixture])<br>=C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^<br>=C2=A0 | =C2=A0 File &quot;/usr/lib=
/python3.13/site-packages/hypothesis/core.py&quot;, line 2234, in wrapped_t=
est<br>=C2=A0 | =C2=A0 =C2=A0 raise the_error_hypothesis_found<br>=C2=A0 | =
hypothesis.errors.FlakyFailure: Hypothesis test_changing_max_frame_size(sel=
f=3D&lt;tests.test_basic_logic.TestBasicClient object at 0x3f9769e580&gt;, =
frame_factory=3D&lt;tests.helpers.FrameFactory object at 0x3f9696e7b0&gt;, =
frame_size=3D3623515) produces unreliable results: Falsified on the first c=
all but did not on a subsequent one (1 sub-exception)<br>=C2=A0 | Falsifyin=
g example: test_changing_max_frame_size(<br>=C2=A0 | =C2=A0 =C2=A0 self=3D&=
lt;tests.test_basic_logic.TestBasicClient object at 0x3f9769e580&gt;,<br>=
=C2=A0 | =C2=A0 =C2=A0 frame_factory=3D&lt;tests.helpers.FrameFactory objec=
t at 0x3f9696e7b0&gt;,<br>=C2=A0 | =C2=A0 =C2=A0 frame_size=3D3623515,<br>=
=C2=A0 | )<br>=C2=A0 | Unreliable test timings! On an initial run, this tes=
t took 638.89ms, which exceeded the deadline of 200.00ms, but on a subseque=
nt run it took 153.78 ms, which did not. If you expect this sort of variabi=
lity in your test timings, consider turning deadlines off for this test by =
setting deadline=3DNone.<br>=C2=A0 +-+---------------- 1 ----------------<b=
r>=C2=A0 =C2=A0 | Traceback (most recent call last):<br>=C2=A0 =C2=A0 | =C2=
=A0 File &quot;/usr/lib/python3.13/site-packages/hypothesis/core.py&quot;, =
line 1200, in _execute_once_for_engine<br>=C2=A0 =C2=A0 | =C2=A0 =C2=A0 res=
ult =3D self.execute_once(data)<br>=C2=A0 =C2=A0 | =C2=A0 File &quot;/usr/l=
ib/python3.13/site-packages/hypothesis/core.py&quot;, line 1140, in execute=
_once<br>=C2=A0 =C2=A0 | =C2=A0 =C2=A0 result =3D self.test_runner(data, ru=
n)<br>=C2=A0 =C2=A0 | =C2=A0 File &quot;/usr/lib/python3.13/site-packages/h=
ypothesis/core.py&quot;, line 824, in default_executor<br>=C2=A0 =C2=A0 | =
=C2=A0 =C2=A0 return function(data)<br>=C2=A0 =C2=A0 | =C2=A0 File &quot;/u=
sr/lib/python3.13/site-packages/hypothesis/core.py&quot;, line 1097, in run=
<br>=C2=A0 =C2=A0 | =C2=A0 =C2=A0 return test(*args, **kwargs)<br>=C2=A0 =
=C2=A0 | =C2=A0 File &quot;/usr/lib/python3-h2/ptest/tests/test_basic_logic=
.py&quot;, line 824, in test_changing_max_frame_size<br>=C2=A0 =C2=A0 | =C2=
=A0 =C2=A0 @settings(suppress_health_check=3D[HealthCheck.function_scoped_f=
ixture])<br>=C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>=C2=A0 =C2=A0 | =C2=A0 File=
 &quot;/usr/lib/python3.13/site-packages/hypothesis/core.py&quot;, line 103=
1, in test<br>=C2=A0 =C2=A0 | =C2=A0 =C2=A0 raise DeadlineExceeded(<br>=C2=
=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 datetime.timedelta(seconds=3Drunti=
me), self.settings.deadline<br>=C2=A0 =C2=A0 | =C2=A0 =C2=A0 )<br>=C2=A0 =
=C2=A0 | hypothesis.errors.DeadlineExceeded: Test took 638.89ms, which exce=
eds the deadline of 200.00ms. If you expect test cases to take this long, y=
ou can use @settings(deadline=3D...) to either set a higher deadline, or to=
 disable it with deadline=3DNone.<br>=C2=A0 =C2=A0 +-----------------------=
-------------</div></div>

--0000000000007973cc0647cfe9cf--

