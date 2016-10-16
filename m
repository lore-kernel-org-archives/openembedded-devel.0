Return-Path: <mario.goulart@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6324571A77
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2016 15:18:40 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id b75so21718135lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2016 08:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version;
	bh=0vojsas5Jet0pJ8rCSWLh5sm3GYXeW5eRiXdn4b8uSU=;
	b=NwWke+24/o6OrzX/62hy/GvfRpOMUcawC6a6R/B7Y90ghob6r4d6HP62KKCTiJhYj1
	XjxwD04l9kIUlP6h17DR7K31+uGWSZCqVjGlPS1mvoIwE49O3qNxa+scGpYqqbooOXS4
	v5YZR18Wd0LohcYpfc/8b1JF1lMhaz/dz3skCXqG9QJXvvWGupNpnoNMEVxz0edm7vld
	chw66cQHTPzwKEnPIJbQqSBKrWjGAqCHmf/JWQoNv8RsJQJREb99h1RdU8Obxe5bYSLS
	cyLxfdmCVTnofYrrZVUUrfHYyrgx96W+noi+2dNo4W5L6mHudMgHHM+QbUIEp86tY3zQ
	rYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
	:message-id:user-agent:mime-version;
	bh=0vojsas5Jet0pJ8rCSWLh5sm3GYXeW5eRiXdn4b8uSU=;
	b=ASpqae6zmqcCsbTkb+CZuLwUcdBUY5dzwXd77qoWW6/fAd7R2MWsy/OJKgCNdCoBmF
	/Qcg65Dk6vzJV42WfzoRGxgNGTjYU7Y7xcIfZCFK2QbnFczsCWyJ9jnr9XNhdwLu9ZUX
	V0nRtn25ZXyeuyPxxGcVMTrWCwi32y53OcIzNd/gufBaLNc05tT/hVeu8SWxIhxZaiKj
	6qKSdykmWy42lfpfNC7Gbc1J4eWaWVcnfO+CpCubWE8RyGG4rb6VYJ9AdIhilendMs0F
	VkE2J7GHHGvnIsyEFGhwzWRDhnXv3Jmu5hR/yCt0Cvd7fh5WI3n8o2J//YfLGmBP9wZr
	LxMA==
X-Gm-Message-State: AA6/9RntquVPD47tYtCRMk2uipov/5ddtajzEYa5oEbm+nGV7w6N0orM20kZhA3DAb6MjQ==
X-Received: by 10.28.184.21 with SMTP id i21mr5238080wmf.66.1476631121414;
	Sun, 16 Oct 2016 08:18:41 -0700 (PDT)
Received: from parenteses.gmail.com (email.parenteses.org. [5.9.149.108])
	by smtp.gmail.com with ESMTPSA id
	b8sm43484990wjq.40.2016.10.16.08.18.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Oct 2016 08:18:39 -0700 (PDT)
From: Mario Domenech Goulart <mario.goulart@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
References: <1476620149-25938-1-git-send-email-mario.goulart@gmail.com>
	<278c88df-7054-8cb9-5af6-3f3637dfc1fe@mlbassoc.com>
Date: Sun, 16 Oct 2016 17:18:38 +0200
In-Reply-To: <278c88df-7054-8cb9-5af6-3f3637dfc1fe@mlbassoc.com> (Gary
	Thomas's message of "Sun, 16 Oct 2016 15:43:02 +0200")
Message-ID: <877f98xqy9.fsf@parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] postgresql.inc: Fix do_configure error (could not find Python.h)
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
X-List-Received-Date: Sun, 16 Oct 2016 15:18:41 -0000
Content-Type: text/plain

Hi Gary,

On Sun, 16 Oct 2016 15:43:02 +0200 Gary Thomas <gary@mlbassoc.com> wrote:

> On 2016-10-16 14:15, Mario Domenech Goulart wrote:
>> Fixes:
>>
>> | checking for Python.h... no
>> | configure: error: header file <Python.h> is required for Python
>> | NOTE: The following config.log files may provide further information.
>> | WARNING: exit code 1 from a shell command.
>> | NOTE: .../tmp/work/armv5e-poky-linux-gnueabi/postgresql/9.4.8-r0.0/build/config.log
>> | ERROR: configure failed
>>
>> Signed-off-by: Mario Domenech Goulart <mario.goulart@gmail.com>
>> ---
>>  meta-oe/recipes-support/postgresql/postgresql.inc | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
>> index 9592c79..454624c 100644
>> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
>> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
>> @@ -40,6 +40,8 @@ export LDFLAGS_SL = "${LDFLAGS}"
>>
>>  inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd
>>
>> +CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR}"
>> +
>>  SYSTEMD_SERVICE_${PN} = "postgresql.service"
>>  SYSTEMD_AUTO_ENABLE_${PN} = "disable"
>>
>> @@ -109,12 +111,6 @@ python populate_packages_prepend() {
>>  }
>>
>>  do_configure() {
>> -    # do_configure_prepend
>> -    # make sure configure finds python includdirs with these envs
>> -    export \
>> -           STAGING_INCDIR=${STAGING_INCDIR} \
>> -           STAGING_LIBDIR=${STAGING_LIBDIR}
>> -
>>      # do_configure
>>      autotools_do_configure
>>
>>
>
> Why is this needed?  I just built the existing recipe in a bare build
> without any problems.  Perhaps I'm missing something?

Maybe I'm running into a race condition.  Now I tried again and could
not reproduce the Python issue (tried both master and krogoth).
However, in both master and krogoth I get the following error after
cleaning sstate for postgresql, removing $TMPDIR and building postgresql
again:

| checking for tclsh... no
| checking for tcl... no
| checking for tclsh8.6... no
| checking for tclsh86... no
| checking for tclsh8.5... no
| checking for tclsh85... no
| checking for tclsh8.4... no
| checking for tclsh84... no
| checking for tclsh8.3... no
| checking for tclsh83... no
| configure: error: Tcl shell not found
| WARNING: exit code 1 from a shell command.

When I could reproduce the issue, I checked the sysroot directory and
Python.h was in ${STAGING_INCDIR}/${PYTHON_DIR}, not in
${STAGING_INCDIR}.  ${STAGING_INCDIR}/${PYTHON_DIR} was not in the
compiler's include path and the code included Python.h with
"#include <Python.h>".

Naturally, it is possible that _I_ am missing something.

> Also, would it not be better to just add python to DEPENDS?

Python gets added to DEPENDS via PACKAGECONFIG.

All the best.
Mario
-- 
http://parenteses.org/mario

