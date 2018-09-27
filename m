Return-Path: <max@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 671CD605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 20:34:59 +0000 (UTC)
Received: by swift.blarg.de (Postfix, from userid 500)
	id DC48422004B; Thu, 27 Sep 2018 22:34:59 +0200 (CEST)
Date: Thu, 27 Sep 2018 22:34:59 +0200
From: Max Kellermann <max+openembedded@blarg.de>
To: Jeroen Hofstee <jhofstee@victronenergy.com>
Message-ID: <20180927203459.dwvddevjmabhs2wu@swift.blarg.de>
Mail-Followup-To: Jeroen Hofstee <jhofstee@victronenergy.com>,
	openembedded-devel@lists.openembedded.org
References: <20180927125519.2567-1-max+openembedded@blarg.de>
	<20180927125519.2567-2-max+openembedded@blarg.de>
	<ed33c2b2-69df-7ebf-d181-38e25ffbef1c@victronenergy.com>
MIME-Version: 1.0
In-Reply-To: <ed33c2b2-69df-7ebf-d181-38e25ffbef1c@victronenergy.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] php: fix linker errors by setting `ac_cv_func_dlopen=no`
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
X-List-Received-Date: Thu, 27 Sep 2018 20:34:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2018/09/27 21:27, Jeroen Hofstee <jhofstee@victronenergy.com> wrote:
> Removing CACHED_CONFIGUREVARS completely also seems to work
> for 7.2.9, but perhaps 5.6 needs this?

I thought about this as well.  The reason for hard-coding those
variables is a mystery to me, because I thought doing such detections,
even when cross-compiling, is a first-class feature of autotools which
always works reliably.

Max

