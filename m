Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 4194 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Apr 2016 11:01:34 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF666011A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 11:01:34 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 8A90C2805EB; Mon, 18 Apr 2016 11:37:19 -0700 (PDT)
Date: Mon, 18 Apr 2016 11:37:19 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: gary@mlbassoc.com
Message-ID: <20160418183719.GA7939@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>, gary@mlbassoc.com,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browsser] chromium issues
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
X-List-Received-Date: Wed, 20 Apr 2016 11:01:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry about not doing a threaded reply (I deleted the message, oops,
and couldn't find the message ID in the online archive).

> * When chromium starts, I get a message:
>   "Google API keys are missing.  Some functionality of chromium will be disabled"
>    This seems to only be related to speech - should I worry about it?


Actually there are various google APIs that Chromium optionally uses but 
require keys, list here
https://www.chromium.org/developers/how-tos/api-keys

For example translate is on the list, because Chromium can provide a
context menu that directly translates a web page instead of having to 
go to translate.google.com. This won't work without a valid key.

If you just plan on using chromium as a normal browser without such
bells and whistles, don't worry about the keys and get rid of the
warning by setting them as blank when you start up chromium

export GOOGLE_API_KEY=" "
export GOOGLE_DEFAULT_CLIENT_ID=" "
export GOOGLE_DEFAULT_CLIENT_SECRET=" "

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=748867#253

