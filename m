Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1R1nF3-0004a3-PS
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 00:38:41 +0200
Received: by vxj12 with SMTP id 12so1162857vxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2011 15:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=lW35LkmA0tuxGOdoX0VUlB6VhpXgh+P3NhjspIl3668=;
	b=Cwawb/7EjKQF571XDYJkfox0S1eA4orOaJrko0YbIi3ixDTe+jBEWlvYK+GOCE9+8u
	DO1lyjpnJBxcmcUh5lDaayBMqgTFKBQIaN7yUxrZ5xwmrdiZrOV6WGHQIcDsOEm6VL0x
	hGr5ZNpGvriMM7EMqWGagiV3H/6jtMXfaz8Dk=
MIME-Version: 1.0
Received: by 10.52.94.6 with SMTP id cy6mr1464957vdb.153.1315521217327; Thu,
	08 Sep 2011 15:33:37 -0700 (PDT)
Received: by 10.52.167.72 with HTTP; Thu, 8 Sep 2011 15:33:37 -0700 (PDT)
In-Reply-To: <1315473897.17658.42.camel@mattotaupa>
References: <1315435137-5591-1-git-send-email-errordeveloper@gmail.com>
	<1315473897.17658.42.camel@mattotaupa>
Date: Thu, 8 Sep 2011 23:33:37 +0100
Message-ID: <CAPhDKbGVg+ysR6L9EBHo8KopFCpE7R53YiU4Qaq7rfKH08OF=Q@mail.gmail.com>
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] binutils-2.20.1: fix checksums
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
X-List-Received-Date: Thu, 08 Sep 2011 22:38:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8 September 2011 10:24, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> thank you for your patch. Unfortunately we cannot apply it as is. Please
> read [1] for the reason.
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-September/034885.html
>

The only work around that I see is to write a new bb recipe file for
2.20.1a, and update the old
recipe with SRC_URI to point to a mirror which holds that old tarball.
Please advise on how
you usually would handle these issues, cause the above solution is not
reliable either.

I agree that it's a bit tricky, though if bitbake been told that 1.2.3
and 1.2.3a are equivalents,
it would be quite nice :) Of course different projects have their own
versioning schemes, and
often  it implies kaos, however I presume that gnu toolchain team has
a very clear pattern
and that could be relied upon and implemented in the .inc files.
Something like VERSION_SUFFIX_IGNORE=$regex ...

Cheers,
-- 
Ilya


