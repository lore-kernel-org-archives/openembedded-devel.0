Received: from [213.160.40.50] (helo=popeye1.ggamaur.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <roger@bufferoverflow.ch>) id 1IUgPg-0003D6-7J
	for openembedded-devel@openembedded.org; Mon, 10 Sep 2007 12:22:41 +0200
Received: from automat.bufferoverflow.ch (c-82-192-224-61.customer.ggaweb.ch
	[82.192.224.61])
	by popeye1.ggamaur.net (8.13.7/8.13.7/Submit) with ESMTP id
	l8AAJg2Z034897 for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2007 12:19:43 +0200 (CEST)
	(envelope-from roger@bufferoverflow.ch)
Received: by automat.bufferoverflow.ch (Postfix, from userid 33)
	id DA3D81190F; Mon, 10 Sep 2007 12:24:02 +0200 (CEST)
Received: from email.isrv.sbt.siemens.com (email.isrv.sbt.siemens.com
	[194.6.178.4]) by www.bufferoverflow.ch (Horde MIME library) with HTTP; 
	Mon, 10 Sep 2007 12:24:02 +0200
Message-ID: <20070910122402.h99gxr1o0ow0gso0@www.bufferoverflow.ch>
X-Priority: 3 (Normal)
Date: Mon, 10 Sep 2007 12:24:02 +0200
From: Roger Meier <roger@bufferoverflow.ch>
To: openembedded-devel@openembedded.org
References: <46CF6903.7060703@dominion.kabel.utwente.nl>
	<20070905225908.dcyz0rbxa8wo4ows@www.bufferoverflow.ch>
	<46DFA451.6020006@student.utwente.nl>
	<46E24E51.3080700@student.utwente.nl>
	<46E4027F.107@student.utwente.nl>
	<20070909175714.cvxg6cq9icoocggo@www.bufferoverflow.ch>
	<46E41C9C.1020509@student.utwente.nl>
In-Reply-To: <46E41C9C.1020509@student.utwente.nl>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.3)
X-Scanned-By: MIMEDefang 2.62 on 213.160.40.60
Subject: Re: OE website upgraded to drupal 5.2 => ViewMTN via apache2
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
X-List-Received-Date: Mon, 10 Sep 2007 10:22:41 -0000
X-Groupsio-MsgNum: 2870
Content-Type: multipart/mixed;
	boundary="=_4nshoapehsao"
Content-Transfer-Encoding: 7bit

--=_4nshoapehsao
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Koen

