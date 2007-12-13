Received: from [89.96.204.112] (helo=www-zirak-new.zirak.it)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <filippo@zirak.it>) id 1J2wa1-0001oT-8n
	for openembedded-devel@openembedded.org; Thu, 13 Dec 2007 23:30:57 +0100
Received: (qmail 14247 invoked by uid 64017); 13 Dec 2007 22:23:40 -0000
Received: from 87.4.211.233 (filippo@zirak.it@87.4.211.233) by www-zirak-new
	(envelope-from <filippo@zirak.it>,
	uid 64011) with qmail-scanner-2.01 
	(uvscan: v5.1.00/v5052. bogofilter: 0.92.0. spamassassin: 3.0.4.  
	Clear:RC:1(87.4.211.233):. 
	Processed in 0.92387 secs); 13 Dec 2007 22:23:40 -0000
Received: from unknown (HELO ?192.168.1.4?) (filippo@zirak.it@87.4.211.233)
	by www-zirak-new.zirak.it with SMTP; 13 Dec 2007 22:23:39 -0000
Message-ID: <4761B18E.1080805@zirak.it>
Date: Thu, 13 Dec 2007 23:26:22 +0100
From: Filippo Basso <filippo@zirak.it>
User-Agent: IceDove 1.5.0.14pre (X11/20071020)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47606910.9000505@zirak.it>	<74d0deb30712130004v11453c5x109386d74997d6b0@mail.gmail.com>
	<1E7281BD-99E7-42CA-993D-3B95BE7C4EA9@selfish.org>
In-Reply-To: <1E7281BD-99E7-42CA-993D-3B95BE7C4EA9@selfish.org>
X-Enigmail-Version: 0.94.2.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: bash-completion for bitbake
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
X-List-Received-Date: Thu, 13 Dec 2007 22:30:57 -0000
Content-Type: multipart/mixed; boundary="------------080202030807070309010601"

--------------080202030807070309010601
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Freyther ha scritto:
> Am 13.12.2007 um 09:04 schrieb pHilipp Zabel:
>
>   
>> On Dec 13, 2007 12:04 AM, Filippo Basso <filippo@zirak.it> wrote:
>>     
>>> For everybody interested,
>>>    I'm attaching here a small bash-completion script that I'm using.
>>> (other scripts will be sent soon)
>>> if somebody will make any improvements, plz send to me too...
>>>
>>> (maybe somebody else already did... but I haven't found, can be  
>>> useful
>>> to put it in the website? you OE guys see, if there is no way to put
>>> there, I'll upload in a personal page about my work on OE...?
>>> suggestions well accepted)
>>>
>>> thanx,
>>>    phy
>>>       
>> Very nice! Can't we put this somewhere in OE/contrib?
>> I think it would be nice if bitbake could provide this information  
>> itself,
>> maybe making use of the cache. This would also allow to add
>> versions and virtual providers to the autocompletion.
>>     
>
> Hey Filippo,
> what license is the completion under? I would like to put it into
> http://svn.berlios.de/viewcvs/bitbake/trunk/bitbake/contrib/
>
>
> z.

Thank you for the proposal!
    I think that the bitbake license is perfect, GNU GPL v2 or any other
later version.
anyway:
* attached is a newer version that try to autocomplete the "-c" option
with the more common tasks (it's not possible to do listtasks, as the
package will be typed later...)(I hope I've listed all the more common ones)
* about use of the cache, I tried to use also the autocompletion one (it
reduce of ~30% the time), but I then removed as it's not so accurate,
expecially because autocompletion is useful for developers, where .bb
files can change a lot... can bitbake cache be better in this regard?

phy


#
# "bitbake autocompletion description"
#
# LICENSE:	GNU GPLv2 or any later version
# CREATED:	Filippo Basso <filippo@zirak.it> (12-DEC-2007)
# MODIFIED:
#
# Use: 
# - simply put it into your /etc/bash_completion.d/ directory...
# For help enhancing this script, see also:
# - http://www.debian-administration.org/articles/317
# - http://www.gnu.org/software/bash/manual/bashref.html#SEC112
#


_bitbake() 
{
	local cur conns prev options options1 i j A recipefile
	COMPREPLY=()

	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	options="--help --version --buildfile= --continue --force --interactive --cmd= --read= --verbose --debug --dry-run --parse-only --disable-psyco --show-versions --environment --graphviz --ignore-deps= --log-domains= --profile"
	options1="-h -b -k -f -i -c -r -v -D -n -p -d -s -e -g -I -l -P"
	commands="fetchall listtasks rebuild compile build populate_staging mrproper fetch configure clean package unpack install package_write distribute_sources showdata qa_configure qa_staging patch devshell package_write_deb package_deb_install buildall"

	# ------- Sanity checks -------
	if [[ ${BBPATH} == "" ]]
	then
		echo
		echo "variable \$BBPATH not set, please set it before launching bitbake... thanx"
		return 1
	fi

	# ------- Options completion -------
	if [[ ${prev} == "-c" ]]
	then
		COMPREPLY=( $(compgen -W "${commands}" -- ${cur}) )
		return 0
	fi

	if [[ ${cur} == -* ]]
	then
    		if [[ ${cur} == --* ]]
		then
			COMPREPLY=( $(compgen -W "${options}" -- ${cur}) )
			return 0
		else
       			COMPREPLY=( $(compgen -W "${options1}" -- ${cur}) )
        		return 0
		fi
	fi

	# ------- Recipe list autocompletion -------
	for i in `echo $BBPATH | sed s/:/\ /g` ;
	do
		for j in `echo $i/packages/*/${cur}*.bb` ;
	        do
			if [[ -f $j ]]
			then
	                       	recipefile=`basename $j`
	                       	conns="$conns \\n ${recipefile%%_*.bb}"
			fi
	        done
	done
    	COMPREPLY=( $(compgen -W "${conns}" -- ${cur}) )
	return 0

}
complete -F _bitbake bitbake


--------------080202030807070309010601--
