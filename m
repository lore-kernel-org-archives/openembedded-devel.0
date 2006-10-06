Received: from [66.249.82.226] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <federicodangelo@gmail.com>) id 1GVuWv-0007hC-QI
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Oct 2006 20:34:41 +0200
Received: by wx-out-0506.google.com with SMTP id h30so1001794wxd
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Oct 2006 11:28:53 -0700 (PDT)
Received: by 10.70.116.14 with SMTP id o14mr5926620wxc;
	Fri, 06 Oct 2006 11:28:52 -0700 (PDT)
Received: from ?10.30.150.99? ( [200.55.5.71])
	by mx.google.com with ESMTP id i12sm563261wxd.2006.10.06.11.28.48;
	Fri, 06 Oct 2006 11:28:51 -0700 (PDT)
Message-ID: <4526A069.8070703@gmail.com>
Date: Fri, 06 Oct 2006 15:28:57 -0300
From: Federico D'Angelo <federicodangelo@gmail.com>
User-Agent: Thunderbird 1.5.0.7 (Windows/20060909)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.8
Subject: Changes to scummvm-qpe and openttd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2006 18:34:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello everybody, i'm new to the list, and i have a few questions.

I have made changes to scummvm-qpe and openttd to make them work better 
on my ipaq 3850, all of them are changes to make them work better on the 
device without using an additional keyboard.

The changes are:
  sdl_v.c in openttd 0.4.8 (sdl backend): made it use an internal screen 
buffer of 640x480, and the when you scroll with the keyboard, it first 
scrolls inside the buffer and when you are on the limits, only then it 
scrolls the map. I know that it's not great, but this way i can take any 
new snapshot of the sourcecode and only changing a few lines in this 
file i can have a new working version.

  sdl-common.cpp in scummvm-qpe: mapped the iPAQ keys to the functions 
QUIT, CLICK, MENU (F5), 1 (used to skip the Monkey Island II protection 
screen), PAUSE and  ESCAPE (to skip cinematics).

I would like to know where do I anybody is interested in this changes, i 
can send / upload the changed files anywhere you want for evaluation.







