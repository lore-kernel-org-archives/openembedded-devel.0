Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NQMTG-0002eq-IY
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Dec 2009 15:57:53 +0100
Received: (qmail 27559 invoked by uid 1003); 31 Dec 2009 14:55:49 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 31 Dec 2009 14:55:49 -0000
Message-ID: <4B3CBB73.7070306@balister.org>
Date: Thu, 31 Dec 2009 09:55:47 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W117FFD471D5790A918A393D8780@phx.gbl>
In-Reply-To: <BAY127-W117FFD471D5790A918A393D8780@phx.gbl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: problem in building console-image
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
X-List-Received-Date: Thu, 31 Dec 2009 14:57:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/31/2009 09:47 AM, saleh usman wrote:
>
> Hi
> I am building console-image by following the Getting Started page of www.opensdr.com.I've added the following lines  at the end of my local.conf file  but I am receiving error where oe is the directory in which openembedded is placed.Attached is the local.con file.
>
>
>
> ANGSTROM_EXTRA_INSTALL = " screen oprofile ossie-fm-from-file
> BBFILES = "oe/org.openembedded.dev/packages/*/*.bb
> /oe/ossie_collection/packages/*/*.bb"

I think you have a line wrap issue here, make sure both BBFILES and the 
line after are really on the same line.

Also, be warned, I wrote those instructions a while ago :)

Philip


>
> BBFILE_COLLECTIONS = "upstream ossie"
>
> BBFILE_PATTERN_upstream = "^/oe/org.openembedded.dev/packages"
>
> BBFILE_PRIORITY_upstream = "5"
>
> BBFILE_PATTERN_ossie = "^$/oe/ossie/packages"
>
> BBFILE_PRIORITY_ossie = "10"
>
>
> Terminal window showing the following error.
>
>
> [saleh@localhost
> ~]$ bitbake console-imageERROR: Unable to parse conf/bitbake.conf
> (/oe/build/conf/local.conf:176: unparsed line:
> '/oe/ossie_collection/packages/*/*.bb"')
>
>
>
> Plz help me in moving forward
>
> Saleh
>   		 	   		
> _________________________________________________________________
> Windows Live Hotmail: Your friends can get your Facebook updates, right from Hotmail®.
> http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/social-network-basics.aspx?ocid=PID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_4:092009
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


