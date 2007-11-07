Received: from [66.249.82.227] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1Iq1Ev-0001lC-Nl
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2007 07:51:45 +0100
Received: by wx-out-0506.google.com with SMTP id h27so72268wxd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2007 22:50:49 -0800 (PST)
Received: by 10.142.237.20 with SMTP id k20mr2416064wfh.1194472863729;
	Wed, 07 Nov 2007 14:01:03 -0800 (PST)
Received: from lenovo ( [68.187.118.242])
	by mx.google.com with ESMTPS id n44sm23189225pyh.2007.11.07.14.01.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Nov 2007 14:01:03 -0800 (PST)
Received: by lenovo (sSMTP sendmail emulation); Wed, 07 Nov 2007 16:01:01 -0600
Date: Wed, 7 Nov 2007 16:01:00 -0600
From: David Farning <dfarning@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <20071107220100.GA8757@lenovo>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: bitbake type and scope of methods question
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
X-List-Received-Date: Thu, 08 Nov 2007 06:51:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I am working defining the various types of methods one can use when
creating bitbake classes and recipies.

1 bitbake-standard method

method_name(){
  ...
  shell script
  ...
}

arguments: None
scope: available in current file or if inherited
called: method_name


2 bitbake-python method

python method_name(){
  ...
  python script
  ...
}

arguments: none
scope: available in current file or if inherited
called: method_name


3 python method

def method_name(args):
  ...
  python script
  ...

arguments: normal python
scope: available in current file or if inherited
called:  ${@method_name(args)}


What is the purpose of EXPORT_FUNCTIONS?
Is there a notion of scope?  Can bbclasses have private methods?

Thanks
David Farning



