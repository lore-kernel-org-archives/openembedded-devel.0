Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1GmuKf-0005iu-Ty
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Nov 2006 16:48:17 +0100
Received: by nf-out-0910.google.com with SMTP id l24so553421nfc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2006 07:45:25 -0800 (PST)
Received: by 10.48.108.6 with SMTP id g6mr948893nfc.1164210325038;
	Wed, 22 Nov 2006 07:45:25 -0800 (PST)
Received: from CUBE ( [82.193.96.237])
	by mx.google.com with ESMTP id p72sm2673309nfc.2006.11.22.07.45.23;
	Wed, 22 Nov 2006 07:45:23 -0800 (PST)
Date: Wed, 22 Nov 2006 17:45:26 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1616846329.20061122174526@gmail.com>
To: Jamie Lenehan <lenehan@twibble.org>
In-Reply-To: <20061120043254.GA19760@twibble.org>
References: <20061120043254.GA19760@twibble.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Changes to populate-volatile.sh / new volatiles class
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Nov 2006 15:48:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Jamie,

Monday, November 20, 2006, 6:32:54 AM, you wrote:

> The current populate-volatile.sh script uses it's cache (if it exists
> and caching is enabled) but it doesn't add any new volatiles to it
> unless you manually delete the cache, and even then it regenerates
> the cache only with the entries for things that don't currently exist
> on the system.

  Jamie, doing something about populate-volatile.sh is good. Once I
found it to be taking pretty long time on load, but it was with
Familiar. I know that OE uses cache and that should help. Still,
didn't you think about nice short populate-volatile.c? I guess, config
format of volatiles is fixed, so we don't lose any flexibility, but
there're just too many issues with doing such simple thing as creating
few links/dirs ;-).

[]


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