ViewMTN via apache2 is running on my Debian etch Installation(see  =20
http://www.bufferoverflow.ch/viewmtn/viewmtn.py/)!

Just do the following step's on the server:

apt-get install libapache2-mod-fastcgi python-flup python-cheetah =20
gnome-icon-theme highlight shared-mime-info

# cheetahtemplate =3D> debian sarge Versions are needed !!!
wget =20
http://ftp.de.debian.org/debian/pool/main/c/cheetah/python2.4-cheetah_0.9.16=
-1_i386.deb
wget =20
http://ftp.de.debian.org/debian/pool/main/c/cheetah/cheetah-common_0.9.16-1_=
all.deb

dpkg -i python2.4-cheetah_0.9.16-1_i386.deb cheetah-common_0.9.16-1_all.deb

Apache Config:

         <Directory "/var/www/viewmtn/">
         # ExecCGI privilege is required to run the
         # ViewMTN process
         Options +ExecCGI

         # Make sure you update config.py with this URL.
         <Files viewmtn.py>
                 SetHandler fastcgi-script
         </Files>
         </Directory>




greetings,

roger



Quoting Koen Kooi <k.kooi@student.utwente.nl>:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Roger Meier schreef:
>> Quoting Koen Kooi <k.kooi@student.utwente.nl>:
>>
>> Koen Kooi schreef:
>>>>> Koen Kooi schreef:
>>>>>> Roger Meier schreef:
>>>>>>> Hi Koen
>>>>>>> Which drupal and module versions did you use before upgrade?
>>>>>>> There are still some issues with the wiki headings.
>>>>>>> e.g. on page http://www.openembedded.org/wiki/GettingStarted
>>>>>> That is manually inserted html, so probably the content-type for
>>>>>> wiki needs to get
>>>>>> cascaded or we have to patch the markup filter.
>>>>> The correct answer was: "we have to patch the markup sanitizer",
>>>>> which I did :) The wiki
>>>>> works as expected now, the only issue left is the reversed news.
>> The reversed news issue turned out to be a case of one
>> 'db_rewrite_sql()' too many, this
>> is fixed now.
>>> Great!
>>
>> The current TODO:
>>> just drop a line if you need a hand on one of these topics!
>
> *drops line* :)
>
>>
>> * unify tinderbox, viewmtn, org.oe.documentation and main website css
>>> It would be great to have viewmtn integrated into apache webserver.
>>
>>> The URL http://www.openembedded.org:1081/ would not be accessible on
>>> every network(e.g. corporate networks)
>>
>>> The following manual describes the way to do this:
>>> http://viewmtn.angrygoats.net/revision/file/6971b1ddbf5c30977d1c306f3baa=
120d709d474e/INSTALL
>
> That sadly doesn't work since it does somewhere in the fastcgi  =20
> process. I haven't been
> able to figure out was is going wrong :( The interim solution was to =20
>  use the web.py
> approach which is running now.
>
>> * make everything conform to standards (xhtml?)
>>> Most drupal sites conform to xhtml.
>>> There are just a few Error's left:
>>> http://validator.w3.org/check?verbose=3D1&uri=3Dhttp%3A%2F%2Fwww.openemb=
edded.org%2F
>
> I don't know anything about html other than <center> and <br> ;)
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFG5BycMkyGM64RGpERAgboAKCwsUpiHqxZ6cicGWjlQkfOsWu3TgCfWFS4
> QHX3F2eluir845MJmcURYx8=3D
> =3D0MkB
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


--=_4nshoapehsao
Content-Type: text/plain;
	charset=ISO-8859-1;
	name="config.py"
Content-Disposition: attachment;
	filename="config.py"
Content-Transfer-Encoding: quoted-printable

# Copyright (C) 2005 Grahame Bowland <grahame@angrygoats.net>
#
# This program is made available under the GNU GPL version 2.0 or
# greater. See the accompanying file COPYING for details.
#
# This program is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
# PURPOSE.

#
# config.py
#
# This python script is imported by ViewMTN
# Note that changes to the script may not be=20
# noticed immediately by ViewMTN, as mod_python=20
# caches imported Python modules.
#
# If config changes are not picked up, reloading
# the web server should solve the issue.
#

import sys

# default addresses should work without modification
# if running viewmtn standalone. You must change these=20
# if you run viewmtn with a web server, see INSTALL.
dynamic_uri_path =3D 'http://www.bufferoverflow.ch/viewmtn/viewmtn.py/'
static_uri_path =3D 'http://www.bufferoverflow.ch/viewmtn/static/'

# if you are running under Apache2, set this.
# don't set it otherwise, it breaks any other configuration=20
# including running standalone.
running_under_apache2 =3D True

# the path to the 'mtn' binary
monotone =3D '/usr/bin/mtn'

# the monotone database to be shared out
# everything in this database should be considered subject=20
# to disclosure. So don't store your private key in=20
# it!
dbfile =3D '/var/www/viewmtn/OE.mtn'

# highlight from http://andre-simon.de/
# if you don't have this available, just comment=20
# the "highlight_command" line out
highlight_command =3D '/usr/bin/highlight'

graphopts =3D {
    # a directory (must be writable by the web user)
    # in which viewmtn can output graph files
    # (you should set up a cronjob to delete old ones
    #  periodically)
    'directory' : '/tmp/viewmtn-graph/',

    # a URL, relative or absolute, at which the files=20
    # in the 'graphdir' directory can be found. Should=20
    # end in a '/' character
    'uri' : 'graph/',

    # the path to the 'dot' program
    'dot' : '/usr/bin/dot',

    # options to use for nodes in the dot input file
    # we generate.
    'nodeopts' : { 'fontname'  : 'Monaco',=20
       'fontsize'  : '8',
       'shape'     : 'box',
       'height'    : '0.3',
       'spline'    : 'true',
       'style'     : 'filled',
       'fillcolor' : '#dddddd' }
}

# Icon Theme to use for icons; 'gnome' is a safe value,=20
# as is 'hicolor'. Note that icon_size must be a string,=20
# not an integer
icon_theme =3D 'gnome'
icon_size =3D '16'



--=_4nshoapehsao--
