Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PFy4F-00011m-95
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 00:57:35 +0100
Received: by wwb34 with SMTP id 34so53170wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Nov 2010 15:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=1yNV3mCeaSfSX/s/JAzhFmtR4y4sCLKdUSONNMd3y78=;
	b=pXOA5J2xXmsilMJ9QQO1x0oVwIgrXZ4LN+8d8+rJK25mtZj/vSgeM5C0mKxe0geYmZ
	OHh3NZuhNBo+8ermet9ERgr/rS518VXS7GeziyQWk0fEGbshb174Tep4GfB6RiAHaAu4
	erpQtDsn+uUMPpjaavcxhyoP1YWZJZDAzSChg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=MDxxPYBHtWWLOhvO1tiD5BpgEBgGkW1rzH19GoTwO5bJ5JiiUD4fElifA+NfbYzNXX
	/KhKeWxlTci8Rt7iUqv1pFjUwT1ewSnhoQ/92yGDJXbfcbEB4VhnSDeUOk9OyymKyY/V
	MBi4g6/8qs5UpttFY7VsqvUI7qM4BKQEVEtxM=
Received: by 10.216.178.83 with SMTP id e61mr368185wem.12.1289346997403; Tue,
	09 Nov 2010 15:56:37 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 9 Nov 2010 15:56:17 -0800 (PST)
In-Reply-To: <4CD9DC6D.5090007@gmail.com>
References: <4CD9DC6D.5090007@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 9 Nov 2010 16:56:17 -0700
X-Google-Sender-Auth: 89BOLHR6Kunyy7H9wSSFPibPHKc
Message-ID: <AANLkTimoLb0sKc+RGJJsF=tvhzhRnOgOfby1SQoKh-C9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] distro-version, kaeilos-version: don't export METADATA_BRANCH and METADATA_REVISION
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
X-List-Received-Date: Tue, 09 Nov 2010 23:57:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 9, 2010 at 4:42 PM, Graham Gower <graham.gower@gmail.com> wrote:

> Causes infinite recursion, which may look like this:
>
> NOTE: <type 'exceptions.RuntimeError'>:maximum recursion depth exceeded
> while calling a Python object while evaluating: ${@base_get_scm_branch(d)}
>
> Or this:
>
> Traceback (most recent call last):
>  File "/home/grg/oe2/bitbake/lib/bb/server/none.py", line 128, in
> idle_commands
>   retval = function(self, data, False)
>  File "/home/grg/oe2/bitbake/lib/bb/cooker.py", line 716, in
> buildTargetsIdle
>   retval = rq.execute_runqueue()
>  File "/home/grg/oe2/bitbake/lib/bb/runqueue.py", line 877, in
> execute_runqueue
>   self.execute_runqueue_internal()
>  File "/home/grg/oe2/bitbake/lib/bb/runqueue.py", line 992, in
> execute_runqueue_internal
>   self.build_pipes[pipe].read()
>  File "/home/grg/oe2/bitbake/lib/bb/runqueue.py", line 1227, in read
>   bb.event.fire_from_worker(self.queue[:index+8], self.d)
>  File "/home/grg/oe2/bitbake/lib/bb/event.py", line 137, in
> fire_from_worker
>   event = pickle.loads(event[7:-8])
>  File "/usr/lib64/python2.6/pickle.py", line 1374, in loads
>   return Unpickler(file).load()
>  File "/usr/lib64/python2.6/pickle.py", line 858, in load
>   dispatch[key](self)
>  File "/usr/lib64/python2.6/pickle.py", line 966, in load_string
>   raise ValueError, "insecure string pickle"
> ValueError: insecure string pickle
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

