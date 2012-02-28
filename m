Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1S2M1p-00069x-Pi
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 13:19:37 +0100
Received: by bkcjg15 with SMTP id jg15so2257669bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 04:11:10 -0800 (PST)
Received-SPF: pass (google.com: domain of sledz@dresearch-fe.de designates
	10.204.129.7 as permitted sender) client-ip=10.204.129.7; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sledz@dresearch-fe.de
	designates 10.204.129.7 as permitted sender)
	smtp.mail=sledz@dresearch-fe.de
Received: from mr.google.com ([10.204.129.7])
	by 10.204.129.7 with SMTP id m7mr9047058bks.13.1330431070118 (num_hops
	= 1); Tue, 28 Feb 2012 04:11:10 -0800 (PST)
Received: by 10.204.129.7 with SMTP id m7mr7252682bks.13.1330431069893;
	Tue, 28 Feb 2012 04:11:09 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id x11sm30811267bkd.2.2012.02.28.04.11.09
	(version=SSLv3 cipher=OTHER); Tue, 28 Feb 2012 04:11:09 -0800 (PST)
Message-ID: <4F4CC45C.8010501@dresearch-fe.de>
Date: Tue, 28 Feb 2012 13:11:08 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4F4C9DB8.5050203@dresearch-fe.de> <1567078.cdBARgH5ks@helios>
In-Reply-To: <1567078.cdBARgH5ks@helios>
X-Enigmail-Version: 1.3.5
X-Gm-Message-State: ALoCoQnyVFMrMbQ9RHf42E1sNrONNhUhAkFL8VJgN81tmW7NQCM+5Qnvnl1L4mT1wCG5mNPSeE99
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Use python in variable assigment of a recipe
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
X-List-Received-Date: Tue, 28 Feb 2012 12:19:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.02.2012 10:55, Paul Eggleton wrote:
> On Tuesday 28 February 2012 10:26:16 Steffen Sledz wrote:
>> According to the user manual it is possible to use python code in variable
>> assignments by using ${@...}.
>>
>> I like to use a function (subprocess.check_output) here which requires an
>> import statement. Where do i have to place this import?
> 
> If you've got more than one line of Python then you should probably define a 
> normal Python function (just use "def" as you would in a normal python script 
> - there are plenty of examples of this) and then call this using ${@...}.

Works. Thx.

>> And another question. Is it possible to determine the path to the recipe
>> itself from with it?
> 
> I think you just need to get the value of the FILE variable e.g
> 
>  d.getVar('FILE', True)

Because i'm working with oe-classic i tried this (found in some other examples):

  MYVAR = "${@my_func()}"

  def my_func():
      bbpath = os.path.dirname(bb.data.getVar('FILE',d,1))
      ...

But this leads to an error:

  NameError: global name 'd' is not defined

:(

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


