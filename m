Received: from [209.85.221.10] (helo=mail-qy0-f10.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L29AN-0004Fw-8A
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 19:49:43 +0100
Received: by qyk3 with SMTP id 3so529313qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Nov 2008 10:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=BdcKjozJgKCcfspSTDJC2m1Z45QavHtz+ygpN4YPfPs=;
	b=hPtfQL6NVG5HxZfIE2/cJ35TUolLiugpazuOpDFavup7gEBgmhb2xzrTOpkpr3G2k1
	73dW5FvaOnCxLWTdmndH+LMe9TjDWnl58fDHMxIRWPFpBdG5PbbogIZvRKhZLZIsS9ca
	UltCyrmef54hH/gCQjXhEjCwbn3nxH0qcEv10=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=J/uhIS88EOwooLNyUNYegCk8eqxNxIgjOEyXl7wIUjLolgFQPqng0OmeusrUYOmPTF
	pRtHOhkEpN2vpbwENLChpnPa4VX89eWWsW0UlONBMw+AzgMsKu3abNBqSdrpwwluQFqF
	9eS/EzAubzT6J0Fv8inL02srbspM4gIWorJsw=
Received: by 10.214.181.1 with SMTP id d1mr2844235qaf.376.1226947634967;
	Mon, 17 Nov 2008 10:47:14 -0800 (PST)
Received: by 10.214.12.10 with HTTP; Mon, 17 Nov 2008 10:47:14 -0800 (PST)
Message-ID: <c384c5ea0811171047oa367b5bg25d01e3f50a9592f@mail.gmail.com>
Date: Mon, 17 Nov 2008 19:47:14 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081117151909.GG11401@datenfreihafen.org>
MIME-Version: 1.0
References: <20081117151909.GG11401@datenfreihafen.org>
Subject: Re: Moving fontconfig cache out of tmpfs
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
X-List-Received-Date: Mon, 17 Nov 2008 18:49:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Mon, Nov 17, 2008 at 4:19 PM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> What do people think about pointing this to something not mounted as tmpfs?

> Any problems I'm not aware of?
>
Read-only filesystems :-) But let's check www.fhs.org:

/var/lib/: "State information should generally remain valid after a reboot,"
/var/cache/: "Files located under /var/cache may be expired in an
application specific manner, by the system administrator, or both. The
application must always be able to recover from manual deletion of
these files (generally because of a disk space shortage)"

/var/lib/ looks fine to me.

Read-only systems without nv storage should probably copy/mount
/var/lib/ to volatile upon boot.

Regards,
-- 
Leon


