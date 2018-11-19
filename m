Return-Path: <max@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 99B676C417
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2018 17:24:10 +0000 (UTC)
Received: by swift.blarg.de (Postfix, from userid 500)
	id 15E06220523; Mon, 19 Nov 2018 18:24:06 +0100 (CET)
Date: Mon, 19 Nov 2018 18:24:06 +0100
From: Max Kellermann <max+openembedded@blarg.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181119172405.atal2ajblxrgvqiw@swift.blarg.de>
Mail-Followup-To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20181031191737.24419-1-max+openembedded@blarg.de>
	<CAMKF1sozGtLw_CDPm6Ku9Fctbu-MJb_pfuAhSAV0ayigPHh5_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sozGtLw_CDPm6Ku9Fctbu-MJb_pfuAhSAV0ayigPHh5_Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] mpd: update to 0.21
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
X-List-Received-Date: Mon, 19 Nov 2018 17:24:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2018/11/02 18:04, Khem Raj <raj.khem@gmail.com> wrote:
> fails to package when systemd is used see
> 
> http://errors.yoctoproject.org/Errors/Details/198188/

Hm, this worked for me.  The systemd.socket file will not be installed
if libsystemd wasn't detected, but it "should" have been detected.

I'll resubmit with two changes:

- "systemd" added explicitly to DEPENDS (even though your log shows it
  was already installed indirectly)

- adding "-Dsystemd=enabled" which makes MPD's Meson file abort when
  libsystemd is not found

I hope this either just works now, or that I'll get a better error
message.


Btw.:

On 2018/11/01 13:52, Khem Raj <raj.khem@gmail.com> wrote:
> try adding
>
> [diff]
>         renames = copies
>
> to ~/.gitconfig

.. has no effect for this patch.  Almost all lines in this recipe file
were changed.

Max

