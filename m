Received: from [64.233.162.230] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <kergoth@gmail.com>) id 1Iv5Ex-0001Rt-PT
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2007 07:08:43 +0100
Received: by nz-out-0506.google.com with SMTP id l1so2127592nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 22:06:24 -0800 (PST)
Received: by 10.142.72.21 with SMTP id u21mr2293954wfa.1195701623779;
	Wed, 21 Nov 2007 19:20:23 -0800 (PST)
Received: by 10.142.104.18 with HTTP; Wed, 21 Nov 2007 19:20:23 -0800 (PST)
Message-ID: <b6ebd0a50711211920m636711eele486eac5164109f8@mail.gmail.com>
Date: Wed, 21 Nov 2007 20:20:23 -0700
From: "Chris Larson" <clarson@kergoth.com>
Sender: kergoth@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <474480D9.4090001@student.utwente.nl>
MIME-Version: 1.0
References: <E1IuZKt-0006pg-Ms@linuxtogo.org>
	<47434BB3.2010705@student.utwente.nl>
	<1195667681.30926.11.camel@localhost.localdomain>
	<474480D9.4090001@student.utwente.nl>
X-Google-Sender-Auth: 8f28990196be1754
Subject: Re: [oe-commits] org.oe.dev Add cryptsetup: Stop forcing your opinions onto other people!
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
X-List-Received-Date: Thu, 22 Nov 2007 06:08:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 21, 2007 12:02 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> The only 'bug' I know of is people using 'su' instead of 'su -' to
> become root and (/usr)/sbin isn't in $PATH. That's PEBKAC, not an OE bug
> or ipkg bug.

Deviating from the discussion, but if the postinst relies on /sbin
being in the path for it to execute correctly, it should be fixed to
either modify the path or directly call the binary with the full path.
 No portable shell script should rely on anything but /bin and
/usr/bin being in the PATH.
-- 
Chris Larson - clarson at kergoth dot com
Dedicated Engineer - MontaVista - clarson at mvista dot com
Core Developer/Architect - TSLib, BitBake, OpenEmbedded, OpenZaurus


