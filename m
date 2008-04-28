Received: from [66.249.82.230] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jqb4f-0006y3-8u
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Apr 2008 23:39:49 +0200
Received: by wx-out-0506.google.com with SMTP id h27so4953019wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2008 14:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=XK4YA1OAhPiQYjX4QxjNE6Rh2VrRn8CshHjwQn7Jv2I=;
	b=llq3pxp6ZKfUtyeClEit4rfHLFu8iZtuudrlrA77J7kBIDOaEkcs48rEGT5td8dQb71C8XG4n3u8t9blC3Mh1eljVQ7V69eZdgPzAgCLe8FTJpP4u7CztF8PLEwdj7ctto7z0RijjRNui09IWeYQzsDsLczZ3bjA6RQvGE4Ho1E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=f/29qSOrzNdiS5+oFJ5qky1GnPQjH0u4tfNk2rz6x49icYGhGD81ddaJbHxlZxi+lChMrjHfvxKaZmTTmc5fsiS4cNE/qY1ZnvGQE+naVtUlQL7AoiQp399gPPcsf3fg38nKLNVGhkUAM6pBphavwh/FDDjQx12yzXD3Ga9uYDY=
Received: by 10.100.121.12 with SMTP id t12mr285674anc.141.1209418763132;
	Mon, 28 Apr 2008 14:39:23 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 28 Apr 2008 14:39:23 -0700 (PDT)
Message-ID: <c384c5ea0804281439h1602ad7dvaa317f64efd3bd35@mail.gmail.com>
Date: Mon, 28 Apr 2008 23:39:23 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200804281451.05548.geoffrey@pager.net>
MIME-Version: 1.0
References: <200804281451.05548.geoffrey@pager.net>
Subject: Re: Mixed up STAGING_INCDIR's in uclibc.inc?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 28 Apr 2008 21:39:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Geoffrey, Marcin, Richard,

(I think Marcin committed the original change, and I think from Poky)

On Mon, Apr 28, 2008 at 9:51 PM, Geoffrey Wossum <geoffrey@pager.net> wrote:
>  Seems to me like that should be STAGING_INCDIR_NATIVE instead of
>  STAGING_INCDIR.  If I make that change, then everything works again.
>

Additionally, there is another issue:

The original patch Changelog entry described this patch was done as
uclibc needs ncurses-native instead of host provided ncurses.
Now, it seems the committer forgot to add this to the DEPENDS.

I have a freshly installed Ubuntu 8.04, and I probably don't have the
ncurses-dev, whereas Geoffrey probably does, which explains the
difference.

Does this make sense?

Regards,
-- 
Leon


