Received: from [63.139.215.200] (helo=SNEEZY.RUSSOUND.COM)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <jims@RUSSOUND.COM>) id 1IpRXT-0003fX-MH
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Nov 2007 17:44:31 +0100
Received: from [10.0.3.92] ([10.0.3.92]) by SNEEZY.RUSSOUND.COM with Microsoft
	SMTPSVC(6.0.3790.3959); Tue, 6 Nov 2007 11:21:39 -0500
Message-ID: <47309555.2050109@russound.com>
Date: Tue, 06 Nov 2007 11:24:53 -0500
From: Jim Sheldon <jims@russound.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200711061512.40289.Fischer@4g-systems.com>
In-Reply-To: <200711061512.40289.Fischer@4g-systems.com>
X-OriginalArrivalTime: 06 Nov 2007 16:21:39.0421 (UTC)
	FILETIME=[1C1F28D0:01C82091]
Subject: Re: tiny samba
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
X-List-Received-Date: Tue, 06 Nov 2007 16:44:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I recently had the need for the same thing.  There is a samba-essentials 
recipe, but it appears to be broken in the upstream.

Bitbake will complain that it looks at source includes, but there is a 
fix in this bug:

http://bugs.openembedded.org/show_bug.cgi?id=2117

It also appears that the SRC_URI in samba-essential_3.0.20.bb needs to 
be fixed from

SRC_URI = "..."

to

SRC_URI += " ..."

The space is very important.

Also, bitbake complains that debug binaries are included in a non-debug 
package, so I added this:

FILES_${PN}-dbg = "${libdir}/charset/.debug \
                   ${libdir}/vfs/.debug"

This should get you a workingn tiny samba server in ~3MB.

If I get some time I'll submit a full patch via the bug tracker.

Patrick Fischer wrote:
> Hello OE.
> I would like to create an tiny samba server just to share files for a windows 
> clients.
> A full samba is overkill. (don't need LDAP, Usermanagment,....)
> 
> Is there a tiny samba bb or any idea how to create a mini smb server?
> 
> Best regards
> 
> Patrick Fischer
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


