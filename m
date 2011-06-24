Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QaFtJ-0007JN-Ni
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jun 2011 01:34:25 +0200
Received: by pzk36 with SMTP id 36so2352765pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jun 2011 16:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=uhXl5fBBnIRdVQFMI+v4uNNDoN5/y+3IkseXp9jGCjc=;
	b=Ftf8PPP93a5aVQ2J0aeyj57FNIHw95DURHuaPZu6IUGEQ4xd19a7DoQZBUMkEwz444
	I7a7Gvh3Y7DgD/AI8Uo1bUtNVud+3kQDCAPRYJbpZkVjmhCtA6UmK2X1cO9e13Og45Xe
	DlJRe1wJWlxF9o2sd7JS9gKR56DcQFVpxCv14=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=rfx51C8pN1XA36wooe0sj0Otuphf2uIlKO8DU+EKSpcZMi+zsZC6vWf7eCz/01hw9n
	TMKTdoEncY0soBXQvyOfVSol1MTdHptTDgxEKXuAshYeWKVA9satqKe2ki7dh0gXj3tY
	2S7oBr2zO6sFS7wKnnSrWn5a13k56X8WGt1Ho=
Received: by 10.142.199.4 with SMTP id w4mr727019wff.355.1308958247187;
	Fri, 24 Jun 2011 16:30:47 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t12sm2406059wff.10.2011.06.24.16.30.46
	(version=SSLv3 cipher=OTHER); Fri, 24 Jun 2011 16:30:46 -0700 (PDT)
Message-ID: <4E051E24.4060803@gmail.com>
Date: Fri, 24 Jun 2011 16:30:44 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1308951671.6255.14.camel@mattotaupa>
In-Reply-To: <1308951671.6255.14.camel@mattotaupa>
Subject: Re: libgisi: task compile fails with `posix-ext.vapi:7.5-7.30: error: `Posix' already contains a definition for `INET_ADDRSTRLEN'`
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
X-List-Received-Date: Fri, 24 Jun 2011 23:34:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/24/2011 02:41 PM, Paul Menzel wrote:
> Dear OE folks,
>
>
> task compile of libgisi c993ee694ea98597d619a1ffae397d3416233354 fails
> with the following error using `minimal` for `MACHINE = "beagleboard"`.
>
>
>          /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/bin/valac -C --basedir .. --vapidir ../data --vapidir ../vapi --pkg glib-2.0 --pkg gio-2.0 --pkg libgisi --pkg posix --pkg posix-ext --header gisicomm.h --library gisicomm-0.0 gisicomm.vala
>          posix-ext.vapi:7.5-7.30: error: `Posix' already contains a definition for `INET_ADDRSTRLEN'
>              const int INET_ADDRSTRLEN;
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^
>          posix.vapi:476.2-476.34: note: previous definition of `INET_ADDRSTRLEN' was here
>                  public const int INET_ADDRSTRLEN;
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>          posix-ext.vapi:8.5-8.31: error: `Posix' already contains a definition for `INET6_ADDRSTRLEN'
>              const int INET6_ADDRSTRLEN;
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>          posix.vapi:478.2-478.35: note: previous definition of `INET6_ADDRSTRLEN' was here
>                  public const int INET6_ADDRSTRLEN;
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>          posix-ext.vapi:4.2-4.25: error: `Posix' already contains a definition for `inet_ntop'
>                  unowned string inet_ntop (int af, void* src, uint8[] dst);
>                  ^^^^^^^^^^^^^^^^^^^^^^^^
>          posix.vapi:485.2-485.25: note: previous definition of `inet_ntop' was here
>                  unowned string inet_ntop (int af, void* src, uint8[] dst);
>                  ^^^^^^^^^^^^^^^^^^^^^^^^
>          Compilation failed: 3 error(s), 0 warning(s)
>
> Please forward that to the appropriate people.
>

may be it should not be including posix-ext and posix pkgs simulteneously

>
> Thanks,
>
> Paul
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



