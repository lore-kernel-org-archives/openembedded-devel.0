Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <spyzer.abhishek0@gmail.com>) id 1OAOB0-0001pO-LB
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 16:05:18 +0200
Received: by gwj23 with SMTP id 23so564512gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 07:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=beR8ZFjwCExygrTsNl1ThIpuTKChWjcBEv+zYK4PVvs=;
	b=LTchS+D8BqmW5Ss4HmT9lZMvnhBjxM66d0Xq15CmVC6H4/R7DgZu7XqUnZXydFn4he
	2D++n0OIh53O7OhxqOKeZLtlUQ/ZleHQaAnS6qQADSyFUnEhORbNPic7CYF/unM7Hz9r
	dn4qh9u32V24CcAHTTLmCmZKSTk+QUbgUeQ3o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=e/T5DiW6+jxTReSMzFFy9hzLS/oSrsEBBWGBhH3TvTYhbSZX6NU6WPEfVd7xb/otuL
	GLGROAKACulqCKzUusQMuW2eS/41yI/+4V9uPNffi/kOQpfWNUgxeOlcTiW5ih7g5wcZ
	ykKMN+H3fNPMfYn1RDON42lsAMEtgz8UzKUBw=
Received: by 10.151.24.4 with SMTP id b4mr3652327ybj.335.1273240882713; Fri, 
	07 May 2010 07:01:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.150.124.11 with HTTP; Fri, 7 May 2010 07:01:02 -0700 (PDT)
In-Reply-To: <hru8nc$d5l$1@dough.gmane.org>
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com> 
	<hr4t3j$tds$1@dough.gmane.org>
	<k2jfc0861611004280742x8a9ca2b7jc65a77230be17b42@mail.gmail.com>
	<4BD84B08.4000300@eukrea.com>
	<g2wfc0861611005040002v62c57e0ahf08f8337bbbe9c1d@mail.gmail.com>
	<4BDFC996.5060606@eukrea.com>
	<AANLkTik56w90iywd5ZmzV_geM0ULabHWVCuJIfxzHY7u@mail.gmail.com> 
	<4BE29322.7060205@eukrea.com>
	<AANLkTimCrYrjKuREPyUgYQwxlWdAN_OjF5ECiRBLj6Pp@mail.gmail.com> 
	<hru8nc$d5l$1@dough.gmane.org>
From: Abhishek Sharma <spyzer.abhishek0@gmail.com>
Date: Fri, 7 May 2010 19:31:02 +0530
Message-ID: <AANLkTinNs0RXIqA8annkPWKiGKUAD8yWnlKiAZiT-g0A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: spyzer.abhishek0@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Fri, 07 May 2010 14:05:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 6, 2010 at 4:51 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 06-05-10 12:55, Abhishek Sharma wrote:
>
> > About the /dev node, there is no such device as /dev/input/touchscreen0,
> is
> > it because i am only doing a base-image kind of install???
> > i set the environment variable which was specified, but no progress.
>
> If you use udev, it will get created for you.
>
> regards,
>
> Koen
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL4qYsMkyGM64RGpERAszCAJ9tRRJelQyLDkozlVtBHdgyobx/HQCgs0NP
> mB316e3HZG2RsEoAcQEwJrI=
> =4Mnu
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


Thanks all, the touchscreen device was /dev/event1 and the moment I did ->
export QWS_MOUSE_PROTO="Tslib:/dev/event1" and ran the app, it got going.
I am very grateful to you all for the help.
:)
-- 
Abhishek Sharma

