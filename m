Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NBB9j-0008Ad-OI
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 18:50:58 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NBB8O-0000kN-1f for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 12:49:32 -0500
Date: Thu, 19 Nov 2009 12:49:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911191248430.13571@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build failure just trying to build guile-1.8.7 natively
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
X-List-Received-Date: Thu, 19 Nov 2009 17:50:59 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  forwarded from the guile-devel list.  does this look like it's going
to cause grief with any other packages?


---------- Forwarded message ----------
Date: Thu, 19 Nov 2009 18:24:26 +0100
From: Miroslav Lichvar <mlichvar@redhat.com>
To: guile-devel@gnu.org
Subject: Re: build failure just trying to build guile-1.8.7 natively

On Wed, Nov 18, 2009 at 12:11:51PM -0500, Robert P. J. Day wrote:
>
>   as a followup to my earlier plea for help, i downloaded the
> guile-1.8.7 tarball and tried to build it on my (effectively) fedora
> 12 system, and ran into exactly the same error:

> ERROR: unknown doc attribute: (location (string . alist.c) (int . 40)
> (hash . hash))

This is caused by new cpp which inserts linemarkers where it didn't
before.

For example:

#define X(a, b) a, __FILE__, __LINE__, b
X(a,
b)

results in:

a,
 "a.c"
# 2 "a.c"
 ,
 3
# 2 "a.c"
 , b

Adding -P option to cpp in guile-snarf-docs fixes the problem.

-- 
Miroslav Lichvar



