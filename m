Return-Path: <max@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id CF27A7920A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 06:55:21 +0000 (UTC)
Received: by swift.blarg.de (Postfix, from userid 500)
	id 7D67E2200B5; Thu,  1 Nov 2018 07:55:22 +0100 (CET)
Date: Thu, 1 Nov 2018 07:55:22 +0100
From: Max Kellermann <max+openembedded@blarg.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181101065522.l7go4mzqij7kcwwm@swift.blarg.de>
Mail-Followup-To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20181031191737.24419-1-max+openembedded@blarg.de>
	<CAMKF1srH+=42D=taFWYPaOAy96ihWiERRFykXEOHdNtXqNyekQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srH+=42D=taFWYPaOAy96ihWiERRFykXEOHdNtXqNyekQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 01 Nov 2018 06:55:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2018/11/01 01:16, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Max
> 
> thanks for the patch, however it will be good if this patch was detecting
> a move and not add/delete of files, it is easy to review the patches
> that way to just concentrate on what changes rather than full files

I understand, but the lines changed are way beyond git's threshold,
because the majority of lines in this recipe was PACKAGECONFIGs, and
all of them had to be changed due to the Meson migration.  Do you have
an idea how to tell git to do the right thing for you?

Max

