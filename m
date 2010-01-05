Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NSHf3-0002Dk-Jo
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 23:14:00 +0100
Received: (qmail 7740 invoked by uid 1003); 5 Jan 2010 22:11:52 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 5 Jan 2010 22:11:52 -0000
Message-ID: <4B43B926.2030700@balister.org>
Date: Tue, 05 Jan 2010 17:11:50 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W1795412CA5C5CD1A8D270CD8730@phx.gbl>
In-Reply-To: <BAY127-W1795412CA5C5CD1A8D270CD8730@phx.gbl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: using bitbake
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
X-List-Received-Date: Tue, 05 Jan 2010 22:14:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2010 10:46 AM, saleh usman wrote:
>
> Hello
>
> I've built console-image usnig bitbake. If I want to build another recipie  like helloworld  than what should I do?.wheather to delete tmp directory and rebuild all of the things or any other way?

For console-image, you can add a line like:

ANGSTROM_EXTRA_INSTALL = " screen oprofile task-native-sdk "

to local.conf

Do a "bitbake -c clean task-base" then "bitbake console-image" (cleaning 
task-base may be overkill)

You can also bitbake recipe-name and find the ipk in 
tmp/deploy/..../ipks/machine or arch/package ...

Philip


>
> Saleh
>   		 	   		
> _________________________________________________________________
> Windows Live: Friends get your Flickr, Yelp, and Digg updates when they e-mail you.
> http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/social-network-basics.aspx?ocid=PID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_3:092010
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


