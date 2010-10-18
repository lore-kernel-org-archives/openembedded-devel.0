Received: from na3sys009aog112.obsmtp.com ([74.125.149.207])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bengardiner@nanometrics.ca>) id 1P7ouc-0001jl-M3
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 14:34:00 +0200
Received: from source ([209.85.212.182]) by na3sys009aob112.postini.com
	([74.125.148.12]) with SMTP
	ID DSNKTLw+kpVSDy45tx9vCb7x3y3IBDSV4WB9@postini.com;
	Mon, 18 Oct 2010 05:33:27 PDT
Received: by mail-px0-f182.google.com with SMTP id 4so176285pxi.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 05:33:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.217.16 with SMTP id p16mr3284827wfg.282.1287405202000;
	Mon, 18 Oct 2010 05:33:22 -0700 (PDT)
Received: by 10.220.181.8 with HTTP; Mon, 18 Oct 2010 05:33:21 -0700 (PDT)
In-Reply-To: <1287225695.3980.56.camel@mattotaupa>
References: <1287066254-23579-1-git-send-email-bengardiner@nanometrics.ca>
	<1287154849.4233.19.camel@mattotaupa>
	<1287220606.3980.3.camel@mattotaupa>
	<1287225695.3980.56.camel@mattotaupa>
Date: Mon, 18 Oct 2010 08:33:21 -0400
Message-ID: <AANLkTikd0LMn776zpRRBF82ZavJrPKFOCJum_q_K8jU_@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.149.207
X-SA-Exim-Mail-From: bengardiner@nanometrics.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC, PATCH, resend] gmp: assign --target to --host to avoid configure error
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
X-List-Received-Date: Mon, 18 Oct 2010 12:34:00 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

HI Paul,

Thank you for all your testing of gmp builds.

On Sat, Oct 16, 2010 at 6:41 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
[...]
> Am Samstag, den 16.10.2010, 11:16 +0200 schrieb Paul Menzel:
> > Am Freitag, den 15.10.2010, 17:00 +0200 schrieb Paul Menzel:
> > > I tried to build `gmp-native` without your patch and it worked for me
> > > with `minimal` (eglibc) for `MACHINE =3D "beagleboard"`. Is there a
> > > difference how things are handled between distributions?
> >
> > It also built without problems with `angstrom-2010.x`.
>
> =85 and `angstrom-2008.1`, `minimal-{uclibc,libc}`.

So that's a positive result for 'angstrom-200{8.1,0.x}' , {uclibc,libc}...

I guess the culprit must be my use of external CSL toolchain. I will
try a build of gmp in 'angstrom-2008.1' 'libc' from
f58a5d59b755bdb725497f574a8059529c134c27 of master without external
toolchain and post the results.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


