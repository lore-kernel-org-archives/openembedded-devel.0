Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 324F96B819
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 17:55:30 +0000 (UTC)
Received: (qmail 27866 invoked by uid 1003); 28 Mar 2014 17:55:30 -0000
Received: from unknown (HELO ?10.16.32.157?)
	(philip@opensdr.com@64.186.172.226)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	28 Mar 2014 17:55:30 -0000
Message-ID: <5335B790.1010107@balister.org>
Date: Fri, 28 Mar 2014 10:55:28 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45034856.Fj98ikVczS@localhost.localdomain>
In-Reply-To: <45034856.Fj98ikVczS@localhost.localdomain>
X-Enigmail-Version: 1.6
Cc: Diego <diego.ml@zoho.com>
Subject: Re: ntpd fails to start if libcap not installed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Mar 2014 17:55:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/28/2014 06:40 AM, Diego wrote:
> Hi openembedders!
> 
> I've noticed that if ntp is built without libcap, ntpd fails to start from the 
> initscript:
> /etc/init.d/ntpd
> 
> giving the error:
> Starting ntpd: /usr/sbin/ntpd: The ``user'' option has been disabled -- built 
> without --enable-clockctl or --enable-linuxcaps
> ntpd - NTP daemon program - Ver. 4.2.6p5
> USAGE:  ntpd [ -<flag> [<val>] | --<name>[{=| }<val>] ]...
> 
> That is caused by the line:
> start-stop-daemon --start -x /usr/sbin/ntpd -- -u ntp:ntp -p /var/run/ntp.pid 
> "$@"
> 
> and in particular by the option "-u ntp:ntp" which is not supported which is 
> not supported if ntp is build without --enable-clockctl.
> 
> Is anybody else experiencing this problem?

Oddly enough, I was about to report the symptom today also :)

Any ntp experts know what the proper solution is? I'd be glad to propose
a patch.

Philip

> 
> Bests,
> Diego
> 

