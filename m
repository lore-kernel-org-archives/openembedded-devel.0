Received: from [64.233.184.231] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <hvontres@gmail.com>) id 1Iy0IE-0001v9-9I
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2007 08:28:10 +0100
Received: by wr-out-0506.google.com with SMTP id c30so1765245wra
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2007 23:25:03 -0800 (PST)
Received: by 10.142.216.9 with SMTP id o9mr2337580wfg.1196407502517;
	Thu, 29 Nov 2007 23:25:02 -0800 (PST)
Received: by 10.143.11.12 with HTTP; Thu, 29 Nov 2007 23:25:02 -0800 (PST)
Message-ID: <a7f8874a0711292325r4a432e26rc50f36d9d53fb3b1@mail.gmail.com>
Date: Thu, 29 Nov 2007 23:25:02 -0800
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <A0AACB011FF0474492071F3E72FB188F958C5A@USSYML02.ad.sjm.com>
MIME-Version: 1.0
References: <20071129172123.GA29463@buddha.tw.openmoko.com>
	<474F1835.6060002@student.utwente.nl>
	<A0AACB011FF0474492071F3E72FB188F958C5A@USSYML02.ad.sjm.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Firewall blocking access to monotone server?
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
X-List-Received-Date: Fri, 30 Nov 2007 07:28:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 29, 2007 9:41 PM, Tiller, Jason <jtiller@sjm.com> wrote:

> Hello, OE folx!
>
> I approached the list a couple of weeks ago asking about running OE under
> Cygwin.  The overwhelming consensus was that I shouldn't even embark on that
> headache-laden path and instead scare up a Linux box for my OE work.  Well,
> I took your considered advice and now I'm trying to get OE running.
>
> I'm running on a 400MHz P-III with 256MB of memory running RHEL 4.  The OS
> is mandated by my IT guys.  I got everything down, finally got everything
> built (well, so far), including git, svn, mtn, boost, (1.33.1), bb, and a
> whole host of other packages.  My poor little box has been compiling its
> little brains out.  I think I have everything in place.


From my experince, you might want to ask your IT guys for something a bit
more powerful. I used to use an old HP Kajak for my builds, but the dual
PII-333 and 512Mb of memory was barely adequate. It took ~24hrs to build a
console image from scratch....
At the very least, you should try to max out the memory in the system, and
if possible add a second CPU to take advantage of bitbakes parallel build
capabilites.

I am now running on a dual core laptop with 2G... and am much happier :)


-- 
Henry von Tresckow (hvontres)

